using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IFileManagementService
    {
        Task<ImageFile> GetFile(Image fileName);
        Task SaveFileAsync(ImageFile file);
        bool DeleteFile(string fileName);
    }
}
