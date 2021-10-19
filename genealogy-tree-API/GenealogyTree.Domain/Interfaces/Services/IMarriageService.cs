using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IMarriageService
    {
        Task<List<MarriageModel>> GetAllMarriagesForPerson(int personId);
        Task<MarriageModel> GetMarriage(int marriageId);
        Task<MarriageModel> GetCurrentMarriageForPerson(int personId);
        Task<MarriageModel> AddMarriage(MarriageModel marriage);
        Task<MarriageModel> UpdateMarriage(MarriageModel marriage);
        Task<MarriageModel> DeleteMarriage(int marriageId);
    }
}
