using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class NationalityRepository : RepositoryBase<Nationality>, INationalityRepository
    {
        public NationalityRepository(GenealogyTreeDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
