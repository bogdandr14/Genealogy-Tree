using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.Relative;
using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonDetailsModel : PersonCreateUpdateModel
    {
        public ICollection<RelativeModel> Parents { get; set; }
        public ICollection<RelativeModel> Children { get; set; }
        public ICollection<MarriedPersonModel> Marriages { get; set; }
    }
}
