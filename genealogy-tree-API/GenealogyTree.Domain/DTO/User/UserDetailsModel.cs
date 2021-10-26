using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserDetailsModel
    {
        public PersonDetailsModel Person { get; set; }
        public string Username { get; set; }
        public bool SharePersonalInfo { get; set; }
    }
}
