using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Relationship
    {
        /*public Relationship()
        {
            this.Children = new HashSet<Person>();
        }*/
        [Key]
        public int Id { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        public int? FirstPersonId { get; set; }
        public int? SecondPersonId { get; set; }

        [ForeignKey("FirstPersonId")]
        public virtual Person FirstPerson { get; set; }
        [ForeignKey("SecondPersonId")]
        public virtual Person SecondPerson { get; set; }

/*        public virtual ICollection<Person> Children { get; set; }
*/    }
}
