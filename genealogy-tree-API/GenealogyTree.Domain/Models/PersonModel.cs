using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Models
{
    class PersonModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string About { get; set; }
        public string Religion { get; set; }
        public string Gender { get; set; }
        public DateTime BirthDate { get; set; }
        public string BirthState { get; set; }
        public string BirthCountry { get; set; }
        public string BirthCity { get; set; }
    }
}
