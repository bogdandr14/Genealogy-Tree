using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class RelativeModel
    {
        public int Id { get; set; }
        public GenericPersonModel RelativeUser { get; set; }
        public int RelativePersonInTreeId { get; set; }
    }
}
