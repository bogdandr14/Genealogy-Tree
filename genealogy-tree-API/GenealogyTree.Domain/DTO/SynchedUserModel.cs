namespace GenealogyTree.Domain.Models
{
    public class SynchedUserModel
    {
        public int Id { get; set; }
        public UserModel SynchedUser { get; set; }
        public PersonModel SynchedPersonInTree { get; set; }
    }
}
