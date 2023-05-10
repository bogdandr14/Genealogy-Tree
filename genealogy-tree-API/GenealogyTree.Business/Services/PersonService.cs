using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class PersonService : BaseService, IPersonService
    {
        private readonly IMapper _mapper;
        private readonly IImageService _imageService;
        private readonly IFileManagementService _fileManagementService;
        private readonly IParentChildService _parentChildService;
        private readonly IMarriageService _marriageService;
        private readonly IGeoService _geoService;
        private readonly ICachingService _cachingService;

        private readonly string _personKey = "person_{0}";
        private readonly string _peopleListInTreeKey = "people_list_in_tree_{0}";
        private readonly string _peopleTreeInTreeKey = "people_tree_in_tree_{0}";
        private readonly string _peopleWithoutRelativeInTreeKey = "people_without_relative_in_tree_{0}";

        public PersonService(IUnitOfWork unitOfWork, IMapper mapper, IImageService imageService, IFileManagementService fileManagementService, IParentChildService parentChildService, IMarriageService marriageService, IGeoService geoService, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _imageService = imageService;
            _fileManagementService = fileManagementService;
            _parentChildService = parentChildService;
            _marriageService = marriageService;
            _geoService = geoService;
            _cachingService = cachingService;
        }

        public async Task<PersonDetailsModel> GetPersonAsync(int personId)
        {
            PersonDetailsModel personEntity;
            if (_cachingService.IsObjectCached(CacheKey(_personKey, personId)))
            {
                return _cachingService.GetObject<PersonDetailsModel>(CacheKey(_personKey, personId));
            }
            else
            {
                Person person = await unitOfWork.Person.FindById(personId);
                personEntity = _mapper.Map<PersonDetailsModel>(person);

                personEntity.Marriages = await _marriageService.GetAllMarriagesForPerson(personId);
                personEntity.Children = await _parentChildService.GetAllChildrenForPerson(personId);
                personEntity.Parents = await _parentChildService.GetAllParentsForPerson(personId);

                if (person.RelativeForPerson != null)
                {
                    personEntity.UserId = person.RelativeForPerson.RelativeUserId;
                }
                else
                {
                    User user = unitOfWork.User.Filter(u => u.PersonId == person.Id).FirstOrDefault();

                    if (user != default(User))
                    {
                        personEntity.UserId = user.Id;
                    }
                }

                _cachingService.SetObject(CacheKey(_personKey, personId), personEntity);
            }

            foreach (var child in personEntity.Children)
            {
                child.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(child.ImageId));
            }

            foreach (var parent in personEntity.Parents)
            {
                parent.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(parent.ImageId));
            }

            personEntity.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(personEntity.ImageId));

            return personEntity;
        }

        public async Task<List<GenericPersonModel>> GetPeopleListInTree(Guid treeId)
        {
            List<GenericPersonModel> peopleInTreeModels = new List<GenericPersonModel>();

            if (_cachingService.IsObjectCached(CacheKey(_peopleListInTreeKey, treeId)))
            {
                peopleInTreeModels = _cachingService.GetObject<List<GenericPersonModel>>(CacheKey(_peopleListInTreeKey, treeId));
            }
            else
            {
                List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId)
                .Include(p => p.RelativeForPerson).ToList();
                User user = unitOfWork.User.Filter(u => u.Person.TreeId == treeId).FirstOrDefault();

                peopleInTreeModels = _mapper.Map<List<GenericPersonModel>>(poepleList);
                if(user != null)
                {
                    GenericPersonModel genericPersonModel = peopleInTreeModels.Find(person => person.PersonId == user.PersonId);
                    if(genericPersonModel!= null)
                    {
                        peopleInTreeModels.Remove(genericPersonModel);
                        genericPersonModel.UserId = user.Id;
                        peopleInTreeModels.Add(genericPersonModel);
                    }
                }
                _cachingService.SetObject(CacheKey(_peopleListInTreeKey, treeId), peopleInTreeModels);
            }

            List<GenericPersonModel> returnPeopleList = new List<GenericPersonModel>();
            foreach (var person in peopleInTreeModels)
            {
                person.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(person.ImageId));
                returnPeopleList.Add(person);
            }

            return returnPeopleList;
        }

        public async Task<List<PersonTreeInfoModel>> GetPeopleTreeDataInTree(Guid treeId)
        {
            List<PersonTreeInfoModel> peopleInTreeModels = new List<PersonTreeInfoModel>();

            if (_cachingService.IsObjectCached(CacheKey(_peopleTreeInTreeKey, treeId)))
            {
                peopleInTreeModels = _cachingService.GetObject<List<PersonTreeInfoModel>>(CacheKey(_peopleTreeInTreeKey, treeId));
            }
            else
            {
                List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId)
                    .Include(p => p.Parents)
                    .ThenInclude(p => p.Parent)
                    .Include(p => p.FirstPersonMarriages)
                    .Include(p => p.SecondPersonMarriages)
                    .Include(p => p.RelativeForPerson).ToList();

                User user = unitOfWork.User.Filter(u => u.Person.TreeId == treeId).FirstOrDefault();

                foreach(Person person in poepleList)
                {
                    PersonTreeInfoModel returnPerson = MapPersonInfo(person);
                    if (person.RelativeForPerson != null)
                    {
                        returnPerson.UserId = person.RelativeForPerson.RelativeUserId;
                    }

                    if (user != null && person.Id == user.PersonId)
                    {
                        returnPerson.UserId = user.Id;
                    }
                    peopleInTreeModels.Add(returnPerson);
                }

                peopleInTreeModels = AddPartnersToPeopleList(peopleInTreeModels);

                _cachingService.SetObject(CacheKey(_peopleTreeInTreeKey, treeId), peopleInTreeModels);
            }

            List<PersonTreeInfoModel> returnPeopleTreeData = new List<PersonTreeInfoModel>();

            foreach (var person in peopleInTreeModels)
            {
                person.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(person.ImageId));
                returnPeopleTreeData.Add(person);
            }

            return returnPeopleTreeData;
        }

        public async Task<List<EventInTreeModel>> GetEventsInTree(Guid treeId)
        {
            List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId && p.DeathDate == null).ToList();
            List<EventInTreeModel> returnEventsList = new List<EventInTreeModel>();

            foreach (var person in poepleList)
            {
                if (person.BirthDate.HasValue)
                {
                    returnEventsList.Add(new EventInTreeModel()
                    {
                        Date = (DateTime)person.BirthDate,
                        EventType = "BIRTHDAY",
                        AffectedPeople = await MapAffectedPersonBirthdayEvent(person)
                    });
                }
            }

            List<Marriage> marriages = unitOfWork.Marriage.Filter(x => x.FirstPerson.TreeId == treeId && x.SecondPerson.TreeId == treeId && x.EndDate == null)
                .Include(x => x.FirstPerson)
                .Include(x => x.SecondPerson)
                .ToList();

            foreach (var marriage in marriages)
            {
                MarriageDetailsModel returnMarriage = _mapper.Map<MarriageDetailsModel>(marriage);
                returnMarriage.PersonMarriedTo.ImageFile = await _fileManagementService.GetFile(marriage.FirstPerson != null ? marriage.FirstPerson.Image : marriage.SecondPerson.Image);

                returnEventsList.Add(new EventInTreeModel()
                {
                    Date = marriage.StartDate,
                    EventType = "MARRIAGE",
                    AffectedPeople = await MapAffectedMarriageAnniversaryEvent(marriage)
                });
            }

            return returnEventsList;
        }

        public async Task<List<GenericPersonModel>> GetPeopleWithoutRelative(Guid treeId)
        {
            List<GenericPersonModel> peopleWithoutRelatives;
            if (_cachingService.IsObjectCached(CacheKey(_peopleWithoutRelativeInTreeKey, treeId)))
            {
                peopleWithoutRelatives = _cachingService.GetObject<List<GenericPersonModel>>(CacheKey(_peopleWithoutRelativeInTreeKey, treeId));
            }
            else
            {
                User user = unitOfWork.User.Filter(u => u.Person.TreeId == treeId).FirstOrDefault();
                List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId && p.RelativeForPerson == null && p.Id != user.PersonId).ToList();
                peopleWithoutRelatives = _mapper.Map<List<GenericPersonModel>>(poepleList);
                _cachingService.SetObject(CacheKey(_peopleWithoutRelativeInTreeKey, treeId), peopleWithoutRelatives);
            }

            List<GenericPersonModel> returnPeopleList = new List<GenericPersonModel>();
            foreach (var person in peopleWithoutRelatives)
            {
                person.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(person.ImageId));
                returnPeopleList.Add(person);
            }

            return returnPeopleList;
        }

        private async Task<List<PersonBaseModel>> MapAffectedMarriageAnniversaryEvent(Marriage marriage)
        {
            List<PersonBaseModel> peopleList = new List<PersonBaseModel>();
            peopleList.Add(await MapToPersonBaseModel(marriage.FirstPerson));
            peopleList.Add(await MapToPersonBaseModel(marriage.SecondPerson));

            return peopleList;
        }

        private async Task<List<PersonBaseModel>> MapAffectedPersonBirthdayEvent(Person person)
        {
            List<PersonBaseModel> peopleList = new List<PersonBaseModel>();
            peopleList.Add(await MapToPersonBaseModel(person));

            return peopleList;
        }

        private async Task<PersonBaseModel> MapToPersonBaseModel(Person person)
        {
            return new PersonBaseModel()
            {
                FirstName = person.FirstName,
                LastName = person.LastName,
                PersonId = person.Id,
                ImageFile = person.ImageId != null ? await _fileManagementService.GetFile(await _imageService.GetImageAsync(person.ImageId)) : null
            };
        }

        private PersonTreeInfoModel MapPersonInfo(Person person)
        {
            PersonTreeInfoModel returnPerson = _mapper.Map<PersonTreeInfoModel>(person);
            foreach (var parent in person.Parents)
            {
                if (parent.Parent.Gender == 'm')
                {
                    returnPerson.FatherId = parent.ParentId;
                }
                if (parent.Parent.Gender == 'f')
                {
                    returnPerson.MotherId = parent.ParentId;
                }
            }

            returnPerson.PartnersIds = new List<int>();
            foreach (var marriage in person.FirstPersonMarriages)
            {
                returnPerson.PartnersIds.Add(marriage.SecondPersonId);
            }

            foreach (var marriage in person.SecondPersonMarriages)
            {
                returnPerson.PartnersIds.Add(marriage.FirstPersonId);
            }

            return returnPerson;
        }

        private static List<PersonTreeInfoModel> AddPartnersToPeopleList(List<PersonTreeInfoModel> peopleList)
        {
            List<PersonTreeInfoModel> updatedList = new List<PersonTreeInfoModel>();

            foreach (var person in peopleList)
            {
                if (updatedList.FindIndex(x => x.PersonId == person.PersonId) == -1)
                {
                    updatedList.Add(person);
                }

                if (person.FatherId != 0 && person.MotherId != 0)
                {
                    UpdateMother(ref updatedList, ref peopleList, person);

                    UpdateFather(ref updatedList, ref peopleList, person);
                }

            }
            return updatedList;
        }

        private static void UpdateMother(ref List<PersonTreeInfoModel> updatedList, ref List<PersonTreeInfoModel> peopleList, PersonTreeInfoModel person)
        {
            PersonTreeInfoModel mother = updatedList.Find(x => x.PersonId == person.MotherId);
            if (mother != default(PersonTreeInfoModel))
            {
                updatedList.Remove(mother);
            }
            else
            {
                mother = peopleList.Find(x => x.PersonId == person.MotherId);
            }

            if (mother.PartnersIds.FirstOrDefault(id => id == person.FatherId) == 0)
            {
                mother.PartnersIds.Add(person.FatherId);
            }
            updatedList.Add(mother);
        }

        private static void UpdateFather(ref List<PersonTreeInfoModel> updatedList, ref List<PersonTreeInfoModel> peopleList, PersonTreeInfoModel person)
        {
            PersonTreeInfoModel father = updatedList.Find(x => x.PersonId == person.FatherId);
            if (father != default(PersonTreeInfoModel))
            {
                updatedList.Remove(father);
            }
            else
            {
                father = peopleList.Find(x => x.PersonId == person.FatherId);
            }

            if (father.PartnersIds.FirstOrDefault(id => id == person.MotherId) == default(int))
            {
                father.PartnersIds.Add(person.MotherId);
            }
            updatedList.Add(father);
        }

        public async Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person)
        {
            if (person == null)
            {
                return null;
            }

            Person personEntity = await addLocations(person);
            personEntity = removeAttachedEntities(personEntity);
            personEntity.CreatedOn = DateTime.UtcNow;
            personEntity = await unitOfWork.Person.Create(personEntity);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            RemoveCachedResources(personEntity.TreeId);

            return returnEvent;
        }

        private static Person removeAttachedEntities(Person personEntity)
        {
            personEntity.Nationality = null;
            personEntity.Religion = null;
            personEntity.BirthPlace = null;
            personEntity.LivingPlace = null;
            personEntity.RelativeForPerson = null;

            return personEntity;
        }

        private async Task<Person> addLocations(PersonCreateUpdateModel person)
        {
            Person personEntity = _mapper.Map<Person>(person);

            if (personEntity.LivingPlace == null)
            {
                personEntity.LivingPlace = new Location();
            }

            personEntity.LivingPlaceId = (await unitOfWork.Location.Create(personEntity.LivingPlace)).Id;

            if (personEntity.BirthPlace == null)
            {
                personEntity.BirthPlace = new Location();
            }

            personEntity.BirthPlaceId = (await unitOfWork.Location.Create(personEntity.BirthPlace)).Id;

            return personEntity;
        }

        public async Task<PersonDetailsModel> UpdatePersonAsync(PersonCreateUpdateModel person)
        {
            if (person == null)
            {
                return null;
            }

            Person personInDb = await unitOfWork.Person.FindById(person.PersonId);
            if (personInDb == null)
            {
                return null;
            }

            personInDb.FirstName = person.FirstName;
            personInDb.LastName = person.LastName;
            personInDb.Gender = person.Gender[0];
            personInDb.BirthDate = person.BirthDate;
            personInDb.DeathDate = person.DeathDate;
            personInDb.ModifiedOn = DateTime.UtcNow;
            personInDb.NationalityId = person.Nationality.Id;
            personInDb.ReligionId = person.Religion.Id;

            if (person.LivingPlace != null)
            {
                personInDb.LivingPlace.State = person.LivingPlace.State;
                personInDb.LivingPlace.Country = person.LivingPlace.Country;
                personInDb.LivingPlace.City = person.LivingPlace.City;
                Coordinates coordinates = await _geoService.GetCoordinatesAsync(person.LivingPlace.State, person.LivingPlace.Country, person.LivingPlace.City);
                if (coordinates != null)
                {
                    personInDb.LivingPlace.Latitude = coordinates.Latitude;
                    personInDb.LivingPlace.Longitude = coordinates.Longitude;
                }
            }

            if (person.BirthPlace != null)
            {
                personInDb.BirthPlace.State = person.BirthPlace.State;
                personInDb.BirthPlace.Country = person.BirthPlace.Country;
                personInDb.BirthPlace.City = person.BirthPlace.City;
                Coordinates coordinates = await _geoService.GetCoordinatesAsync(person.BirthPlace.State, person.BirthPlace.Country, person.BirthPlace.City);
                if (coordinates != null)
                {
                    personInDb.BirthPlace.Latitude = coordinates.Latitude;
                    personInDb.BirthPlace.Longitude = coordinates.Longitude;
                }
            }

            await updateLocations(personInDb);

            Person personEntity = await unitOfWork.Person.Update(personInDb);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            returnEvent.ImageFile = await _fileManagementService.GetFile(personEntity.Image);
            RemoveCachedResources(personEntity.TreeId);
            _cachingService.Remove(CacheKey(_personKey, personEntity.Id));

            return returnEvent;
        }

        private async Task updateLocations(Person person)
        {
            if (person.LivingPlace != null && person.LivingPlace.Id != 0)
            {
                await unitOfWork.Location.Update(person.LivingPlace);
            }

            if (person.BirthPlace != null && person.BirthPlace.Id != 0)
            {
                await unitOfWork.Location.Update(person.BirthPlace);
            }

        }

        private void RemoveCachedResources(Guid treeId)
        {
            _cachingService.Remove(CacheKey(_peopleListInTreeKey, treeId));
            _cachingService.Remove(CacheKey(_peopleTreeInTreeKey, treeId));
            _cachingService.Remove(CacheKey(_peopleWithoutRelativeInTreeKey, treeId));          
        }

        public async Task<ImageFile> UpdatePictureAsync(int personId, int imageId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            int oldImageId = (person.ImageId == null) ? 0 : (int)person.ImageId;
            person.ImageId = imageId;
            Person personEntity = await unitOfWork.Person.Update(person);

            if (oldImageId != 0)
            {
                await checkImageUsageAsync(oldImageId);
            }
            return await _fileManagementService.GetFile(personEntity.Image);
        }

        public async Task<PersonDetailsModel> DeletePersonAsync(int personId)
        {
            List<int> parentChildIds = unitOfWork.ParentChild.Filter(parentChild => parentChild.ParentId == personId || parentChild.ChildId == personId).Select(parentChild => parentChild.Id).ToList();

            foreach (var parentChildId in parentChildIds)
            {
                await _parentChildService.DeleteParentChildAsync(parentChildId);
            }

            List<int> marriageIds = unitOfWork.Marriage.Filter(marriage => marriage.FirstPersonId == personId || marriage.SecondPersonId == personId).Select(marriage => marriage.Id).ToList();

            foreach (var marriageId in marriageIds)
            {
                await _marriageService.DeleteMarriageAsync(marriageId);
            }

            Person personEntity = await unitOfWork.Person.Delete(personId);
            _cachingService.Remove(CacheKey(_personKey, personEntity.Id));
            RemoveCachedResources(personEntity.TreeId);

            int oldImageId = (personEntity.ImageId == null) ? 0 : (int)personEntity.ImageId;

            if (oldImageId != 0)
            {
                await checkImageUsageAsync(oldImageId);
            }

            return _mapper.Map<PersonDetailsModel>(personEntity);
        }

        private async Task checkImageUsageAsync(int imageId)
        {
            Image image = await _imageService.GetImageAsync(imageId);

            if (!image.People.Any())
            {
                await _imageService.DeleteImageAsync(imageId);
            }
        }
    }
}
