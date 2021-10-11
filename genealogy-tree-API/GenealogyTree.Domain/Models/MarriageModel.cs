using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Models
{
    class MarriageModel
    {
        public int Id { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateEnded { get; set; }

        public int? FirstPersonId { get; set; }
        public int? SecondPersonId { get; set; }
        public string FirstPersonName { get; set; }
        public string SecondPersonName { get; set; }
    }
}
