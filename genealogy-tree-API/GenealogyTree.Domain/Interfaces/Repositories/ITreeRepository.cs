using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>ITreeRepository</c> stores all methods that can be used to make transactions 
    /// about the tree entity with the database throughout the application.
    /// </summary>
    public interface ITreeRepository : IRepositoryBase<Tree>
    {
    }
}