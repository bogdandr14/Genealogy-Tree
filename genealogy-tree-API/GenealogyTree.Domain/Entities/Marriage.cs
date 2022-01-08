using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Marriage
    {
        public int Id { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }

        public int FirstPersonId { get; set; }
        [ForeignKey("FirstPersonId")]
        public virtual Person FirstPerson { get; set; }

        public int SecondPersonId { get; set; }
        [ForeignKey("SecondPersonId")]
        public virtual Person SecondPerson { get; set; }
    }
}
