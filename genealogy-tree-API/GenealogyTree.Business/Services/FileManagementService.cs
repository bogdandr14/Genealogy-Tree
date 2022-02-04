using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class FileManagementService : IFileManagementService
    {
        private readonly IConfiguration _configuration;
        private readonly IMapper _mapper;
        private readonly string _fileDirectoryPath;
        public FileManagementService(IMapper mapper, IConfiguration configuration)
        {
            _mapper = mapper;
            _configuration = configuration;
            string relativeFileDirectoryPath = this._configuration.GetSection("FilesDirectory").Value;
            _fileDirectoryPath = Path.Combine(Directory.GetCurrentDirectory(), relativeFileDirectoryPath);
            DirectoryInfo directory = Directory.CreateDirectory(_fileDirectoryPath);
        }

        public async Task<ImageFile> GetFile(Image image)
        {
            if(image == null)
            {
                return null;
            }
            ImageFile imageFile = _mapper.Map<ImageFile>(image);
            imageFile.FileInBytes = await File.ReadAllBytesAsync(Path.Combine(_fileDirectoryPath, image.FileName));
            return imageFile;
        }

        public async Task SaveFileAsync(ImageFile file)
        {
            string fullPath = Path.Combine(_fileDirectoryPath, file.FileName);

            using (FileStream fileStream = File.Create(fullPath))
            {
                fileStream.Seek(0, SeekOrigin.Begin);
                await file.Stream.CopyToAsync(fileStream);
            }
        }

        public bool DeleteFile(string fileName)
        {
            string path = Path.Combine(_fileDirectoryPath, fileName);
            if (File.Exists(path))
            {
                File.Delete(path);
                return true;
            }
            return false;
        }
    }
}
