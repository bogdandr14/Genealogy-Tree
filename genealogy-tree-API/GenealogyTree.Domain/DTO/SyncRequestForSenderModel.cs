namespace GenealogyTree.Domain.Models
{
    public class SyncRequestForSenderModel
    {
        public int Id { get; set; }
        public int SenderUserId { get; set; }
        public UserModel ReceiverUser { get; set; }
        public PersonModel ReceiverReferenceInSenderTree { get; set; }
    }
}
