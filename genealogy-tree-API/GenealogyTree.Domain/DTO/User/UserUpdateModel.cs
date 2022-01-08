using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserUpdateModel : PersonCreateUpdateModel
    {
        public string Username { get; set; }
        public string About { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
