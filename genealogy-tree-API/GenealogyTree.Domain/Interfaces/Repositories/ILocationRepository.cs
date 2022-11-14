using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>ILocationRepository</c> stores all methods that can be used to make transactions 
    /// about the location entity with the database throughout the application.
    /// </summary>
    public interface ILocationRepository : IRepositoryBase<Location>
    {
    }
}
