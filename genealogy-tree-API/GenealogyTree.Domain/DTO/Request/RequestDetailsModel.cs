using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.Request
{
    public class RequestDetailsModel
    {
        public int Id { get; set; }
        public UserDetailsModel ReceiverUser { get; set; }
        public UserDetailsModel SenderUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
    }
}
