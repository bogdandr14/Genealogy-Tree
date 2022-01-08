using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEducationLevelService
    {
        Task<List<GenericNameModel>> GetAllEducationLevelsAsync();
        Task<GenericNameModel> GetEducationLevelAsync(int educationLevelId);
        Task<GenericNameModel> AddEducationLevelAsync(string educationLevelName);
    }
}
