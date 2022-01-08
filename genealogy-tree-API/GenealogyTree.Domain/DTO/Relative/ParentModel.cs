using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class ParentModel: GenericRelativeModel
    {
        public PersonDetailsModel Parent { get; set; }
    }
}
