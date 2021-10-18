using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using System;

namespace GenealogyTree.Domain.Models
{
    public class PersonDetailsModel: PersonUpdateModel
    {
        public string GenderName { get; set; }
        public string ReligionName { get; set; }

        //If allowed personal info sharing
        public string About { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
