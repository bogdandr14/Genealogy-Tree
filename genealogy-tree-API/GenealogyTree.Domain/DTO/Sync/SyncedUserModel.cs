using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.Sync
{
    public class SyncedUserModel
    {
        public int Id { get; set; }
        public UserDetailsModel SyncedUser { get; set; }
        public PersonDetailsModel SyncedPersonInTree { get; set; }
    }
}
