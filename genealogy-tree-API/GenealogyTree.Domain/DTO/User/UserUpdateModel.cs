namespace GenealogyTree.Domain.DTO.User
{
    public class UserUpdateModel : UserRegisterModel
    {
        public string About { get; set; }
        public bool SharePersonalInfo { get; set; }
    }
}
