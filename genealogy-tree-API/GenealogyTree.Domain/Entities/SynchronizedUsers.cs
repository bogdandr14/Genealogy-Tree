using System;

namespace GenealogyTree.Domain.Entities
{
    public class SynchronizedUsers
    {
        public int Id { get; set; }

        public int IdPrimaryUser { get; set; }
        public int IdSynchedUser { get; set; }
        public int IdSynchedPersonInPrimaryTree { get; set; }

        public virtual User PrimaryUser { get; set; }
        public virtual User SynchedUser { get; set; }
        public virtual Person SynchedPersonInPrimaryTree { get; set; }
    }
}
