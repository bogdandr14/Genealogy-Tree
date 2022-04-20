using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.ParentChild;
using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonDetailsModel : PersonCreateUpdateModel
    {
        public ICollection<ParentChildModel> Parents { get; set; }
        public ICollection<ParentChildModel> Children { get; set; }
        public ICollection<MarriedPersonModel> Marriages { get; set; }
    }
}
