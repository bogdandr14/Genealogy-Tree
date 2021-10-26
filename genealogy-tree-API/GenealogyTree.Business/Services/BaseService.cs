using GenealogyTree.Domain.Interfaces;

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
