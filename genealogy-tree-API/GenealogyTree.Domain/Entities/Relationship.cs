using System;

namespace GenealogyTree.Domain.Entities
{
    public class Relationship
    {
        public int Id { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        public int? IdFirstPerson { get; set; }
        public int? IdSecondPerson { get; set; }

        public virtual Person FirstPerson { get; set; }
        public virtual Person SecondPerson { get; set; }
    }
}
