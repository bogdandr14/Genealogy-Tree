using System;

namespace GenealogyTree.Domain.Entities
{
    public class Person
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string About { get; set; }

        public DateTime DateOfBirth { get; set; }
        public DateTime? DateOfDeath { get; set; }
        public DateTime LastUpdate { get; set; }

        public int? IdParents { get; set; }
        public int IdGender { get; set; }
        public int? IdPlaceOfBirth { get; set; }

        public virtual Relationship Parents { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual Location PlaceOfBirth { get; set; }
    }
}
