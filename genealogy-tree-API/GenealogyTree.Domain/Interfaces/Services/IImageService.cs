using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IImageService
    {
        Task<Image> GetImageAsync(int? imageId);
        Task<Image> AddImageAsync(ImageFile file);
        Task<bool> DeleteImageAsync(int imageId);
    }
}
