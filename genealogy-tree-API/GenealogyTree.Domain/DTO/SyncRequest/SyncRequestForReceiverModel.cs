namespace GenealogyTree.Domain.Models
{
    public class SyncRequestForReceiverModel
    {
        public int Id { get; set; }
        public UserDetailsModel SenderUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
        public bool Response { get; set; }
    }
}
