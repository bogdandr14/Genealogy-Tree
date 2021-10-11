using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class SynchedUsers
    {
        public int Id { get; set; }

        public int PrimaryUserId { get; set; }
        public int SynchedUserId { get; set; }
        public int SynchedPersonInPrimaryTreeId { get; set; }

        [ForeignKey("PrimaryUserId")]
        public virtual User PrimaryUser { get; set; }
        [ForeignKey("SynchedUserId")]
        public virtual User SynchedUser { get; set; }
        [ForeignKey("SynchedPersonInPrimaryTreeId")]
        public virtual Person SynchedPersonInPrimaryTree { get; set; }
    }
}
