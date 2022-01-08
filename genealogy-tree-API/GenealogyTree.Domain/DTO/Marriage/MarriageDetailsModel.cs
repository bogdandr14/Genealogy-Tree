using GenealogyTree.Domain.DTO.Person;
using System;

namespace GenealogyTree.Domain.DTO.Marriage
{
    public class MarriageDetailsModel : MarriedPersonModel
    {
        public PersonDetailsModel FirstPerson { get; set; }
    }
}
