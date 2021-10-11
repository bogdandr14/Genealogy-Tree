using System;

namespace GenealogyTree.Domain.Models
{
    public class RegisterModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public int GenderId { get; set; }
        public DateTime BirthDate { get; set; }
        public string BirthState { get; set; }
        public string BirthCountry { get; set; }
        public string BirthCity { get; set; }
        public int ReligionId { get; set; }
        public string HomeState { get; set; }
        public string HomeCountry { get; set; }
        public string HomeCity { get; set; }
    }
}
