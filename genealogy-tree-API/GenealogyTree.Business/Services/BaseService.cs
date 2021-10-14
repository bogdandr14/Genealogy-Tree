using GenealogyTree.Domain.Interfaces.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class BaseService
    {
        protected IUnitOfWork unitOfWork;

        public BaseService(IUnitOfWork iRepositoryWrapper)
        {
            unitOfWork = iRepositoryWrapper;
        }
    }
}
