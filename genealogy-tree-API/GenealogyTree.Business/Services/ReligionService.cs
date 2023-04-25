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
    public class ReligionService : BaseService, IReligionService
    {
        private readonly IMapper _mapper;
        private readonly ICachingService _cachingService;

        private readonly string _religionsKey;
        public ReligionService(IUnitOfWork repositoryWrapper, IMapper mapper, ICachingService cachingService) : base(repositoryWrapper)
        {
            _mapper = mapper;
            _cachingService = cachingService;
        }

        public async Task<List<GenericNameModel>> GetAllReligionsAsync()
        {
            if (_cachingService.IsObjectCached(_religionsKey))
            {
                return _cachingService.GetObject<List<GenericNameModel>>(_religionsKey);
            }

            List<Religion> religions = await Task.Run(() => unitOfWork.Religion.GetAll().OrderBy(x => x.Name).ToList());
            List<GenericNameModel> returnEvent = _mapper.Map<List<GenericNameModel>>(religions);
            _cachingService.SetObject(_religionsKey, returnEvent);

            return returnEvent;
        }

        public async Task<GenericNameModel> AddReligionAsync(string religionName)
        {
            if (religionName == null)
            {
                return null;
            }

            Religion religion = new Religion()
            {
                Name = religionName
            };

            Religion religionEntity = await unitOfWork.Religion.Create(religion);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(religionEntity);
            _cachingService.Remove(_religionsKey);

            return returnEvent;
        }
    }
}
