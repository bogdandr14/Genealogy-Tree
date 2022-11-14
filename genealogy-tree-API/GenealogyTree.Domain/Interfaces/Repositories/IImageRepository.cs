using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IImageRepository</c> stores all methods that can be used to make transactions 
    /// about the image entity with the database throughout the application.
    /// </summary>
    public interface IImageRepository : IRepositoryBase<Image>
    {
    }
}
