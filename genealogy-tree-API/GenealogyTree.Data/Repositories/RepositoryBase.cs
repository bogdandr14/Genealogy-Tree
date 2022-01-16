using GenealogyTree.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GenealogyTree.Data.Repositories
{
    public abstract class RepositoryBase<T> : IRepositoryBase<T> where T : class
    {
        private bool disposed = false;

        protected GenealogyTreeDbContext Context { get; set; }

        public RepositoryBase(GenealogyTreeDbContext context)
        {
            Context = context;
        }

        protected DbSet<T> DbSet
        {
            get { return Context.Set<T>(); }
        }

        public virtual int Count
        {
            get { return Queryable.Count(DbSet); }

        }

        #region Queries
        public IQueryable<T> GetAll()
        {
            return DbSet.AsNoTracking();
        }

        public IQueryable<T> Filter(Expression<Func<T, bool>> expression)
        {
            return DbSet.Where(expression).AsNoTracking();
        }

        public async Task<T> FindById(params object[] keyValues)
        {
            return await DbSet.FindAsync(keyValues);
        }
        #endregion

        #region Commands
        public async Task<T> Create(T entity)
        {
            DbSet.Add(entity);
            await Context.SaveChangesAsync();
            return entity;
        }

        public async Task<T> Update(T entity)
        {
            Context.Entry(entity).State = EntityState.Modified;
            await Context.SaveChangesAsync();
            return entity;
        }

        public async Task<T> Delete(params object[] id)
        {
            var entity = await DbSet.FindAsync(id);
            if (entity == null)
            {
                return entity;
            }

            DbSet.Remove(entity);
            await Context.SaveChangesAsync();
            return entity;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed && disposing)
            {
                Context.Dispose();
            }
            disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion
    }
}
