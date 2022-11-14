using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IParentChildRepository</c> stores all methods that can be used to make transactions 
    /// about the parent-child links with the database throughout the application.
    /// </summary>
    public interface IParentChildRepository : IRepositoryBase<ParentChild>
    {
    }
}
