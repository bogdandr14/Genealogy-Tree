using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IMarriageRepository</c> stores all methods that can be used to make transactions 
    /// about the marriage entity with the database throughout the application.
    /// </summary>
    public interface IMarriageRepository : IRepositoryBase<Marriage>
    {
    }
}
