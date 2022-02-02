using AutoMapper;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.IO;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ImageService: BaseService, IImageService
    {
        private readonly IMapper _mapper;
        public ImageService(IUnitOfWork unitOfWork, IMapper mapper): base(unitOfWork)
        {
            _mapper = mapper;
        }
        /*         public static class FileExtensions

   public static GenericFile ToGenericFile(this IFormFile file)
        {
            if (file is null)
            {
                return null;
            }

            return new GenericFile
            {
                Id = Guid.NewGuid(),
                MimeType = file.ContentType,
                Name = file.FileName,
                Stream = file.OpenReadStream(),
                SizeInBytes = file.Length
            };
        }*/

        public async Task<Image> GetImageAsync(int imageId)
        {
            return await this.unitOfWork.Image.FindById(imageId);
        }
        public async Task SaveFileAsync(object file)
        {
            string fileDirectoryPath;
            string fullPath;
            DateTime timeNow = DateTime.UtcNow;
            fileDirectoryPath = Path.Combine("filedirectorypath", "uploaddirectory");
            fullPath = Path.Combine(fileDirectoryPath, "unique name");
            DirectoryInfo directory = Directory.CreateDirectory(fileDirectoryPath);
            using (FileStream fileStream = File.Create(fullPath))
            {
           /*     if(file.Stream != null)
                {
                    
                }*/
    }

}
        public async Task<byte[]> GetFile(string fileName)
        {
            return await File.ReadAllBytesAsync(Path.Combine("", "uploadDirectory", fileName));
        }

        public bool DeleteFile(string fileName)
        {
            string path = Path.Combine("", "uploadDirectory", fileName);
            if (File.Exists(path))
            {
                File.Delete(path);
                return true;
            }
            return false;
        }
        private async Task SaveFileInDatabase(object file, )
    }
}
