using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class ChildModel : GenericRelativeModel
    {
        public PersonDetailsModel Child { get; set; }
    }
}
