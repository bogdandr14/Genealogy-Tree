using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.Request
{
    public class RequestDetailsModel
    {
        public int Id { get; set; }
        public GenericPersonModel ReceiverUser { get; set; }
        public GenericPersonModel SenderUser { get; set; }
        public int ReceiverReferenceInSenderTreeId { get; set; }
    }
}
