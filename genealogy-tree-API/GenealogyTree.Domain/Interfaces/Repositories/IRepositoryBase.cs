using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    /// <summary>
    /// Class <c>IRepositoryBase</c> stores the basic operation that can be performed on the database.
    /// </summary>
    public interface IRepositoryBase<T> : IDisposable
    {
        int Count { get; }

        /// <summary>
        /// Query that retrieves all <see cref="T"/> from the specific table.
        /// </summary>
        /// <returns>
        /// Returns a <see cref="IQueryable"/> of <see cref="T"/> object for the database entities.
        /// </returns>
        IQueryable<T> GetAll();

        /// <summary>
        /// Query that retrieves some <see cref="T"/> from the specific table, based on an expression.
        /// </summary>
        /// <returns>
        /// Returns a <see cref="IQueryable"/> of <see cref="T"/> object for the database entities that
        /// fulfill the expression.
        /// </returns>
        IQueryable<T> Filter(Expression<Func<T, bool>> expression);

        /// <summary>
        /// Retrieves a specific entity based on its primary key.
        /// </summary>
        /// <param name="keys"> The primary keys to find in the database.</param>
        /// <returns>
        /// Returns a <see cref="T"/> object from the database.
        /// </returns>
        Task<T> FindById(params object[] keys);

        /// <summary>
        /// Creates a new entity of type <see cref="T"/> in the database.
        /// </summary>
        /// <returns>
        /// <param name="entity"> The <see cref="T"/> object that should be created.</param>
        /// Returns the <see cref="T"/> object, which represents the new entity in the database.
        /// </returns>
        Task<T> Create(T entity);

        /// <summary>
        /// Updates an entity of type <see cref="T"/> from the database.
        /// </summary>
        /// <returns>
        /// <param name="entity"> The <see cref="T"/> object that should be updated.</param>
        /// Returns the <see cref="T"/> object, which represents the updated entity in the database.
        /// </returns>
        Task<T> Update(T entity);

        /// <summary>
        /// Delete an entity of type <see cref="T"/> from the database.
        /// </summary>
        /// <returns>
        /// <param name="id"> The id of the object that should be deleted.</param>
        /// Returns the <see cref="T"/> object, which represents the deleted entity in the database.
        /// </returns>
        Task<T> Delete(params object[] id);
    }
}
