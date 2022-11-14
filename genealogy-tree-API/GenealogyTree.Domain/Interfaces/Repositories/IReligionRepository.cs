using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IReligionRepository</c> stores all methods that can be used to make transactions 
    /// about the religion entity with the database throughout the application.
    /// </summary>
    public interface IReligionRepository : IRepositoryBase<Religion>
    {
    }
}
