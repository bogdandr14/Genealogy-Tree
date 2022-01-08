namespace GenealogyTree.Domain.DTO.Sync
{
    public class UsersToSyncModel
    {
        public int PrimaryUserId { get; set; }
        public int SynchedUserId { get; set; }
        public int SynchedPersonInPrimaryTreeId { get; set; }
        public int PrimaryPersonInSynchedTreeId { get; set; }
    }
}
