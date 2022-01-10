using GenealogyTree.Domain.DTO;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ILocationService
    {
        Task<LocationModel> GetLocationAsync(int locationId);
        Task<LocationModel> AddLocationAsync(LocationModel location);
        Task<LocationModel> UpdateLocation(LocationModel location);
        Task<LocationModel> DeleteLocation(int locationId);
    }
}
