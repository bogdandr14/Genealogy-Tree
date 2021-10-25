using AutoMapper;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class MarriageService : BaseService, IMarriageService
    {
        private readonly IMapper _mapper;
        public MarriageService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<MarriageModel>> GetAllMarriagesForPerson(int personId)
        {
            List<Marriage> marriages = unitOfWork.Marriage.Filter(x => x.Couple.FirstPersonId == personId || x.Couple.SecondPersonId == personId).ToList();
            List<MarriageModel> returnEvent = _mapper.Map<List<MarriageModel>>(marriages);
            return returnEvent;
        }

        public async Task<MarriageModel> GetCurrentMarriageForPerson(int personId)
        {
            Marriage marriage = unitOfWork.Marriage.Filter(x => (x.Couple.FirstPersonId == personId || x.Couple.SecondPersonId == personId) && x.DateEnded == default(DateTime)).FirstOrDefault();
            MarriageModel returnEvent = _mapper.Map<MarriageModel>(marriage);
            return returnEvent;
        }

        public async Task<MarriageModel> GetMarriageAsync(int marriageId)
        {
            Task<Marriage> marriage = unitOfWork.Marriage.FindById(marriageId);
            MarriageModel returnEvent = _mapper.Map<MarriageModel>(marriage);
            return returnEvent;
        }

        public async Task<MarriageModel> AddMarriageAsync(MarriageModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }
            Marriage marriageEntity = _mapper.Map<Marriage>(marriage);
            Relationship relationshipEntity = unitOfWork.Relationship.Filter(x => (x.FirstPersonId == marriage.FirstPersonId && x.SecondPersonId == marriage.SecondPersonId) ||
                                                x.SecondPersonId == marriage.FirstPersonId && x.FirstPersonId == marriage.SecondPersonId).FirstOrDefault();
            if (relationshipEntity == default(Relationship))
            {
                return null;
            }
            marriageEntity.CoupleId = relationshipEntity.Id;
            Marriage marriageCreated = await unitOfWork.Marriage.Create(marriageEntity);
            MarriageModel returnEvent = _mapper.Map<MarriageModel>(marriageCreated);
            return returnEvent;
        }
        public async Task<MarriageModel> UpdateMarriageAsync(MarriageModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }
            Marriage marriageEntity = _mapper.Map<Marriage>(marriage);
            Marriage marriageUpdated = await unitOfWork.Marriage.Update(marriageEntity);
            MarriageModel returnEvent = _mapper.Map<MarriageModel>(marriageUpdated);
            return returnEvent;
        }

        public async Task<MarriageModel> DeleteMarriageAsync(int marriageId)
        {
            Marriage marriageEntity = await unitOfWork.Marriage.Delete(marriageId);
            MarriageModel returnEvent = _mapper.Map<MarriageModel>(marriageEntity);
            return returnEvent;
        }
    }
}
