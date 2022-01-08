using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Education
    {
        public int Id { get; set; }
        public string EducationInstituteName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public int UserId { get; set; }
        [ForeignKey("UserId")]
        public virtual User User { get; set; }

        public int? EducationLevelId { get; set; }
        [ForeignKey("EducationLevelId")]
        public virtual EducationLevel EducationLevel { get; set; }
    }
}
