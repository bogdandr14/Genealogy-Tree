using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IOccupationRepository</c> stores all methods that can be used to make transactions 
    /// about the occupation entity with the database throughout the application.
    /// </summary>
    public interface IOccupationRepository : IRepositoryBase<Occupation>
    {
    }
}
