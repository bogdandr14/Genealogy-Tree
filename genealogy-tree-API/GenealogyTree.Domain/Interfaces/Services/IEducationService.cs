using GenealogyTree.Domain.DTO;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEducationService
    {
        List<EducationModel> GetAllEducationsForUser(Guid userId);
        Task<EducationModel> GetEducationAsync(int educationId);
        Task<EducationModel> AddEducationAsync(EducationModel education);
        Task<EducationModel> UpdateEducationAsync(EducationModel education);
        Task<EducationModel> DeleteEducationAsync(int educationId);
    }
}
