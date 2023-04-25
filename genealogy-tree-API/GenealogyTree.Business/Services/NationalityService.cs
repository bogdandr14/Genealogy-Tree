using AutoMapper;
using GenealogyTree.Domain.DTO;
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
        private readonly ICachingService _cachingService;

        private readonly string _nationalitiesKey = "nationalities";

        public NationalityService(IUnitOfWork unitOfWork, IMapper mapper, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _cachingService = cachingService;
        }

        public async Task<List<GenericNameModel>> GetAllNationalitiesAsync()
        {
            if (_cachingService.IsObjectCached(_nationalitiesKey))
            {
                return _cachingService.GetObject<List<GenericNameModel>>(_nationalitiesKey);
            }

            List<Nationality> nationalities = unitOfWork.Nationality.GetAll().ToList();
            List<GenericNameModel> returnEvent = await Task.Run(() => _mapper.Map<List<GenericNameModel>>(nationalities));
            _cachingService.SetObject(_nationalitiesKey, returnEvent);

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
            _cachingService.Remove(_nationalitiesKey);

            return returnEvent;
        }
    }
}
