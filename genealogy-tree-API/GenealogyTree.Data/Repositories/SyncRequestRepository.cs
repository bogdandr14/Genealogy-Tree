using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class SyncRequestRepository : RepositoryBase<SyncRequest>, ISyncRequestRepository
    {
        public SyncRequestRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
