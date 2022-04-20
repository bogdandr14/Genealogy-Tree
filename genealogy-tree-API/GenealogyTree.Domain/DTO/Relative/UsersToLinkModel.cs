using System;

namespace GenealogyTree.Domain.DTO.Relative
{
    public class UsersToLinkModel
    {
        public Guid PrimaryUserId { get; set; }
        public Guid LinkedUserId { get; set; }
        public int LinkedPersonInPrimaryTreeId { get; set; }
        public int PrimaryPersonInRelativeTreeId { get; set; }
    }
}
