﻿using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class User
    {
        /*public User()
        {
            this.Educations = new HashSet<Education>();
            this.Occupations = new HashSet<Occupation>();
        }*/

        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string About { get; set; }
        public bool SharePersonalInfo { get; set; }
        public DateTime LastTreeUpdate { get; set; }
        public DateTime? LastSyncCheck { get; set; }

        public int PersonId { get; set; }

        [ForeignKey("PersonId")]
        public virtual Person Person { get; set; }
        
        /*        public virtual ICollection<Education> Educations { get; set; }
                public virtual ICollection<Occupation> Occupations { get; set; }*/
    }
}
