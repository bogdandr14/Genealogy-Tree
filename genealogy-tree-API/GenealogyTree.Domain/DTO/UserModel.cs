using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Models
{
    public class UserModel
    {
        public PersonModel Person { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public bool SharePersonalInfo { get; set; }
        public Location PlaceOfLiving { get; set; }
    }
}
