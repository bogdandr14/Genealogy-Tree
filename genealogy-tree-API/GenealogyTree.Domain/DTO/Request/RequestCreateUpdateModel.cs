using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.Request
{
    public class RequestCreateUpdateModel
    {
        public int? Id { get; set; }
        public int SenderUserId { get; set; }
        public UserDetailsModel ReceiverUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
    }
}
