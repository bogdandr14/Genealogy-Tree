using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class EducationRepository : RepositoryBase<Education>, IEducationRepository
    {
        public EducationRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
