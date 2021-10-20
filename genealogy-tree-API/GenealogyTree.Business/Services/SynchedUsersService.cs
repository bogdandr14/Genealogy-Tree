using AutoMapper;
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
            List<SynchedUser> synchedUsers = unitOfWork.SynchedUsers.Filter(x => x.PrimaryUserId == userId).ToList();

            List<SynchedUserModel> returnEvent = _mapper.Map<List<SynchedUserModel>>(synchedUsers);
            return returnEvent;
        }

        public async Task<SynchedUserModel> GetSynchedUser(int synchedUserId)
        {
            SynchedUser synchedUser = await unitOfWork.SynchedUsers.FindById(synchedUserId);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(synchedUser);
            return returnEvent;
        }

        public async Task<SynchedUserModel> AddSynchedUser(SynchedUserModel synchedUser)
        {
            SynchedUser synchedUserEntity = _mapper.Map<SynchedUser>(synchedUser);
            SynchedUser createdSynchedUser = await unitOfWork.SynchedUsers.Create(synchedUserEntity);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(createdSynchedUser);
            return returnEvent;
        }

        public async Task<SynchedUserModel> DeleteMSynchedUser(int synchedUserId)
        {
            SynchedUser synchedUserEntity = await unitOfWork.SynchedUsers.Delete(synchedUserId);
            SynchedUserModel returnEvent = _mapper.Map<SynchedUserModel>(synchedUserEntity);
            return returnEvent;
        }
    }
}
