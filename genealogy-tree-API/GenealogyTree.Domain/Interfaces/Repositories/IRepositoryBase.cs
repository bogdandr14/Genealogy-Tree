﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Repositories
{
    public interface IRepositoryBase<T>
    {
        IQueryable<T> FindAll();
        IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression);
        T FindById(params object[] keyValues);
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
