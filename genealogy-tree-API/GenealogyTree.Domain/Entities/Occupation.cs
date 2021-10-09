using System;

namespace GenealogyTree.Domain.Entities
{
    public class Occupation
    {
        public int Id { get; set; }
        public string OccupationName{ get; set; }
        public string WorkingPlaceName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        public int IdUser { get; set; }


        public virtual User User { get; set; }
    }
}
