using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class OccupationService : BaseService, IOccupationService
    {
        private readonly IMapper _mapper;
        private readonly ICachingService _cachingService;

        private readonly string _userOccupationsKey = "user_occupations_{0}";

        public OccupationService(IUnitOfWork unitOfWork, IMapper mapper, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _cachingService = cachingService;
        }

        public List<OccupationModel> GetAllOccupationsForUser(Guid userId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_userOccupationsKey, userId)))
            {
                return _cachingService.GetObject<List<OccupationModel>>(CacheKey(_userOccupationsKey, userId));
            }

            List<Occupation> occupations = unitOfWork.Occupation.Filter(x => x.UserId == userId).ToList();
            List<OccupationModel> returnEvent = _mapper.Map<List<OccupationModel>>(occupations);
            _cachingService.SetObject(CacheKey(_userOccupationsKey, userId), returnEvent);

            return returnEvent;
        }

        public async Task<OccupationModel> AddOccupationAsync(OccupationModel occupation)
        {
            if (occupation == null)
            {
                return null;
            }

            Occupation occupationEntity = _mapper.Map<Occupation>(occupation);
            Occupation occupationCreated = await unitOfWork.Occupation.Create(occupationEntity);
            OccupationModel returnEvent = _mapper.Map<OccupationModel>(occupationCreated);
            _cachingService.Remove(CacheKey(_userOccupationsKey, returnEvent.UserId));

            return returnEvent;
        }

        public async Task<OccupationModel> UpdateOccupationAsync(OccupationModel occupation)
        {
            if (occupation == null)
            {
                return null;
            }

            Occupation occupationEntity = _mapper.Map<Occupation>(occupation);
            Occupation occupationUpdated = await unitOfWork.Occupation.Update(occupationEntity);
            OccupationModel returnEvent = _mapper.Map<OccupationModel>(occupationUpdated);
            _cachingService.Remove(CacheKey(_userOccupationsKey, returnEvent.UserId));

            return returnEvent;
        }

        public async Task<OccupationModel> DeleteOccupationAsync(int occupationId)
        {
            Occupation occupationEntity = await unitOfWork.Occupation.Delete(occupationId);
            OccupationModel returnEvent = _mapper.Map<OccupationModel>(occupationEntity);
            _cachingService.Remove(CacheKey(_userOccupationsKey, returnEvent.UserId));

            return returnEvent;
        }
    }
}
