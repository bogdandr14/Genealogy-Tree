using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class EducationLevel
    {
        public EducationLevel()
        {
            this.Educations = new HashSet<Education>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Education> Educations { get; set; }
    }
}
