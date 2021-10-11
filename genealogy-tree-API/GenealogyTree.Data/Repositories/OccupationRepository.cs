using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class OccupationRepository : RepositoryBase<Occupation>, IOccupationRepository
    {
        public OccupationRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
