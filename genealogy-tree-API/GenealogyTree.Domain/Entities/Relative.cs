using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Relative
    {
        public int Id { get; set; }

        public Guid PrimaryUserId { get; set; }
        [ForeignKey("PrimaryUserId")]
        public virtual User PrimaryUser { get; set; }

        public Guid RelativeUserId { get; set; }
        [ForeignKey("RelativeUserId")]
        public virtual User RelativeUser { get; set; }

        public int RelativePersonInPrimaryTreeId { get; set; }
        [ForeignKey("RelativePersonInPrimaryTreeId")]
        public virtual Person RelativePersonInPrimaryTree { get; set; }
    }
}
