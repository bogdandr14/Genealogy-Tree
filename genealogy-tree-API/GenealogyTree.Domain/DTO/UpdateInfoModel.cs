using GenealogyTree.Domain.Enums;
using System;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO
{
    public class UpdateInfoModel
    {
        public UpdateType UpdateType { get; set; }
        public List<String> AffectedPeopleNames { get; set; }
        public int ReferenceId { get; set; }
    }
}
