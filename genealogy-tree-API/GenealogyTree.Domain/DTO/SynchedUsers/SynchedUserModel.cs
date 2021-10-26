using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.SynchedUser
{
    public class SynchedUserModel
    {
        public int Id { get; set; }
        public UserDetailsModel SynchedUser { get; set; }
        public PersonDetailsModel SynchedPersonInTree { get; set; }
    }
}
