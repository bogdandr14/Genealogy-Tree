using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.SyncRequest
{
    public class SyncRequestForReceiverModel
    {
        public int Id { get; set; }
        public UserDetailsModel SenderUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
        public bool Response { get; set; }
    }
}
