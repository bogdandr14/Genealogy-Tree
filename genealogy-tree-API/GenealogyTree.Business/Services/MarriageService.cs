using AutoMapper;
using GenealogyTree.Domain.DTO.Marriage;
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
    public class MarriageService : BaseService, IMarriageService
    {
        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;
        public MarriageService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<List<MarriedPersonModel>> GetAllMarriagesForPerson(int personId)
        {
            List<Marriage> marriages = unitOfWork.Marriage.Filter(x => x.SecondPersonId == personId).Include(m => m.FirstPerson).ToList();
            marriages.AddRange(unitOfWork.Marriage.Filter(x => x.FirstPersonId == personId).Include(m => m.SecondPerson).ToList());
            List<MarriedPersonModel> returnEvent = new List<MarriedPersonModel>();
            foreach (var marriage in marriages)
            {
                MarriedPersonModel returnMarriage = _mapper.Map<MarriedPersonModel>(marriage);
                returnMarriage.PersonMarriedTo.ImageFile = await _fileManagementService.GetFile(marriage.FirstPerson != null ? marriage.FirstPerson.Image : marriage.SecondPerson.Image);
                returnEvent.Add(returnMarriage);
            }
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
            Marriage marriage = await unitOfWork.Marriage.FindById(marriageId);
            marriage.FirstPerson = await unitOfWork.Person.FindById(marriage.FirstPersonId);
            marriage.SecondPerson = await unitOfWork.Person.FindById(marriage.SecondPersonId);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriage);
            returnEvent.FirstPerson.ImageFile = await _fileManagementService.GetFile(marriage.FirstPerson.Image);
            returnEvent.PersonMarriedTo.ImageFile = await _fileManagementService.GetFile(marriage.SecondPerson.Image);

            return returnEvent;
        }

        public async Task<MarriageDetailsModel> AddMarriageAsync(MarriageCreateUpdateModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }
            Marriage marriageEntity = _mapper.Map<Marriage>(marriage);
            marriageEntity.CreatedOn = DateTime.UtcNow;
            Marriage marriageCreated = await unitOfWork.Marriage.Create(marriageEntity);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriageCreated);
            return returnEvent;
        }

        public async Task<MarriageDetailsModel> UpdateMarriageAsync(MarriageCreateUpdateModel marriage)
        {
            Marriage marriageInDb = await unitOfWork.Marriage.FindById(marriage.Id);
            if (marriage == null || marriageInDb == null)
            {
                return null;
            }
            marriageInDb.FirstPersonId = marriage.FirstPersonId;
            marriageInDb.SecondPersonId = marriage.SecondPersonId;
            marriageInDb.StartDate = marriage.StartDate;
            marriageInDb.EndDate = marriage.EndDate;
            marriageInDb.ModifiedOn = DateTime.UtcNow;

            Marriage marriageUpdated = await unitOfWork.Marriage.Update(marriageInDb);
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
