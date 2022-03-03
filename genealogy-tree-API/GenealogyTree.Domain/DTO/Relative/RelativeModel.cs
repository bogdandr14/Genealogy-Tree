using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class RelativeModel: GenericPersonModel
    {
        public int RelativeId { get; set; }
        public bool BloodRelatives { get; set; }
    }
}
