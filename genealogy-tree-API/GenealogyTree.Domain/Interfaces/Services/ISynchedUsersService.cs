using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISynchedUsersService
    {
        Task AddSynchedUsers();
        Task<SynchedUsers> GetSynchedUser(int synchedUserId);
        Task DeleteMSynchedUser(int synchedUserId);
        Task<List<SynchedUsers>> GetAllSynchedUsersForUser(int userId);
    }
}
