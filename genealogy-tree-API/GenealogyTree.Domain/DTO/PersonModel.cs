using GenealogyTree.Domain.Entities;
using System;

namespace GenealogyTree.Domain.Models
{
    public class PersonModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string About { get; set; }

        public string Gender { get; set; }
        public DateTime BirthDate { get; set; }
        public Location BirthPlace { get; set; }

        //If synched user
        public string Religion { get; set; }
        public string Nationality { get; set; }

        //If allowed personal info sharing
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
