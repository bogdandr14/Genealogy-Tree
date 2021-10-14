using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class GenderService : BaseService, IGenderService
    {
        public GenderService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public async Task<List<Gender>> GetAllGendersAsync()
        {
            return unitOfWork.Gender.GetAll().OrderBy(x => x.Name).ToList();
        }

        public async Task<Gender> GetGenderAsync(int genderId)
        {
            return await unitOfWork.Gender.FindById(genderId);
        }

        public List<Gender> FindGenders(string name)
        {
            return unitOfWork.Gender.Filter(x => x.Name.Contains(name)).OrderBy(x => x.Name).ToList();
        }

        public async Task<Gender> AddGenderAsync(string genderName)
        {
            if (genderName == null)
            {
                return null;
            }
            Gender gender = new Gender()
            {
                Name = genderName
            };
            return await unitOfWork.Gender.Create(gender);
        }
    }
}
