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
        public LocationService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<LocationModel> GetLocationAsync(int locationId)
        {
            Location location = await unitOfWork.Location.FindById(locationId);
            LocationModel returnEvent = _mapper.Map<LocationModel>(location);

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

            return returnEvent;
        }
    }
}
