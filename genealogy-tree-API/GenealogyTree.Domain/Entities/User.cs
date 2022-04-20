using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class User
    {
        public User()
        {
            this.Id = Guid.NewGuid();
            this.Educations = new HashSet<Education>();
            this.Occupations = new HashSet<Occupation>();
            this.UserRelatives = new HashSet<Relative>();
            this.RelativesWithUser = new HashSet<Relative>();
            this.SentRequests = new HashSet<Request>();
            this.ReceivedRequests = new HashSet<Request>();
        }

        public Guid Id { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string About { get; set; }
        public bool NotifyBirthdays { get; set; }
        public bool NotifyUpdates { get; set; }
        public bool SharePersonalInfo { get; set; }
        public bool ShareLocation { get; set; }

        public DateTime? LastSyncCheck { get; set; }

        public int PersonId { get; set; }
        [ForeignKey("PersonId")]
        public virtual Person Person { get; set; }
        public int? PositionId { get; set; }
        [ForeignKey("PositionId")]
        public virtual Position Position { get; set; }

        public virtual ICollection<Education> Educations { get; set; }
        public virtual ICollection<Occupation> Occupations { get; set; }

        public virtual ICollection<Relative> UserRelatives { get; set; }
        public virtual ICollection<Relative> RelativesWithUser { get; set; }

        public virtual ICollection<Request> SentRequests { get; set; }
        public virtual ICollection<Request> ReceivedRequests { get; set; }
    }
}
