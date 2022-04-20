using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace GenealogyTree.Domain.Entities
{
    public class Request
    {
        public int Id { get; set; }
        public bool ReceiverResponded { get; set; }
        public bool Response { get; set; }

        public Guid SenderId { get; set; }
        [ForeignKey("SenderId")]
        public User Sender { get; set; }

        public Guid ReceiverId { get; set; }
        [ForeignKey("ReceiverId")]
        public User Receiver { get; set; }
        
        public int ReceiverReferenceInSenderTreeId { get; set; }
        [ForeignKey("ReceiverReferenceInSenderTreeId")]
        public Person ReceiverReferenceInSenderTree { get; set; }
    }
}
