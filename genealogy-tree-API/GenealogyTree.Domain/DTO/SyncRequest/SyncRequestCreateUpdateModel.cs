using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.SyncRequest
{
    public class SyncRequestCreateUpdateModel
    {
        public int? Id { get; set; }
        public int SenderUserId { get; set; }
        public UserDetailsModel ReceiverUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
    }
}
