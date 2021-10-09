using System;

namespace GenealogyTree.Domain.Entities
{
    public class Education
    {
        public int Id { get; set; }
        public string EducationInstituteName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public int IdEducationType { get; set; }
        public int IdUser { get; set; }

        public virtual EducationType EducationType { get; set; }
        public virtual User User { get; set; }
    }
}
