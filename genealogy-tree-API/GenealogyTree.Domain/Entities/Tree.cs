using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class Tree
    {
        public Tree()
        {
            this.Id = Guid.NewGuid();
            this.PeopleInTree = new HashSet<Person>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime LastUpdate { get; set; }

        public virtual ICollection<Person> PeopleInTree { get; set; }
    }
}
