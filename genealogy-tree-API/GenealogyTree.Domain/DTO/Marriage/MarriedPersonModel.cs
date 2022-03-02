using GenealogyTree.Domain.DTO.Person;
using System;

namespace GenealogyTree.Domain.DTO.Marriage
{
    public class MarriedPersonModel
    {
        public int Id { get; set; }
        public DateTime MarriageStarted { get; set; }
        public DateTime? MarriageEnded { get; set; }
        public GenericPersonModel PersonMarriedTo { get; set; }
    }
}
