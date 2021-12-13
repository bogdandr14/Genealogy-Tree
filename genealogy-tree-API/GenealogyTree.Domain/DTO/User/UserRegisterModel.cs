using GenealogyTree.Domain.DTO.Person;
using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserRegisterModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int GenderId { get; set; }
        public string Nationality { get; set; }
        public DateTime birthDate { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        //public string PhoneNumber { get; set; }
    }
}
