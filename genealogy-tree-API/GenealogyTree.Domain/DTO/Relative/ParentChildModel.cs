using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class ParentChildModel: GenericPersonModel
    {
        public int ParentChildId { get; set; }
        public bool BloodRelatives { get; set; }
    }
}
