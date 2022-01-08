﻿using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;

namespace GenealogyTree.Domain.DTO.SyncRequest
{
    public class SyncRequestResponseModel
    {
        public int Id { get; set; }
        public PersonDetailsModel SenderReferenceInReceiverTree { get; set; }
        public bool Response { get; set; }
        public bool SyncBack { get; set; }
    }
}
