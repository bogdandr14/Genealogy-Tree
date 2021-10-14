using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IGenderService
    {
        Task<List<Gender>> GetAllGendersAsync();
        Task<Gender> GetGenderAsync(int genderId);
        List<Gender> FindGenders(string name);
        Task<Gender> AddGenderAsync(string genderName);
    }
}
