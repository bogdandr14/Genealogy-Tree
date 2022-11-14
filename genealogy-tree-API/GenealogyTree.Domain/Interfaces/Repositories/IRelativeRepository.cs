using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IRelativeRepository</c> stores all methods that can be used to make transactions 
    /// about the relative entity with the database throughout the application.
    /// </summary>
    public interface IRelativeRepository : IRepositoryBase<Relative>
    {
    }
}
