using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IGenderService
    {
        Task<List<GenericNameModel>> GetAllGendersAsync();
        Task<GenericNameModel> GetGenderAsync(int genderId);
        List<GenericNameModel> FindGenders(string name);
        Task<GenericNameModel> AddGenderAsync(string genderName);
    }
}
