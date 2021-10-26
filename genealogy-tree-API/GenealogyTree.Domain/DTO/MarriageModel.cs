using System;

namespace GenealogyTree.Domain.DTO
{
    public class MarriageModel
    {
        public int Id { get; set; }
        public DateTime MarriageStarted { get; set; }
        public DateTime? MarriageEnded { get; set; }
        public int FirstPersonId { get; set; }
        public int SecondPersonId { get; set; }
    }
}
