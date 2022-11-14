using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IEducationRepository</c> stores all methods that can be used to make transactions 
    /// about the education with the database throughout the application.
    /// </summary>
    public interface IEducationRepository : IRepositoryBase<Education>
    {
    }
}
