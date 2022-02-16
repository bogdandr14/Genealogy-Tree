using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IReligionService
    {
        Task<List<GenericNameModel>> GetAllReligionsAsync();
        Task<GenericNameModel> AddReligionAsync(string religionName);
    }
}
