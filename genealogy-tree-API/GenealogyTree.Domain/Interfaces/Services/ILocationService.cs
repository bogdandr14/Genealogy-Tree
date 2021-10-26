using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ILocationService
    {
        Task<Location> GetLocationAsync(int locationId);
        Task<Location> AddLocationAsync(Location location);
        Task<Location> UpdateLocation(Location location);
        Task<Location> DeleteLocation(int locationId);
    }
}
