using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class Location
    {
        public Location()
        {
            this.PeopleBornHere = new HashSet<Person>();
            this.PeopleLivingHere = new HashSet<Person>();
        }

        public int Id { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }

        public virtual ICollection<Person> PeopleBornHere { get; set; }
        public virtual ICollection<Person> PeopleLivingHere { get; set; }
    }
}
