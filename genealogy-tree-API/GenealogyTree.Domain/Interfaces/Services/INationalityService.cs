using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface INationalityService
    {
        Task<List<GenericNameModel>> GetAllNationalitiesAsync();
        Task<GenericNameModel> GetNationalityAsync(int nationalityId);
        List<GenericNameModel> FindNationalities(string name);
        Task<GenericNameModel> AddNationalityAsync(string nationalityName);
    }
}
