using GenealogyTree.Domain.DTO;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IGeoService
    {
        Task<Coordinates> GetCoordinatesAsync(string state, string country, string city);
    }
}
