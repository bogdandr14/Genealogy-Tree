using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IEducationLevelRepository</c> stores all methods that can be used to make transactions 
    /// about the education level with the database throughout the application.
    /// </summary>
    public interface IEducationLevelRepository : IRepositoryBase<EducationLevel>
    {
    }
}
