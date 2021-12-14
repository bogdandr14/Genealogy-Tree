using GenealogyTree.Domain.Entities;
using System;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonDetailsModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Nationality { get; set; }

        public DateTime BirthDate { get; set; }
        public DateTime? DeathDate { get; set; }
        public Location BirthPlace { get; set; }
        public Location LivingPlace { get; set; }
        public int ParentsId { get; set; }
        public int GenderId { get; set; }
        public int ReligionId { get; set; }
        public string GenderName { get; set; }
        public string ReligionName { get; set; }
    }
}
