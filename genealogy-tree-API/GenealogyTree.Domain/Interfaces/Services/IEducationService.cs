using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEducationService
    {
        List<EducationModel> GetAllEducationsForPerson(int personId);
        Task<EducationModel> GetEducationAsync(int educationId);
        Task<EducationModel> AddEducationAsync(EducationModel education);
        Task<EducationModel> UpdateEducationAsync(EducationModel education);
        Task<EducationModel> DeleteEducationAsync(int educationId);
    }
}
