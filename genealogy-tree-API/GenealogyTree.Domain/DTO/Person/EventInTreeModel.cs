using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.Person
{
    public class EventInTreeModel
    {
        public DateTime Date { get; set; }
        public string EventType { get; set; }
        public ICollection<PersonBaseModel> AffectedPeople { get; set; }
    }
}
