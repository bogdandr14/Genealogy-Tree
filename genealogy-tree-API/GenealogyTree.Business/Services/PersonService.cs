using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
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
        public PersonService(IUnitOfWork unitOfWork, IMapper mapper, IImageService imageService, IFileManagementService fileManagementService, IParentChildService parentChildService, IMarriageService marriageService) : base(unitOfWork)
        {
            _mapper = mapper;
            _imageService = imageService;
            _fileManagementService = fileManagementService;
            _parentChildService = parentChildService;
            _marriageService = marriageService;
        }

        public async Task<List<PersonDetailsModel>> FindPeople(string name)
        {
            List<Person> people = unitOfWork.Person.Filter(x => string.Format("{0} {1}", x.FirstName, x.LastName).Contains(name))
                                    .OrderBy(x => x.FirstName).ToList();
            List<PersonDetailsModel> returnPoepleList = new List<PersonDetailsModel>();
            foreach (var person in people)
            {
                PersonDetailsModel returnPerson = _mapper.Map<PersonDetailsModel>(person);
                returnPerson.ImageFile = await _fileManagementService.GetFile(person.Image);
                returnPoepleList.Add(returnPerson);
            }
            return _mapper.Map<List<PersonDetailsModel>>(people);
        }

        public async Task<PersonDetailsModel> GetPersonAsync(int personId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            PersonDetailsModel personEntity = _mapper.Map<PersonDetailsModel>(person);
            personEntity.Marriages = await _marriageService.GetAllMarriagesForPerson(personId);

            personEntity.Children = await _parentChildService.GetAllChildrenForPerson(personId);
            foreach (var child in personEntity.Children)
            {
                child.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(child.ImageId));
            }
            personEntity.Parents = await _parentChildService.GetAllParentsForPerson(personId);

            foreach (var parent in personEntity.Parents)
            {
                parent.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(parent.ImageId));
            }
            personEntity.ImageFile = await _fileManagementService.GetFile(person.Image);
            if (person.SyncedUserToPerson != null)
            {
                personEntity.UserId = person.SyncedUserToPerson.SyncedUserId;
            }
            else
            {
                User user = unitOfWork.User.Filter(u => u.PersonId == person.Id).FirstOrDefault();
                if (user != default(User))
                {
                    personEntity.UserId = user.Id;
                }
            }
            return personEntity;
        }

        public async Task<List<GenericPersonModel>> GetPeopleListInTree(Guid treeId)
        {
            List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId).ToList();
            List<GenericPersonModel> returnPeopleList = new List<GenericPersonModel>();
            User user = unitOfWork.User.Filter(u => u.Person.TreeId == treeId).FirstOrDefault();
            foreach (var person in poepleList)
            {
                GenericPersonModel returnPerson = _mapper.Map<GenericPersonModel>(person);
                returnPerson.ImageFile = await _fileManagementService.GetFile(person.Image);
                if (person.SyncedUserToPerson != null)
                {
                    returnPerson.UserId = person.SyncedUserToPerson.SyncedUserId;
                }
                if (person.Id == user.PersonId)
                {
                    returnPerson.UserId = user.Id;
                }
                returnPeopleList.Add(returnPerson);
            }
            return returnPeopleList;
        }

        public async Task<List<PersonTreeInfoModel>> GetPeopleTreeDataInTree(Guid treeId)
        {
            List<Person> poepleList = unitOfWork.Person.Filter(p => p.TreeId == treeId).Include(p => p.Parents).ThenInclude(p => p.Parent).Include(p => p.FirstPersonMarriages).Include(p => p.SecondPersonMarriages).ToList();
            List<PersonTreeInfoModel> returnPeopleTreeData = new List<PersonTreeInfoModel>();
            User user = unitOfWork.User.Filter(u => u.Person.TreeId == treeId).FirstOrDefault();

            foreach (var person in poepleList)
            {
                PersonTreeInfoModel returnPerson = MapPersonInfo(person);
                returnPerson.ImageFile = await _fileManagementService.GetFile(person.Image);
                if (person.SyncedUserToPerson != null)
                {
                    returnPerson.UserId = person.SyncedUserToPerson.SyncedUserId;
                }
                if (person.Id == user.PersonId)
                {
                    returnPerson.UserId = user.Id;
                }
                returnPeopleTreeData.Add(returnPerson);
            }
            returnPeopleTreeData = AddPartnersToPeopleList(returnPeopleTreeData);
            return returnPeopleTreeData;
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

        private List<PersonTreeInfoModel> AddPartnersToPeopleList(List<PersonTreeInfoModel> peopleList)
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
                    PersonTreeInfoModel mother = updatedList.Find(x => x.PersonId == person.MotherId);
                    if (mother != default(PersonTreeInfoModel))
                    {
                        updatedList.Remove(mother);
                    }
                    else
                    {
                        mother = peopleList.Find(x => x.PersonId == person.MotherId);
                    }
                    if (mother.PartnersIds.FirstOrDefault(id => id == person.FatherId) == default(int))
                    {
                        mother.PartnersIds.Add(person.FatherId);
                    }
                    updatedList.Add(mother);

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

            }
            return updatedList;
        }

        public async Task<PersonDetailsModel> AddPersonAsync(PersonCreateUpdateModel person)
        {
            if (person == null)
            {
                return null;
            }
            Person personEntity = await addLocations(person);
            personEntity = removeAttachedEntities(personEntity);
            personEntity = await unitOfWork.Person.Create(personEntity);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            returnEvent.ImageFile = await _fileManagementService.GetFile(personEntity.Image);
            return returnEvent;
        }
        private Person removeAttachedEntities(Person personEntity)
        {
            personEntity.Nationality = null;
            personEntity.Religion = null;
            personEntity.BirthPlace = null;
            personEntity.LivingPlace = null;
            personEntity.SyncedUserToPerson = null;
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
            Person personEntity = _mapper.Map<Person>(person);
            await updateLocations(person);
            if (person.LivingPlace.Id == 0)
            {
                person.LivingPlace = null;
            }
            if (person.BirthPlace.Id == 0)
            {
                person.BirthPlace = null;
            }

            personEntity = await unitOfWork.Person.Update(personEntity);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            returnEvent.ImageFile = await _fileManagementService.GetFile(personEntity.Image);
            return returnEvent;
        }

        private async Task updateLocations(PersonCreateUpdateModel person)
        {
            if (person.LivingPlace != null && person.LivingPlace.Id != 0)
            {
                Location locationEntity = _mapper.Map<Location>(person.LivingPlace);
                await unitOfWork.Location.Update(locationEntity);
            }
            if (person.BirthPlace != null && person.BirthPlace.Id != 0)
            {
                Location locationEntity = _mapper.Map<Location>(person.BirthPlace);
                await unitOfWork.Location.Update(locationEntity);
            }
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
            Person personEntity = await unitOfWork.Person.Delete(personId);
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
            if (image.People.Count() == 0)
            {
                await _imageService.DeleteImageAsync(imageId);
            }
        }
    }
}
