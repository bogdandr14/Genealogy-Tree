using System;

namespace GenealogyTree.Domain.DTO.Person
{
    public class GenericPersonModel
    {
        public Guid TreeId { get; set; }
        public Guid? UserId { get; set; }
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public int? ImageId { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? DeathDate { get; set; }
        public ImageFile? ImageFile { get; set; }

    }
}
