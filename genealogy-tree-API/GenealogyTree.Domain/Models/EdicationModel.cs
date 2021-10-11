using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Models
{
    public class EdicationModel
    {
        public int Id { get; set; }
        public string EducationInstituteName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public int EducationLevelId { get; set; }
        public string PersonName { get; set; }
    }
}
