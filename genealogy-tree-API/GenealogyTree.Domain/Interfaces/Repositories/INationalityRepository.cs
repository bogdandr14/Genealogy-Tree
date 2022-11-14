using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>INationalityRepository</c> stores all methods that can be used to make transactions 
    /// about the nationality entity with the database throughout the application.
    /// </summary>
    public interface INationalityRepository : IRepositoryBase<Nationality>
    {
    }
}