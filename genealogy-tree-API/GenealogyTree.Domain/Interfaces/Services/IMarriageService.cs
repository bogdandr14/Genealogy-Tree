using GenealogyTree.Domain.DTO.Marriage;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IMarriageService
    {
        Task<List<MarriedPersonModel>> GetAllMarriagesForPerson(int personId);
        Task<MarriageDetailsModel> GetMarriageAsync(int marriageId);
        Task<MarriedPersonModel> GetCurrentMarriageForPerson(int personId);
        Task<MarriageDetailsModel> AddMarriageAsync(MarriageDetailsModel marriage);
        Task<MarriageDetailsModel> UpdateMarriageAsync(MarriageDetailsModel marriage);
        Task<MarriageDetailsModel> DeleteMarriageAsync(int marriageId);
    }
}
