using GenealogyTree.Domain.DTO;
using Microsoft.AspNetCore.Http;
using System;

namespace GenealogyTree.Business.Helpers
{
    public static class FileExtensions
    {
        public static ImageFile ToImageFile(this IFormFile file)
        {
            if (file is null)
            {
                return null;
            }

            return new ImageFile
            {
                Name = Guid.NewGuid(),
                MimeType = file.ContentType,
                Stream = file.OpenReadStream(),
                SizeInBytes = file.Length
            };
        }
    }
}
