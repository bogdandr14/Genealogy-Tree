using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IRequestRepository</c> stores all methods that can be used to make transactions 
    /// about the request entity, for declaring a user as relative, with the database throughout 
    /// the application.
    /// </summary>
    public interface IRequestRepository : IRepositoryBase<Request>
    {
    }
}
