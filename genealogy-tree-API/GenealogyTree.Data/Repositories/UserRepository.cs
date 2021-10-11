using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;

namespace GenealogyTree.Data.Repositories
{
    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(ApplicationDbContext repositoryContext) : base(repositoryContext)
        {
        }
    }
}
