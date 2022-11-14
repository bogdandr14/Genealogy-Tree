using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IPositionRepository</c> stores all methods that can be used to make transactions 
    /// about the position of the user with the database throughout the application.
    /// </summary>
    public interface IPositionRepository : IRepositoryBase<Position>
    {
    }
}
