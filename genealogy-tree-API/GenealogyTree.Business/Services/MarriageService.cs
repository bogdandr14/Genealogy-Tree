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
    public class MarriageService : BaseService, IMarriageService
    {
        private readonly IMapper _mapper;
        public MarriageService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<MarriedPersonModel>> GetAllMarriagesForPerson(int personId)
        {
            List<Marriage> marriages = unitOfWork.Marriage.Filter(x => x.FirstPersonId == personId || x.SecondPersonId == personId).ToList();
            List<MarriedPersonModel> returnEvent = _mapper.Map<List<MarriedPersonModel>>(marriages);
            return returnEvent;
        }

        public async Task<MarriedPersonModel> GetCurrentMarriageForPerson(int personId)
        {
            Marriage marriage = unitOfWork.Marriage.Filter(x => (x.FirstPersonId == personId || x.SecondPersonId == personId) && x.EndDate == default(DateTime)).FirstOrDefault();
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriage);
            return returnEvent;
        }

        public async Task<MarriageDetailsModel> GetMarriageAsync(int marriageId)
        {
            Task<Marriage> marriage = unitOfWork.Marriage.FindById(marriageId);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriage);
            return returnEvent;
        }

        public async Task<MarriageDetailsModel> AddMarriageAsync(MarriageCreateUpdateModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }
            Marriage marriageEntity = _mapper.Map<Marriage>(marriage);
            Marriage marriageCreated = await unitOfWork.Marriage.Create(marriageEntity);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriageCreated);
            return returnEvent;
        }
        public async Task<MarriageDetailsModel> UpdateMarriageAsync(MarriageCreateUpdateModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }
            Marriage marriageEntity = _mapper.Map<Marriage>(marriage);
            Marriage marriageUpdated = await unitOfWork.Marriage.Update(marriageEntity);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriageUpdated);
            return returnEvent;
        }

        public async Task<MarriageDetailsModel> DeleteMarriageAsync(int marriageId)
        {
            Marriage marriageEntity = await unitOfWork.Marriage.Delete(marriageId);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriageEntity);
            return returnEvent;
        }
    }
}
