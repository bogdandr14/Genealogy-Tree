using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
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

        public PersonService(IUnitOfWork unitOfWork, IMapper mapper, IImageService imageService, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _imageService = imageService;
            _fileManagementService = fileManagementService;
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

        public async Task<List<GenericPersonModel>> GetAllPeopleInTree(Guid treeId)
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
            personEntity.Gender = null;
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
            personEntity.ImageId = person.ImageFile.Id;
            personEntity = await unitOfWork.Person.Update(personEntity);
            PersonDetailsModel returnEvent = _mapper.Map<PersonDetailsModel>(personEntity);
            returnEvent.ImageFile = await _fileManagementService.GetFile(personEntity.Image);
            return returnEvent;
        }

        private async Task updateLocations(PersonCreateUpdateModel person)
        {
            if (person.LivingPlace != null)
            {
                Location locationEntity = _mapper.Map<Location>(person.LivingPlace);
                await unitOfWork.Location.Update(locationEntity);
            }
            if (person.BirthPlace != null)
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
