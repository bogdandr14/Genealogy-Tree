using System;

namespace GenealogyTree.Domain.Entities
{
    class SyncRequest
    {
        public int Id { get; set; }
        public bool ReceiverResponded { get; set; }
        public bool Response { get; set; }

        public int IdSender { get; set; }
        public int IdReceiver { get; set; }
        public int IdReceiverReferenceInSenderTree { get; set; }

        public User Sender { get; set; }
        public User Receiver { get; set; }
        public Person ReceiverReferenceInSenderTree { get; set; }
    }
}
