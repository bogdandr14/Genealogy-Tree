using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.Models
{
    public class RelationshipModel
    {
        public int Id { get; set; }
        public DateTime DateStarted { get; set; }
        public DateTime? DateEnded { get; set; }
        public MarriageModel Marriage { get; set; }
        public PersonModel FirstPerson { get; set; }
        public PersonModel SecondPerson { get; set; }
        public List<PersonModel> Children { get; set; }
    }
}
