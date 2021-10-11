using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IEducationService
    {
        Task AddEducation();
        Task<Education> GetEducation(int educationId);
        Task<Education> UpdateEducation();
        Task DeleteEducation(int educationId);
        Task<List<Education>> GetAllEducationsForPerson(int personId);

    }
}
