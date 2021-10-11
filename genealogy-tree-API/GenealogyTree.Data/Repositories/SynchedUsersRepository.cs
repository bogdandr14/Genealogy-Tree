using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class SynchedUsersRepository : RepositoryBase<SynchedUsers>, ISynchedUsersRepository
    {
        public SynchedUsersRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
