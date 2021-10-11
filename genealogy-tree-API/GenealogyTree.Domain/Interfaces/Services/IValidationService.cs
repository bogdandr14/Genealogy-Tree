using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IValidationService
    {
        Task ValidateLogin();
        Task<string> GenerateToken(User user);
    }
}
