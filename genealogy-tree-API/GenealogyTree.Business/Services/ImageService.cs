using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ImageService : BaseService, IImageService
    {
        private readonly IMapper _mapper;
        private readonly ICachingService _cachingService;
        private readonly IFileManagementService _fileManagementService;

        private readonly string _imageKey = "image_{0}";


        public ImageService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
            _cachingService = cachingService;
        }

        public async Task<Image> GetImageAsync(int? imageId)
        {
            if (imageId != null)
            {
                if (_cachingService.IsObjectCached(CacheKey(_imageKey, imageId.Value)))
                {
                    return _cachingService.GetObject<Image>(CacheKey(_imageKey, imageId.Value));
                }

                Image image = await this.unitOfWork.Image.FindById(imageId);
                _cachingService.SetObject(CacheKey(_imageKey, imageId.Value), image);

                return image;
            }

            return null;
        }

        public async Task<Image> AddImageAsync(ImageFile file)
        {
            await _fileManagementService.SaveFileAsync(file);
            Image image = _mapper.Map<Image>(file);
            Image imageEntity = await unitOfWork.Image.Create(image);

            return imageEntity;
        }

        public async Task<bool> DeleteImageAsync(int imageId)
        {
            Image imageEntity = await unitOfWork.Image.Delete(imageId);
            bool wasDeleted = _fileManagementService.DeleteFile(imageEntity.FileName);
            _cachingService.Remove(CacheKey(_imageKey, imageId));

            return wasDeleted;
        }
    }
}
