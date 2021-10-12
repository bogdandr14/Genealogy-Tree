using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class EducationService : BaseService, IEducationService
    {
        public EducationService(IRepositoryWrapper repositoryWrapper) : base(repositoryWrapper)
        {
        }
        public Task AddEducation(EducationModel education)
        {
            repositoryWrapper.Education.Create(education);
        }

        public Task DeleteEducation(int educationId)
        {
            throw new NotImplementedException();
        }

        public Task<List<Education>> GetAllEducationsForPerson(int personId)
        {
            throw new NotImplementedException();
        }

        public Task<Education> GetEducation(int educationId)
        {
            throw new NotImplementedException();
        }

        public Task<Education> UpdateEducation()
        {
            throw new NotImplementedException();
        }
    }
}
