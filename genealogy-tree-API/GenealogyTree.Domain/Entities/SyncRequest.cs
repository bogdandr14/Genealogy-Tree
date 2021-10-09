using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class SyncRequest
    {
        public int Id { get; set; }
        public bool ReceiverResponded { get; set; }
        public bool Response { get; set; }

        public int SenderId { get; set; }
        public int ReceiverId { get; set; }
        public int ReceiverReferenceInSenderTreeId { get; set; }

        [ForeignKey("SenderId")]
        public User Sender { get; set; }
        [ForeignKey("ReceiverId")]
        public User Receiver { get; set; }
        [ForeignKey("ReceiverReferenceInSenderTreeId")]
        public Person ReceiverReferenceInSenderTree { get; set; }
    }
}
