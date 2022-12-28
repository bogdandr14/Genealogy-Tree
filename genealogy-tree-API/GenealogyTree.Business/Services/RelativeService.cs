using AutoMapper;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Enums;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class RelativeService : BaseService, IRelativeService
    {
        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;

        public RelativeService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<List<RelativeModel>> GetAllRelativesForUser(Guid userId)
        {
            List<Relative> relatives = unitOfWork.Relatives.Filter(x => x.PrimaryUserId == userId).Include(r => r.RelativeUser).ThenInclude(u => u.Person).ToList();
            List<RelativeModel> returnEvent = new List<RelativeModel>();

            foreach (var relative in relatives)
            {
                RelativeModel personToReturn = _mapper.Map<RelativeModel>(relative);
                personToReturn.RelativeUser.ImageFile = await _fileManagementService.GetFile(relative.RelativeUser.Person.Image);
                returnEvent.Add(personToReturn);
            }

            return returnEvent;
        }

        public async Task<RelativeModel> GetRelative(int relativeId)
        {
            Relative relative = await unitOfWork.Relatives.FindById(relativeId);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(relative);

            return returnEvent;
        }
        public async Task<RelativeState> CheckRelative(Guid userId, Guid relativeId)
        {
            bool isAlreadyRelative = await Task.Run(() => unitOfWork.Relatives.Filter(r => (r.PrimaryUserId == userId && r.RelativeUserId == relativeId)).Any());

            if (isAlreadyRelative)
            {
                return RelativeState.Related;
            }

            bool requestAlreadySent = await Task.Run(() => unitOfWork.Requests.Filter(r => (r.SenderId == userId && r.ReceiverId == relativeId) || (r.SenderId == relativeId && r.ReceiverId == userId)).Any());

            if (requestAlreadySent)
            {
                return RelativeState.Requested;
            }

            return RelativeState.Unrelated;
        }

        public async Task<RelativeModel> MarkChanges(int relativeId)
        {
            Relative relativeToUpdate = await unitOfWork.Relatives.FindById(relativeId);
            relativeToUpdate.LastSyncCheck = DateTime.Now;
            Relative relativeEntity = await unitOfWork.Relatives.Update(relativeToUpdate);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(relativeEntity);

            return returnEvent;
        }


        public async Task<RelativeModel> AddRelativeUser(UsersToLinkModel usersToLink)
        {
            Relative senderRelative = new Relative()
            {
                PrimaryUserId = usersToLink.PrimaryUserId,
                RelativeUserId = usersToLink.LinkedUserId,
                RelativePersonInPrimaryTreeId = usersToLink.LinkedPersonInPrimaryTreeId,
                LastSyncCheck = DateTime.UtcNow
            };
            Relative createdSenderRelative = await unitOfWork.Relatives.Create(senderRelative);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(createdSenderRelative);

            if (usersToLink.PrimaryPersonInRelativeTreeId != 0)
            {
                Relative receiverRelative = new Relative()
                {
                    PrimaryUserId = usersToLink.LinkedUserId,
                    RelativeUserId = usersToLink.PrimaryUserId,
                    RelativePersonInPrimaryTreeId = usersToLink.PrimaryPersonInRelativeTreeId,
                    LastSyncCheck = DateTime.UtcNow
                };
                Relative createdReceiverRelative = await unitOfWork.Relatives.Create(receiverRelative);
                returnEvent = _mapper.Map<RelativeModel>(createdReceiverRelative);
            }

            return returnEvent;
        }

        public async Task<RelativeModel> DeleteRelative(int relativeId)
        {
            Relative relativeEntity = await unitOfWork.Relatives.Delete(relativeId);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(relativeEntity);

            return returnEvent;
        }

        public async Task<List<UserPositionModel>> GetRelativesPosition(Guid userId)
        {
            List<User> relativeUsers = unitOfWork.Relatives.Filter(relative => relative.PrimaryUserId == userId)
                                                    .Include(r => r.RelativeUser)
                                                        .ThenInclude(ru => ru.Position)
                                                    .Include(r => r.RelativeUser)
                                                        .ThenInclude(ru => ru.Person)
                                                    .Where(relative => relative.RelativeUser.ShareLocation && relative.RelativeUser.Position.UpdatedOn != null)
                                                    .Select(relative => relative.RelativeUser).ToList();

            List<UserPositionModel> returnEvent = new List<UserPositionModel>();
            foreach (var relative in relativeUsers)
            {
                UserPositionModel userPositionToReturn = _mapper.Map<UserPositionModel>(relative);
                userPositionToReturn.ImageFile = await _fileManagementService.GetFile(relative.Person.Image);
                returnEvent.Add(userPositionToReturn);
            }

            User user = unitOfWork.User.Filter(user => user.Id == userId).Include(ru => ru.Person).FirstOrDefault();

            List<Person> people = unitOfWork.Person.Filter(person => person.TreeId == user.Person.TreeId)
                        .Include(p => p.LivingPlace)
                        .Include(p => p.BirthPlace)
                        .ToList();
            foreach (var person in people)
            {
                if (person.LivingPlace.Latitude != default(float) && person.LivingPlace.Longitude != default(float))
                {
                    returnEvent.Add(await MapLivingPlaceAsync(person));
                }

                if (person.BirthPlace.Latitude != default(float) && person.BirthPlace.Longitude != default(float))
                {
                    returnEvent.Add(await MapBirthPlaceAsync(person));
                }
            }
            return returnEvent;
        }

        private async Task<UserPositionModel> MapLivingPlaceAsync(Person person)
        {
            return new UserPositionModel()
            {
                PersonId = person.Id,
                FirstName = person.FirstName,
                LastName = person.LastName,
                Latitude = person.LivingPlace.Latitude,
                Longitude = person.LivingPlace.Longitude,
                Type = "LIVING",
                ImageFile = await _fileManagementService.GetFile(person.Image)
            };
        }


        private async Task<UserPositionModel> MapBirthPlaceAsync(Person person)
        {
            return new UserPositionModel()
            {
                PersonId = person.Id,
                FirstName = person.FirstName,
                LastName = person.LastName,
                Latitude = person.BirthPlace.Latitude,
                Longitude = person.BirthPlace.Longitude,
                Type = "BIRTH",
                ImageFile = await _fileManagementService.GetFile(person.Image)
            };
        }
    }
}
