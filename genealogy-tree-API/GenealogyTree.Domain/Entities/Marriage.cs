using System;

namespace GenealogyTree.Domain.Entities
{
    public class Marriage
    {
        public int Id { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateEnded { get; set; }

        public int IdCouple { get; set; }

        public virtual Relationship Couple{ get; set; }
    }
}
