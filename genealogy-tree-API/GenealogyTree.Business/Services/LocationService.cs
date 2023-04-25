using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class LocationService : BaseService, ILocationService
    {
        private readonly IMapper _mapper;
        private readonly ICachingService _cachingService;

        private readonly string _locationKey = "location_{0}";

        public LocationService(IUnitOfWork unitOfWork, IMapper mapper, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _cachingService = cachingService;
        }

        public async Task<LocationModel> GetLocationAsync(int locationId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_locationKey, locationId)))
            {
                return _cachingService.GetObject<LocationModel>(CacheKey(_locationKey, locationId));
            }

            Location location = await unitOfWork.Location.FindById(locationId);
            LocationModel returnEvent = _mapper.Map<LocationModel>(location);
            _cachingService.SetObject(CacheKey(_locationKey, locationId), returnEvent);

            return returnEvent;
        }

        public async Task<LocationModel> UpdateLocation(LocationModel location)
        {
            if (location == null)
            {
                return null;
            }

            Location locationEntity = _mapper.Map<Location>(location);
            locationEntity = await unitOfWork.Location.Update(locationEntity);
            LocationModel returnEvent = _mapper.Map<LocationModel>(locationEntity);
            _cachingService.SetObject(CacheKey(_locationKey, returnEvent.Id), returnEvent);

            return returnEvent;
        }
    }
}
