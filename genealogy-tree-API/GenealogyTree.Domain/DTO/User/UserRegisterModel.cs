using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserRegisterModel
    {
        public PersonUpdateModel Person { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
