using GenealogyTree.Domain.DTO.Person;

namespace GenealogyTree.Domain.DTO.Request
{
    public class RequestResponseModel
    {
        public int Id { get; set; }
        public GenericPersonModel ReceiverUser { get; set; }
        public int SenderReferenceInReceiverTreeId { get; set; }
        public bool Response { get; set; }
    }
}
