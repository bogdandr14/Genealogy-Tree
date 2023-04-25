using AutoMapper;
using GenealogyTree.Domain.DTO;
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
        private readonly IImageService _imageService;
        private readonly IFileManagementService _fileManagementService;
        private readonly ICachingService _cachingService;

        private readonly string _personMarriagesKey = "person_marriages_{0}";
        private readonly string _marriageKey = "marriage_{0}";
        public MarriageService(IUnitOfWork unitOfWork, IMapper mapper, IImageService imageService, IFileManagementService fileManagementService, ICachingService cachingService ) : base(unitOfWork)
        {
            _mapper = mapper;
            _imageService = imageService;
            _fileManagementService = fileManagementService;
            _cachingService = cachingService;
        }

        public async Task<List<MarriedPersonModel>> GetAllMarriagesForPerson(int personId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_personMarriagesKey, personId)))
            {
                return _cachingService.GetObject<List<MarriedPersonModel>>(CacheKey(_personMarriagesKey, personId));
            }

            List<Marriage> marriages = unitOfWork.Marriage.Filter(x => x.SecondPersonId == personId).Include(m => m.FirstPerson).ToList();
            marriages.AddRange(unitOfWork.Marriage.Filter(x => x.FirstPersonId == personId).Include(m => m.SecondPerson).ToList());
            List<MarriedPersonModel> convertedMarriages = _mapper.Map<List<MarriedPersonModel>>(marriages);
            _cachingService.SetObject(CacheKey(_personMarriagesKey, personId), convertedMarriages);

            List<MarriedPersonModel> returnEvent = new List<MarriedPersonModel>();
            foreach (var marriage in convertedMarriages)
            {
                marriage.PersonMarriedTo.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(marriage.PersonMarriedTo.ImageId));
                returnEvent.Add(marriage);
            }

            return returnEvent;
        }

        public async Task<MarriageDetailsModel> GetMarriageAsync(int marriageId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_marriageKey, marriageId)))
            {
                return _cachingService.GetObject<MarriageDetailsModel>(CacheKey(_marriageKey, marriageId));
            }

            Marriage marriage = await unitOfWork.Marriage.FindById(marriageId);
            marriage.FirstPerson = await unitOfWork.Person.FindById(marriage.FirstPersonId);
            marriage.SecondPerson = await unitOfWork.Person.FindById(marriage.SecondPersonId);

            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriage);
            _cachingService.SetObject(CacheKey(_marriageKey, marriageId), returnEvent);

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
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.FirstPerson.PersonId));
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.PersonMarriedTo.PersonId));
            _cachingService.SetObject(CacheKey(_marriageKey, returnEvent.Id), returnEvent);

            return returnEvent;
        }

        public async Task<MarriageDetailsModel> UpdateMarriageAsync(MarriageCreateUpdateModel marriage)
        {
            if (marriage == null)
            {
                return null;
            }

            Marriage marriageInDb = await unitOfWork.Marriage.FindById(marriage.Id);

            if (marriageInDb == default(Marriage))
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
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.FirstPerson.PersonId));
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.PersonMarriedTo.PersonId));
            _cachingService.SetObject(CacheKey(_marriageKey, returnEvent.Id), returnEvent);

            return returnEvent;
        }

        public async Task<MarriageDetailsModel> DeleteMarriageAsync(int marriageId)
        {
            Marriage marriageEntity = await unitOfWork.Marriage.Delete(marriageId);
            MarriageDetailsModel returnEvent = _mapper.Map<MarriageDetailsModel>(marriageEntity);
            _cachingService.Remove(CacheKey(_marriageKey, returnEvent.Id));
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.FirstPerson.PersonId));
            _cachingService.Remove(CacheKey(_personMarriagesKey, returnEvent.PersonMarriedTo.PersonId));

            return returnEvent;
        }
    }
}
