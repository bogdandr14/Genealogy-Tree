using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEducationService
    {
        Task AddEducation();
        Task<Education> GetEducation(int educationId);
        Task<Education> UpdateEducation();
        Task DeleteEducation(int educationId);
        Task<List<Education>> GetAllEducationsForPerson(int personId);

    }
}
