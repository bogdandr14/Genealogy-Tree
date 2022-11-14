using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
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

        public List<EducationModel> GetAllEducationsForUser(Guid userId)
        {
            List<Education> educations = unitOfWork.Education.Filter(x => x.UserId == userId).Include(e => e.EducationLevel).ToList();
            List<EducationModel> returnEvent = _mapper.Map<List<EducationModel>>(educations);

            return returnEvent;
        }

        public async Task<EducationModel> GetEducationAsync(int educationId)
        {
            Education education = await unitOfWork.Education.FindById(educationId);
            EducationModel returnEvent = _mapper.Map<EducationModel>(education);
            return returnEvent;
        }

        public async Task<EducationModel> AddEducationAsync(EducationModel education)
        {
            if (education == null)
            {
                return null;
            }

            Education educationEntity = _mapper.Map<Education>(education);
            educationEntity.EducationLevel = null;
            educationEntity = await unitOfWork.Education.Create(educationEntity);
            EducationModel returnEvent = _mapper.Map<EducationModel>(educationEntity);

            return returnEvent;
        }
        public async Task<EducationModel> UpdateEducationAsync(EducationModel education)
        {
            if (education == null)
            {
                return null;
            }

            Education educationEntity = _mapper.Map<Education>(education);
            educationEntity.EducationLevel = null;
            educationEntity = await unitOfWork.Education.Update(educationEntity);
            EducationModel returnEvent = _mapper.Map<EducationModel>(educationEntity);

            return returnEvent;
        }

        public async Task<EducationModel> DeleteEducationAsync(int educationId)
        {
            Education educationEntity = await unitOfWork.Education.Delete(educationId);
            EducationModel returnEvent = _mapper.Map<EducationModel>(educationEntity);

            return returnEvent;
        }

        public async Task<List<GenericNameModel>> GetAllEducationLevelsAsync()
        {
            List<EducationLevel> educationLevels = unitOfWork.EducationLevel.GetAll().ToList();
            List<GenericNameModel> returnEvent = await Task.Run(() => _mapper.Map<List<GenericNameModel>>(educationLevels));

            return returnEvent;
        }

        public async Task<GenericNameModel> AddEducationLevelAsync(string educationLevelName)
        {
            if (educationLevelName == null)
            {
                return null;
            }

            EducationLevel educationLevel = new EducationLevel()
            {
                Name = educationLevelName
            };

            EducationLevel educationEntity = await unitOfWork.EducationLevel.Create(educationLevel);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(educationEntity);

            return returnEvent;
        }
    }
}
