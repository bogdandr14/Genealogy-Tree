using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class ParentChildRepository : RepositoryBase<ParentChild>, IParentChildRepository
    {
        public ParentChildRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
