using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    public interface IRepositoryBase<T> : IDisposable
    {
        int Count { get; }
        IQueryable<T> GetAll();
        IQueryable<T> Filter(Expression<Func<T, bool>> expression);
        Task<T> FindById(params object[] keys);
        Task<T> Create(T entity);
        Task<T> Update(T entity);
        Task<T> Delete(params object[] id);
    }
}
