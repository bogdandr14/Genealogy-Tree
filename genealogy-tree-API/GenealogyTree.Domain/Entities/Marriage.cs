using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Marriage
    {
        public int Id { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateEnded { get; set; }

        public int FirstPersonId { get; set; }
        public int SecondPersonId { get; set; }

        [ForeignKey("FirstPersonId")]
        public virtual Person FirstPerson { get; set; }
        [ForeignKey("SecondPersonId")]
        public virtual Person SecondPerson { get; set; }
    }
}
