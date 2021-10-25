using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.DTO
{
    public class OccupationModel
    {
        public int Id { get; set; }
        public string OccupationName { get; set; }
        public string WorkingPlaceName { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int PersonId { get; set; }
    }
}
