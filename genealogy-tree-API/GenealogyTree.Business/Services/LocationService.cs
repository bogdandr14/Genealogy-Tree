using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    class LocationService : BaseService, ILocationService
    {
        public LocationService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public async Task<Location> GetLocationAsync(int locationId)
        {
            return await unitOfWork.Location.FindById(locationId);
        }

        public async Task<Location> AddLocationAsync(Location location)
        {
            if (location == null)
            {
                return null;
            }
            return await unitOfWork.Location.Create(location);
        }
        public async Task<Location> UpdateLocation(Location location)
        {
            if (location == null)
            {
                return null;
            }
            return await unitOfWork.Location.Update(location);
        }

        public async Task<Location> DeleteLocation(int locationId)
        {
            return await unitOfWork.Location.Delete(locationId);
        }
    }
}
