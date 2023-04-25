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
        private readonly ICachingService _cachingService;

        private readonly string _educationKey = "education_{0}";
        private readonly string _userEducationsKey = "user_educations_{0}";
        private readonly string _educationLevelsKey = "education_levels";

        public EducationService(IUnitOfWork unitOfWork, IMapper mapper, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _cachingService = cachingService;
        }

        public List<EducationModel> GetAllEducationsForUser(Guid userId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_userEducationsKey, userId)))
            {
                return _cachingService.GetObject<List<EducationModel>>(CacheKey(_userEducationsKey, userId));
            }

            List<Education> educations = unitOfWork.Education.Filter(x => x.UserId == userId).Include(e => e.EducationLevel).ToList();
            List<EducationModel> returnEvent = _mapper.Map<List<EducationModel>>(educations);
            _cachingService.SetObject(CacheKey(_userEducationsKey, userId), returnEvent);

            return returnEvent;
        }

        public async Task<EducationModel> GetEducationAsync(int educationId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_educationKey, educationId)))
            {
                return _cachingService.GetObject<EducationModel>(CacheKey(_educationKey, educationId));
            }

            Education education = await unitOfWork.Education.FindById(educationId);
            EducationModel returnEvent = _mapper.Map<EducationModel>(education);
            _cachingService.SetObject(CacheKey(_educationKey, educationId), returnEvent);

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
            _cachingService.Remove(CacheKey(_userEducationsKey, returnEvent.UserId));
            _cachingService.SetObject(CacheKey(_educationKey, returnEvent.Id), returnEvent);

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
            _cachingService.Remove(CacheKey(_userEducationsKey, returnEvent.UserId));
            _cachingService.SetObject(CacheKey(_educationKey, returnEvent.Id), returnEvent);

            return returnEvent;
        }

        public async Task<EducationModel> DeleteEducationAsync(int educationId)
        {
            Education educationEntity = await unitOfWork.Education.Delete(educationId);
            EducationModel returnEvent = _mapper.Map<EducationModel>(educationEntity);
            _cachingService.Remove(CacheKey(_educationKey, returnEvent.Id));

            return returnEvent;
        }

        public async Task<List<GenericNameModel>> GetAllEducationLevelsAsync()
        {
            if (_cachingService.IsObjectCached(_educationLevelsKey))
            {
                return _cachingService.GetObject<List<GenericNameModel>>(_educationLevelsKey);
            }

            List<EducationLevel> educationLevels = unitOfWork.EducationLevel.GetAll().ToList();
            List<GenericNameModel> returnEvent = await Task.Run(() => _mapper.Map<List<GenericNameModel>>(educationLevels));
            _cachingService.SetObject(_educationLevelsKey, returnEvent);

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
            _cachingService.Remove(_educationLevelsKey);
            _cachingService.SetObject(_educationLevelsKey, returnEvent);

            return returnEvent;
        }
    }
}
