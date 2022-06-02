using GenealogyTree.Domain.DTO.Person;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO
{
    public class RelativeUpdates
    {
        public RelativeUpdates()
        {
            this.Updates = new List<UpdateInfoModel>();
        }
        public int RelativeId { get; set; }
        public GenericPersonModel Relative { get; set; }
        public List<UpdateInfoModel> Updates { get; set; }
    }
}
