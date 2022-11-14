using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ImageService : BaseService, IImageService
    {
        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;

        public ImageService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<Image> GetImageAsync(int? imageId)
        {
            if (imageId != null)
            {
                Image image = await this.unitOfWork.Image.FindById(imageId);
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

            return wasDeleted;
        }
    }
}
