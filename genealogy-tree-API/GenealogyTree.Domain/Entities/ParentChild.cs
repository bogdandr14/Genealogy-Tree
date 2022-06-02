using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class ParentChild
    {
        public int Id { get; set; }
        public bool BloodRelatives { get; set; }

        public int ParentId { get; set; }
        [ForeignKey("ParentId")]
        public virtual Person Parent { get; set; }

        public int ChildId { get; set; }
        [ForeignKey("ChildId")]
        public virtual Person Child { get; set; }

        public DateTime CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
