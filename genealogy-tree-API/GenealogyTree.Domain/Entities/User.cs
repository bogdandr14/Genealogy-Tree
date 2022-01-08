using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class User
    {
        public User()
        {
            this.Educations = new HashSet<Education>();
            this.Occupations = new HashSet<Occupation>();
            this.SyncedToUsers = new HashSet<Sync>();
            this.SyncedByUsers = new HashSet<Sync>();
            this.SentRequests = new HashSet<SyncRequest>();
            this.ReceivedRequests = new HashSet<SyncRequest>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public bool NotifyUpdates { get; set; }
        public bool NotifyBirthdays { get; set; }
        public bool SharePersonalInfo { get; set; }
        public DateTime LastTreeUpdate { get; set; }
        public DateTime? LastSyncCheck { get; set; }
        public string About { get; set; }


        public int PersonId { get; set; }
        [ForeignKey("PersonId")]
        public virtual Person Person { get; set; }

        public virtual ICollection<Education> Educations { get; set; }
        public virtual ICollection<Occupation> Occupations { get; set; }

        public virtual ICollection<Sync> SyncedToUsers { get; set; }
        public virtual ICollection<Sync> SyncedByUsers { get; set; }

        public virtual ICollection<SyncRequest> SentRequests { get; set; }
        public virtual ICollection<SyncRequest> ReceivedRequests { get; set; }
    }
}
