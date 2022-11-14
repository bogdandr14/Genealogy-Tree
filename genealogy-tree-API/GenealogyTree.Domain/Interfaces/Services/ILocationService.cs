using GenealogyTree.Domain.DTO;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ILocationService
    {
        /// <summary>
        /// Retrieves a specific location.
        /// </summary>
        /// <param name="locationId"> The Id of the location that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="LocationModel"/> object for the requested location Id.
        /// </returns>
        Task<LocationModel> GetLocationAsync(int locationId);

        /// <summary>
        /// Updates an existing location for the authenticated user.
        /// </summary>
        /// <param name="location"> Is the <see cref="LocationModel"/> object which contains the
        /// information for the location that should be updated.</param>
        /// <returns>
        /// Returns the <see cref="LocationModel"/> object for the updated location.
        /// </returns>
        Task<LocationModel> UpdateLocation(LocationModel location);
    }
}
