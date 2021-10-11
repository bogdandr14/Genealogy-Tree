using System;

namespace GenealogyTree.Domain.Models
{
    public class MarriageModel
    {
        public int Id { get; set; }
        public DateTime MarriageStarted { get; set; }
        public DateTime? MarriageEnded { get; set; }
    }
}
