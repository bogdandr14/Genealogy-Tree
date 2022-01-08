using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Sync
    {
        public int Id { get; set; }

        public int PrimaryUserId { get; set; }
        [ForeignKey("PrimaryUserId")]
        public virtual User PrimaryUser { get; set; }

        public int SyncedUserId { get; set; }
        [ForeignKey("SynchedUserId")]
        public virtual User SyncedUser { get; set; }

        public int SyncedPersonInPrimaryTreeId { get; set; }
        [ForeignKey("SyncedPersonInPrimaryTreeId")]
        public virtual Person SyncedPersonInPrimaryTree { get; set; }
    }
}
