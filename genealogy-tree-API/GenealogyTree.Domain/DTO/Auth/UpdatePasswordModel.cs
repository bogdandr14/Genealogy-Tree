namespace GenealogyTree.Domain.DTO.User
{
    public class UpdatePasswordModel
    {
        public string Username { get; set; }
        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; }
    }
}
