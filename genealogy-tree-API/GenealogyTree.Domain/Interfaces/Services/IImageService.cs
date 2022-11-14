using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IImageService
    {
        /// <summary>
        /// Retrieves the image information from the database, based on the image id.
        /// </summary>
        /// <param name="imageId"> The Id of the image that should be retrieved from the database.</param>
        /// <returns>
        /// Returns an <see cref="ImageFile"/> object, which contains some information regarding the 
        /// place where the image file and where it is stored.
        /// </returns>
        Task<Image> GetImageAsync(int? imageId);

        /// <summary>
        /// Saves the information about an image in the database.
        /// </summary>
        /// <param name="file"> The information for the image and where it is stored that must be
        /// saved in the database.</param>
        Task<Image> AddImageAsync(ImageFile file);

        // <summary>
        /// Deletes the reference for an image from the database.
        /// </summary>
        /// <param name="imageId"> The Id of the image whose reference should be removed from the 
        /// database.</param>
        /// <returns>
        /// Returns <code>true</code> in case the removal of the instance was successfull, or 
        /// <code>false</code> otherwise.
        /// </returns>
        Task<bool> DeleteImageAsync(int imageId);
    }
}
