namespace GenealogyTree.Domain.Models
{
    public class SyncRequestForSenderModel
    {
        public int Id { get; set; }
        public int SenderUserId { get; set; }
        public UserDetailsModel ReceiverUser { get; set; }
        public PersonDetailsModel ReceiverReferenceInSenderTree { get; set; }
    }
}
