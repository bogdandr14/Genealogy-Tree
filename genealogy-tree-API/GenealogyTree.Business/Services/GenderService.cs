using AutoMapper;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class GenderService : BaseService, IGenderService
    {
        private readonly IMapper _mapper;
        public GenderService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<GenericNameModel>> GetAllGendersAsync()
        {
            List<Gender> genders = unitOfWork.Gender.GetAll().OrderBy(x => x.Name).ToList();
            List<GenericNameModel> returnEvent = _mapper.Map<List<GenericNameModel>>(genders);
            return returnEvent;
        }

        public async Task<GenericNameModel> AddGenderAsync(string genderName)
        {
            if (genderName == null)
            {
                return null;
            }
            Gender gender = new Gender()
            {
                Name = genderName
            };
            Gender genderEntity = await unitOfWork.Gender.Create(gender);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(genderEntity);
            return returnEvent;
        }
    }
}
