using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface ISynchedUsersService
    {
        Task AddSynchedUsers();
        Task<SynchedUser> GetSynchedUser(int synchedUserId);
        Task DeleteMSynchedUser(int synchedUserId);
        Task<List<SynchedUser>> GetAllSynchedUsersForUser(int userId);
    }
}
