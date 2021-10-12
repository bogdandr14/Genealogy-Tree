using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;

namespace GenealogyTree.Business.Services
{
    class ReligionService : BaseService, IReligionService
    {
        public ReligionService(IRepositoryWrapper repositoryWrapper) : base(repositoryWrapper)
        {
        }
        public void AddReligion(Religion religion)
        {
            repositoryWrapper.Religion.Create(religion);
        }

        public List<Religion> FindReligion(string religionName)
        {
            return repositoryWrapper.Religion.FindByCondition(x => x.Name.Contains(religionName)).ToList();
        }

        public List<Religion> GetReligions()
        {
            return repositoryWrapper.Religion.GetAll().ToList();
        }
    }
}
