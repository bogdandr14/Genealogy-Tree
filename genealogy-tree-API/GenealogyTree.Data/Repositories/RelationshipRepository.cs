using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class RelationshipRepository : RepositoryBase<Relationship>, IRelationshipRepository
    {
        public RelationshipRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
