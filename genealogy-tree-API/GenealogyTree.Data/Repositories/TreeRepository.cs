using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class TreeRepository : RepositoryBase<Tree>, ITreeRepository
    {
        public TreeRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}