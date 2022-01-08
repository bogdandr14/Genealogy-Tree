using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class Nationality
    {
        public Nationality()
        {
            this.People = new HashSet<Person>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Person> People { get; set; }
    }
}
