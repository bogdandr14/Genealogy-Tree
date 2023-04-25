using GenealogyTree.Domain.Interfaces;
using System;

namespace GenealogyTree.Business.Services
{
    public class BaseService
    {
        protected IUnitOfWork unitOfWork;

        public BaseService(IUnitOfWork iRepositoryWrapper)
        {
            unitOfWork = iRepositoryWrapper;
        }

        protected string CacheKey(string keyFormat, params Guid[] objectIds)
        {
            return string.Format(keyFormat, objectIds);
        }

        protected string CacheKey(string keyFormat, params int[] objectIds)
        {
            return string.Format(keyFormat, objectIds);
        }
    }
}
