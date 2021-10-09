using System;

namespace GenealogyTree.Domain.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Nationality { get; set; }
        public bool SharePersonalInfo { get; set; }
        public DateTime LastTreeUpdate { get; set; }
        public DateTime? LastSyncCheck { get; set; }

        public int IdPerson { get; set; }
        public int IdReligion { get; set; }
        public int IdPlaceOfLiving { get; set; }
        
        public virtual Person Person { get; set; }
        public virtual Religion Religion { get; set; }
        public virtual Location PlaceOfLiving { get; set; }
    }
}
