using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISynchedUsersService
    {
        Task<List<SynchedUserModel>> GetAllSynchedUsersForUser(int userId);
        Task<SynchedUserModel> GetSynchedUser(int synchedUserId);
        Task<SynchedUserModel> AddSynchedUser(UsersToSyncModel usersToSync);
        Task<SynchedUserModel> DeleteSynchedUser(int synchedUserId);
    }
}
