using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Person
    {
        public Person()
        {
            FirstPersonMarriages = new HashSet<Marriage>();
            SecondPersonMarriages = new HashSet<Marriage>();

            Parents = new HashSet<ParentChild>();
            Children = new HashSet<ParentChild>();

            SenderSyncRequestsForPerson = new HashSet<SyncRequest>();
        }

        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public char Gender { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? DeathDate { get; set; }
        public DateTime LastUpdate { get; set; }

        public int? ImageId { get; set; }
        [ForeignKey("ImageId")]
        public virtual Image Image {get;set;}

        public Guid TreeId { get; set; }
        [ForeignKey("TreeId")]
        public virtual Tree Tree { get; set; }

        public int? BirthPlaceId { get; set; }
        [ForeignKey("BirthPlaceId")]
        public virtual Location BirthPlace { get; set; }

        public int? LivingPlaceId { get; set; }
        [ForeignKey("LivingPlaceId")]
        public virtual Location LivingPlace { get; set; }

        public int? NationalityId { get; set; }
        [ForeignKey("NationalityId")]
        public virtual Nationality Nationality { get; set; }

        public int? ReligionId { get; set; }
        [ForeignKey("ReligionId")]
        public virtual Religion Religion { get; set; }

        public virtual ICollection<Marriage> FirstPersonMarriages { get; set; }
        public virtual ICollection<Marriage> SecondPersonMarriages { get; set; }

        public virtual ICollection<ParentChild> Parents { get; set; }
        public virtual ICollection<ParentChild> Children { get; set; }

        //Referene to synched user's person in primary user's tree (let this person be the reference for synched user)
        public virtual Sync SyncedUserToPerson { get; set; }
        //Request receivers' possible person reference to sender user's tree (let this person be the possible reference for receiver user)
        public virtual ICollection<SyncRequest> SenderSyncRequestsForPerson { get; set; }
    }
}
