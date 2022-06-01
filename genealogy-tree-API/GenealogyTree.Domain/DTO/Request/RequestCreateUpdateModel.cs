using GenealogyTree.Domain.DTO.Person;
using System;

namespace GenealogyTree.Domain.DTO.Request
{
    public class RequestCreateUpdateModel
    {
        public int? Id { get; set; }
        public Guid SenderUserId { get; set; }
        public GenericPersonModel ReceiverUser { get; set; }
        public int ReceiverReferenceInSenderTreeId { get; set; }
    }
}
