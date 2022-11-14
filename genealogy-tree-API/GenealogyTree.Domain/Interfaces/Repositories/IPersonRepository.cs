using GenealogyTree.Domain.Entities;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IPersonRepository</c> stores all methods that can be used to make transactions 
    /// about the person entity with the database throughout the application.
    /// </summary>
    public interface IPersonRepository : IRepositoryBase<Person>
    {
    }
}
