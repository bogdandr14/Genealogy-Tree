using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    class OccupationService : BaseService, IOccupationService
    {
        private readonly IMapper _mapper;
        public OccupationService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public List<OccupationModel> GetAllOccupationsForUser(Guid userId)
        {
            List<Occupation> occupations = unitOfWork.Occupation.Filter(x => x.UserId == userId).ToList();
            List<OccupationModel> returnEvent = _mapper.Map<List<OccupationModel>>(occupations);
            return returnEvent;
        }

        public async Task<OccupationModel> GetOccupationAsync(int occupationId)
        {
            Occupation occupationEntity = await unitOfWork.Occupation.FindById(occupationId);
            OccupationModel returnEvent = _mapper.Map<OccupationModel>(occupationEntity);
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
            return returnEvent;
        }

        public async Task<OccupationModel> DeleteOccupationAsync(int occupationId)
        {
            Occupation occupationEntity = await unitOfWork.Occupation.Delete(occupationId);
            OccupationModel returnEvent = _mapper.Map<OccupationModel>(occupationEntity);
            return returnEvent;
        }
    }
}
