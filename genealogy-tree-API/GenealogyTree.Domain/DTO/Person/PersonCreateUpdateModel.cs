using GenealogyTree.Domain.DTO.Generic;
using System;

namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonCreateUpdateModel : GenericPersonModel
    {
        public GenericNameModel Nationality { get; set; }
        public GenericNameModel Religion { get; set; }

        public LocationModel BirthPlace { get; set; }
        public LocationModel LivingPlace { get; set; }
    }
}
