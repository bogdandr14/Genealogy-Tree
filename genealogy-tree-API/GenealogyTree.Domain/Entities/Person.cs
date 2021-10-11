using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Person
    {
        /*public Person()
        {
            this.SyncRequests = new HashSet<SyncRequest>();
            this.SynchronizedUsers = new HashSet<SynchronizedUsers>();
            this.Relationships = new HashSet<Relationship>();
        }*/

        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string About { get; set; }

        public DateTime DateOfBirth { get; set; }
        public DateTime? DateOfDeath { get; set; }
        public DateTime LastUpdate { get; set; }

        public int? ParentsId { get; set; }
        public int GenderId { get; set; }
        public int? PlaceOfBirthId { get; set; }

        [ForeignKey("ParentsId")]
        public virtual Relationship Parents { get; set; }
        [ForeignKey("GenderId")]
        public virtual Gender Gender { get; set; }
        [ForeignKey("PlaceOfBirthId")]
        public virtual Location PlaceOfBirth { get; set; }

        /* public virtual ICollection<SyncRequest> SyncRequests { get; set; }
         public virtual ICollection<SynchronizedUsers> SynchronizedUsers { get; set; }
         public virtual ICollection<Relationship> Relationships { get; set; }*/
    }
}
