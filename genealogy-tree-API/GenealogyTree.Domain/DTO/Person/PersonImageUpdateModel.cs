using Microsoft.AspNetCore.Http;


namespace GenealogyTree.Domain.DTO.Person
{
    public class PersonImageUpdateModel
    {
        public int PersonId { get; set; }
        public int? ImageId { get; set; }
        public IFormFile Image { get; set; }
    }
}
