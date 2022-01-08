using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class EducationLevelRepository : RepositoryBase<EducationLevel>, IEducationLevelRepository
    {
        public EducationLevelRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
