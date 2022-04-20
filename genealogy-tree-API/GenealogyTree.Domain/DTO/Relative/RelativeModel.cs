using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class RelativeModel
    {
        public int Id { get; set; }
        public UserDetailsModel SyncedUser { get; set; }
        public PersonDetailsModel SyncedPersonInTree { get; set; }
    }
}
