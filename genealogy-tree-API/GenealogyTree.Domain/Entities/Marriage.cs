using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Marriage
    {
        public int Id { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateEnded { get; set; }

        public int CoupleId { get; set; }

        [ForeignKey("CoupleId")]
        public virtual Relationship Couple { get; set; }
    }
}
