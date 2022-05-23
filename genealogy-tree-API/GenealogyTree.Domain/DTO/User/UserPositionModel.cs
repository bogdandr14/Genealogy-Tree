using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserPositionModel : PositionModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime LastVerified { get; set; }
        public ImageFile? ImageFile { get; set; }
    }
}
