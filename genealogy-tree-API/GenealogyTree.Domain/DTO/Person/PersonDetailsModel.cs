using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.Relative;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonDetailsModel : PersonCreateUpdateModel
    {
        public ICollection<ParentModel> Parents { get; set; }
        public ICollection<ChildModel> Children { get; set; }
        public ICollection<MarriedPersonModel> Marriages { get; set; }
    }
}
