using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.DTO
{
    public class UsersToSyncModel
    {
        public int PrimaryUserId { get; set; }
        public int SynchedUserId { get; set; }
        public int SynchedPersonInPrimaryTreeId { get; set; }
        public int PrimaryPersonInSynchedTreeId { get; set; }
    }
}
