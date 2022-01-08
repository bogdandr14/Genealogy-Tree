﻿using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class ParentChildDetailsModel : GenericRelativeModel
    {
        public PersonDetailsModel Child { get; set; }
        public PersonDetailsModel Parent { get; set; }
    }
}
