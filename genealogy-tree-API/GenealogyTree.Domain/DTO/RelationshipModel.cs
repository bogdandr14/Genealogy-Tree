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
        public PersonDetailsModel FirstPerson { get; set; }
        public PersonDetailsModel SecondPerson { get; set; }
        public List<PersonDetailsModel> Children { get; set; }
    }
}
