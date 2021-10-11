using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class ReligionRepository : RepositoryBase<Religion>, IReligionRepository
    {
        public ReligionRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
