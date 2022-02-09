using System;

namespace GenealogyTree.Domain.DTO
{
    public class OccupationModel
    {
        public int Id { get; set; }
        public Guid UserId { get; set; }
        public string OccupationName { get; set; }
        public string WorkingPlaceName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}
