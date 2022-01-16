using AutoMapper;
using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class SynchedUsersService : BaseService, ISynchedUsersService
    {
        private readonly IMapper _mapper;

        public SynchedUsersService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<SyncedUserModel>> GetAllSynchedUsersForUser(Guid userId)
        {
            List<Sync> synchedUsers = unitOfWork.SynchedUsers.Filter(x => x.PrimaryUserId == userId).ToList();

            List<SyncedUserModel> returnEvent = _mapper.Map<List<SyncedUserModel>>(synchedUsers);
            return returnEvent;
        }

        public async Task<SyncedUserModel> GetSynchedUser(int synchedUserId)
        {
            Sync synchedUser = await unitOfWork.SynchedUsers.FindById(synchedUserId);
            SyncedUserModel returnEvent = _mapper.Map<SyncedUserModel>(synchedUser);
            return returnEvent;
        }

        public async Task<SyncedUserModel> AddSynchedUser(UsersToSyncModel usersToSync)
        {
            Sync senderSynchedUsers = new Sync()
            {
                PrimaryUserId = usersToSync.PrimaryUserId,
                SyncedUserId = usersToSync.SynchedUserId,
                SyncedPersonInPrimaryTreeId = usersToSync.SynchedPersonInPrimaryTreeId
            };
            Sync createdSenderSynchedUser = await unitOfWork.SynchedUsers.Create(senderSynchedUsers);
            SyncedUserModel returnEvent = _mapper.Map<SyncedUserModel>(createdSenderSynchedUser);

            if (usersToSync.PrimaryPersonInSynchedTreeId != 0)
            {
                Sync receiverSynchedUsers = new Sync()
                {
                    PrimaryUserId = usersToSync.SynchedUserId,
                    SyncedUserId = usersToSync.PrimaryUserId,
                    SyncedPersonInPrimaryTreeId = usersToSync.PrimaryPersonInSynchedTreeId
                };
                Sync createdReceiverSynchedUser = await unitOfWork.SynchedUsers.Create(receiverSynchedUsers);
                returnEvent = _mapper.Map<SyncedUserModel>(createdReceiverSynchedUser);
            }
            return returnEvent;
        }

        public async Task<SyncedUserModel> DeleteSynchedUser(int synchedUserId)
        {
            Sync synchedUserEntity = await unitOfWork.SynchedUsers.Delete(synchedUserId);
            SyncedUserModel returnEvent = _mapper.Map<SyncedUserModel>(synchedUserEntity);
            return returnEvent;
        }
    }
}
