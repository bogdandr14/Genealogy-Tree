using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class Religion
    {
        /*public Religion()
        {
            this.Users = new HashSet<User>();
        }*/
        public int Id { get; set; }
        public string Name { get; set; }

/*        public virtual ICollection<User> Users { get; set; }
*/    }
}
