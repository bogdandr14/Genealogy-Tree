using GenealogyTree.Domain.DTO.Generic;

namespace GenealogyTree.Domain.DTO.ParentChild
{
    public class ParentChildCreateUpdateModel : GenericRelativeModel
    {
        public int ParentId { get; set; }
        public int ChildId { get; set; }
    }
}
