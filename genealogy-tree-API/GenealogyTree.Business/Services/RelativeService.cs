using AutoMapper;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.User;
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
            List<Relative> relatives = unitOfWork.Relatives.Filter(x => x.PrimaryUserId == userId).ToList();

            List<RelativeModel> returnEvent = _mapper.Map<List<RelativeModel>>(relatives);
            return returnEvent;
        }

        public async Task<RelativeModel> GetRelative(int relativeId)
        {
            Relative relative = await unitOfWork.Relatives.FindById(relativeId);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(relative);
            return returnEvent;
        }
        public async  Task<bool> CanAddRelative(Guid userId, Guid relativeId)
        {
            bool isAlreadyRelative = unitOfWork.Relatives.Filter(r => (r.PrimaryUserId == userId && r.RelativeUserId == relativeId)).Any();
            if (isAlreadyRelative)
            {
                return false;
            }
            bool requestAlreadySent = unitOfWork.Requests.Filter(r => r.SenderId == userId && r.ReceiverId == relativeId && r.ReceiverResponded == false).Any();
            return !requestAlreadySent;
        }


        public async Task<RelativeModel> AddRelativeUser(UsersToLinkModel usersToLink)
        {
            Relative senderRelative = new Relative()
            {
                PrimaryUserId = usersToLink.PrimaryUserId,
                RelativeUserId = usersToLink.LinkedUserId,
                RelativePersonInPrimaryTreeId = usersToLink.LinkedPersonInPrimaryTreeId
            };
            Relative createdSenderRelative = await unitOfWork.Relatives.Create(senderRelative);
            RelativeModel returnEvent = _mapper.Map<RelativeModel>(createdSenderRelative);

            if (usersToLink.PrimaryPersonInRelativeTreeId != 0)
            {
                Relative receiverRelative = new Relative()
                {
                    PrimaryUserId = usersToLink.LinkedUserId,
                    RelativeUserId = usersToLink.PrimaryUserId,
                    RelativePersonInPrimaryTreeId = usersToLink.PrimaryPersonInRelativeTreeId
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
                                                    .Select(relative => relative.RelativeUser).ToList();

            List<UserPositionModel> returnEvent = new List<UserPositionModel>();
            foreach (var relative in relativeUsers)
            {
                UserPositionModel userPositionToReturn = _mapper.Map<UserPositionModel>(relative);
                userPositionToReturn.ImageFile = await _fileManagementService.GetFile(relative.Person.Image);
                returnEvent.Add(userPositionToReturn);
            }
            return returnEvent;
        }
    }
}
