using AutoMapper;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class EducationService : BaseService, IEducationService
    {
        private readonly IMapper _mapper;
        public EducationService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public List<EducationModel> GetAllEducationsForPerson(int userId)
        {
            List<Education> educations = unitOfWork.Education.Filter(x => x.UserId == userId).ToList();
            var returnEvent = _mapper.Map<List<EducationModel>>(educations);
            return returnEvent;
        }

        public async Task<EducationModel> GetEducationAsync(int educationId)
        {
            Education education = await unitOfWork.Education.FindById(educationId);
            var returnEvent = _mapper.Map<EducationModel>(education);
            return returnEvent;
        }

        public async Task<EducationModel> AddEducationAsync(EducationModel education)
        {
            if (education == null)
            {
                return null;
            }
            var educationEntity = _mapper.Map<Education>(education);
            educationEntity = await unitOfWork.Education.Create(educationEntity);
            var returnEvent = _mapper.Map<EducationModel>(educationEntity);
            return returnEvent;
        }

        public async Task<EducationModel> DeleteEducationAsync(int educationId)
        {
            var educationEntity = await unitOfWork.Education.Delete(educationId);
            var returnEvent = _mapper.Map<EducationModel>(educationEntity);
            return returnEvent;
        }

        public async Task<EducationModel> UpdateEducationAsync(EducationModel education)
        {
            if (education == null)
            {
                return null;
            }
            var educationEntity = _mapper.Map<Education>(education);
            educationEntity = await unitOfWork.Education.Update(educationEntity);
            var returnEvent = _mapper.Map<EducationModel>(educationEntity);
            return returnEvent;
        }
    }
}
