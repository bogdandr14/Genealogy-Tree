using GenealogyTree.Domain.DTO.Generic;
using System;

namespace GenealogyTree.Domain.DTO
{
    public class EducationModel
    {
        public int Id { get; set; }
        public Guid UserId { get; set; }
        public string EducationInstituteName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public GenericNameModel EducationLevel { get; set; }
    }
}
