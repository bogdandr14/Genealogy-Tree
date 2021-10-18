namespace GenealogyTree.Domain.Models
{
    public class SynchedUserModel
    {
        public int Id { get; set; }
        public UserDetailsModel SynchedUser { get; set; }
        public PersonDetailsModel SynchedPersonInTree { get; set; }
    }
}
