namespace GenealogyTree.Domain.Models
{
    public class SyncRequestForReceiver
    {
        public int Id { get; set; }
        public UserModel SenderUser { get; set; }
        public PersonModel ReceiverReferenceInSenderTree { get; set; }
        public bool Response { get; set; }
    }
}
