using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IFileManagementService
    {

        /// <summary>
        /// Retrieves the file from the local file system.
        /// </summary>
        /// <param name="fileName"> The information for the image that should be retrieved 
        /// from the local system.</param>
        /// <returns>
        /// Returns a list of <see cref="ImageFile"/> object, which contains all the information 
        /// about the image file.
        /// </returns>
        Task<ImageFile> GetFile(Image fileName);

        /// <summary>
        /// Saves an image in the local file system.
        /// </summary>
        /// <param name="file"> All the information for the image file that must be saved 
        /// in the local system.</param>
        Task SaveFileAsync(ImageFile file);

        /// <summary>
        /// Deletes a file from the local file system.
        /// </summary>
        /// <param name="fileName"> The name of the file that should be removed from the 
        /// localfile system.</param>
        /// <returns>
        /// Returns <code>true</code> in case the removal of the file was successfull, or 
        /// <code>false</code> otherwise.
        /// </returns>
        bool DeleteFile(string fileName);
    }
}
