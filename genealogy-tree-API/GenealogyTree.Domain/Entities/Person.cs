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
        public string Nationality { get; set; }

        public DateTime? BirthDate { get; set; }
        public DateTime? DeathDate { get; set; }
        public DateTime LastUpdate { get; set; }

        public int? FirstParentId { get; set; }
        public int? SecondParentId { get; set; }
        public int? GenderId { get; set; }
        public int? ReligionId { get; set; }
        public int? PlaceOfBirthId { get; set; }
        public int? PlaceOfLivingId { get; set; }

        [ForeignKey("FirstParentId")]
        public virtual Person FirstParent { get; set; }
        [ForeignKey("SecondParentId")]
        public virtual Person SecondParent { get; set; }
        [ForeignKey("GenderId")]
        public virtual Gender Gender { get; set; }
        [ForeignKey("ReligionId")]
        public virtual Religion Religion { get; set; }
        [ForeignKey("PlaceOfBirthId")]
        public virtual Location PlaceOfBirth { get; set; }
        [ForeignKey("PlaceOfLivingId")]
        public virtual Location PlaceOfLiving { get; set; }

        /* public virtual ICollection<SyncRequest> SyncRequests { get; set; }
         public virtual ICollection<SynchronizedUsers> SynchronizedUsers { get; set; }
         public virtual ICollection<Relationship> Relationships { get; set; }*/
    }
}
