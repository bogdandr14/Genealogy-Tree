using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserPositionModel : PositionModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime UpdatedOn { get; set; }
        public string Type{ get; set; }//current, live, birth

#nullable enable
        public ImageFile? ImageFile { get; set; }
    }
}
