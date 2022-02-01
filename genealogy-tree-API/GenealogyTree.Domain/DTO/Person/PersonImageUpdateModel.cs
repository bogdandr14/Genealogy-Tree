using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonImageUpdateModel
    {
        public int PersonId { get; set; }
        public string ImageUpdate { get; set; }
    }
}
