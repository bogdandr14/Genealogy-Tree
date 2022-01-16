using System;

namespace GenealogyTree.Domain.DTO.Person
{
    public class GenericPersonModel
    {
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public DateTime BirthDate { get; set; }
        public DateTime? DeathDate { get; set; }
    }
}
