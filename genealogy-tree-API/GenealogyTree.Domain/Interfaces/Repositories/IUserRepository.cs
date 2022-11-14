using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IUserRepository</c> stores all methods that can be used to make transactions 
    /// about the user entity with the database throughout the application.
    /// </summary>
    public interface IUserRepository : IRepositoryBase<User>
    {
    }
}
