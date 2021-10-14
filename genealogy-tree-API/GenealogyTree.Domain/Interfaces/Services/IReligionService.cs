using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IReligionService
    {
        Task<List<Religion>> GetAllReligionsAsync();
        List<Religion> FindReligions(string name);
        Task<Religion> AddReligionAsync(string religionName);
    }
}
