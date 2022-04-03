using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonTreeInfoModel: GenericPersonModel
    {
        public int FatherId { get; set; }
        public int MotherId { get; set; }
        public ICollection<int> PartnersIds { get; set; }
    }
}
