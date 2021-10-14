using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ReligionService : BaseService, IReligionService
    {
        public ReligionService(IUnitOfWork repositoryWrapper) : base(repositoryWrapper)
        {
        }

        public async Task<List<Religion>> GetAllReligionsAsync()
        {
            return unitOfWork.Religion.GetAll().OrderBy(x => x.Name).ToList();
        }

        public List<Religion> FindReligions(string name)
        {
            return unitOfWork.Religion.Filter(x => x.Name.Contains(name)).OrderBy(x => x.Name).ToList();
        }

        public Task<Religion> AddReligionAsync(string religionName)
        {
            if (religionName == null)
            {
                return null;
            }
            Religion religion = new Religion()
            {
                Name = religionName
            };
            return unitOfWork.Religion.Create(religion);
        }
    }
}
