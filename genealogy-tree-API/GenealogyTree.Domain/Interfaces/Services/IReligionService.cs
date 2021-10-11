using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IReligionService
    {
        Task AddReligion();
        Task<List<Religion>> GetReligions();
        Task<List<Religion>> FindReligion(string religionName);
    }
}
