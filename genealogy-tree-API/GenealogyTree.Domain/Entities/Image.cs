using System.Collections.Generic;

namespace GenealogyTree.Domain.Entities
{
    public class Image
    {
        public Image()
        {
            this.People = new HashSet<Person>();
        }
        public int Id { get; set; }
        public string FileName { get; set; }
        public string MimeType { get; set; }
        public long SizeInBytes { get; set; }
        public virtual ICollection<Person> People { get; set; }
    }
}
