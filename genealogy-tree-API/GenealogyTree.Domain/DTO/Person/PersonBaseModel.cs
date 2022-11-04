namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonBaseModel
    {
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

#nullable enable
        public ImageFile? ImageFile { get; set; }
    }
}
