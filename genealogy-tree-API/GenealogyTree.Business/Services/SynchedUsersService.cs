using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
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

        public async Task<List<SynchedUserModel>> GetAllSynchedUsersForUser(int userId)
        {
            List<SynchedUsers> synchedUsers = unitOfWork.SynchedUsers.Filter(x => x.PrimaryUserId == userId).ToList();

            List<SynchedUserModel> returnEvent = _mapper.Map<List<SynchedUserModel>>(synchedUsers);
            return returnEvent;
        }

        public async Task<SynchedUserModel> GetSynchedUser(int synchedUserId)
        {
            SynchedUsers synchedUser = await unitOfWork.SynchedUsers.FindById(synchedUserId);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(synchedUser);
            return returnEvent;
        }

        public async Task<SynchedUserModel> AddSynchedUser(UsersToSyncModel usersToSync)
        {
            SynchedUsers senderSynchedUsers = new SynchedUsers()
            {
                PrimaryUserId = usersToSync.PrimaryUserId,
                SynchedUserId = usersToSync.SynchedUserId,
                SynchedPersonInPrimaryTreeId = usersToSync.SynchedPersonInPrimaryTreeId
            };
            SynchedUsers createdSenderSynchedUser = await unitOfWork.SynchedUsers.Create(senderSynchedUsers);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(createdSenderSynchedUser);

            if (usersToSync.PrimaryPersonInSynchedTreeId != 0)
            {
                SynchedUsers receiverSynchedUsers = new SynchedUsers()
                {
                    PrimaryUserId = usersToSync.SynchedUserId,
                    SynchedUserId = usersToSync.PrimaryUserId,
                    SynchedPersonInPrimaryTreeId = usersToSync.PrimaryPersonInSynchedTreeId
                };
                SynchedUsers createdReceiverSynchedUser = await unitOfWork.SynchedUsers.Create(receiverSynchedUsers);
                returnEvent = _mapper.Map<SynchedUserModel>(createdReceiverSynchedUser);
            }
            return returnEvent;
        }

        public async Task<SynchedUserModel> DeleteMSynchedUser(int synchedUserId)
        {
            SynchedUsers synchedUserEntity = await unitOfWork.SynchedUsers.Delete(synchedUserId);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(synchedUserEntity);
            return returnEvent;
        }
    }
}
