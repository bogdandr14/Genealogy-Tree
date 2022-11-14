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
    public class NationalityService : BaseService, INationalityService
    {
        private readonly IMapper _mapper;
        public NationalityService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<GenericNameModel>> GetAllNationalitiesAsync()
        {
            List<Nationality> nationalities = unitOfWork.Nationality.GetAll().ToList();
            List<GenericNameModel> returnEvent = await Task.Run(() => _mapper.Map<List<GenericNameModel>>(nationalities));

            return returnEvent;
        }

        public async Task<GenericNameModel> AddNationalityAsync(string nationalityName)
        {
            if (nationalityName == null)
            {
                return null;
            }

            Nationality nationality = new Nationality()
            {
                Name = nationalityName
            };

            Nationality nationalityEntity = await unitOfWork.Nationality.Create(nationality);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(nationalityEntity);

            return returnEvent;
        }
    }
}
