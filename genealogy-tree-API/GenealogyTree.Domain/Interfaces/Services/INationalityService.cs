using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface INationalityService
    {
        Task<List<GenericNameModel>> GetAllNationalitiesAsync();
        Task<GenericNameModel> AddNationalityAsync(string nationalityName);
    }
}
