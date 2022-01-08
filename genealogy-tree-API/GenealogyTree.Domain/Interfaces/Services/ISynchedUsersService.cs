using GenealogyTree.Domain.DTO.Sync;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISynchedUsersService
    {
        Task<List<SyncedUserModel>> GetAllSynchedUsersForUser(int userId);
        Task<SyncedUserModel> GetSynchedUser(int synchedUserId);
        Task<SyncedUserModel> AddSynchedUser(UsersToSyncModel usersToSync);
        Task<SyncedUserModel> DeleteSynchedUser(int synchedUserId);
    }
}
