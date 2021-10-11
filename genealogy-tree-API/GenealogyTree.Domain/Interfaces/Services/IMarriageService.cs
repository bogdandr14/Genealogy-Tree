using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IMarriageService
    {
        Task AddMarriage();
        Task<Marriage> GetMarriage(int marriageId);
        Task<Marriage> UpdateMarriage();
        Task DeleteMarriage(int marriageId);
        Task<List<Marriage>> GetAllMarriagesForPerson(int personId);
    }
}
