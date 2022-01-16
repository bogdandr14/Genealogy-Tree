using System;

namespace GenealogyTree.Domain.DTO.Sync
{
    public class UsersToSyncModel
    {
        public Guid PrimaryUserId { get; set; }
        public Guid SynchedUserId { get; set; }
        public int SynchedPersonInPrimaryTreeId { get; set; }
        public int PrimaryPersonInSynchedTreeId { get; set; }
    }
}
