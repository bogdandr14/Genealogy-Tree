using System;
using System.Linq;
using System.Linq.Expressions;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    public interface IRepositoryBase<T> : IDisposable
    {
        IQueryable<T> GetAll();
        IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression);
        T FindById(params object[] keyValues);
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
