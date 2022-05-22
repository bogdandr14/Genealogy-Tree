using AutoMapper;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class RelativeService : BaseService, IRelativeService
    {
        private readonly IMapper _mapper;

        public RelativeService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
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
        public async Task<RelativePositionModel> GetRelativesPosition(Guid userId)
        {

        }
    }
}
