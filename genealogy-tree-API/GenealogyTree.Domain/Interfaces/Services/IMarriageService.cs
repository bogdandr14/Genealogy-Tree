using GenealogyTree.Domain.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IMarriageService
    {
        Task<List<MarriageModel>> GetAllMarriagesForPerson(int personId);
        Task<MarriageModel> GetMarriageAsync(int marriageId);
        Task<MarriageModel> GetCurrentMarriageForPerson(int personId);
        Task<MarriageModel> AddMarriageAsync(MarriageModel marriage);
        Task<MarriageModel> UpdateMarriageAsync(MarriageModel marriage);
        Task<MarriageModel> DeleteMarriageAsync(int marriageId);
    }
}
