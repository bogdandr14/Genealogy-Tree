using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class SynchedUsersRepository : RepositoryBase<Sync>, ISyncedUsersRepository
    {
        public SynchedUsersRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
