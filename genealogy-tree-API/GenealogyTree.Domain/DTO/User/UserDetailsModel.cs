using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Models
{
    public class UserDetailsModel
    {
        public PersonDetailsModel Person { get; set; }
        public string Username { get; set; }
        public bool SharePersonalInfo { get; set; }
    }
}
