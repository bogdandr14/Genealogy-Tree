using GenealogyTree.Domain.DTO.Person;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace GenealogyTree.API.Attributes
{
    public class MaxImageSizeAttribute : ValidationAttribute
    {
        private readonly int _maxImageSize;
        public MaxImageSizeAttribute(int maxImageSize)
        {
            _maxImageSize = maxImageSize;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var image = (value as IFormFile);
            if (image != null)
            {
                if (image.Length > _maxImageSize * 1024)
                {
                    return new ValidationResult($"Image size exceeds {_maxImageSize}Kb.");
                }
            }
            return ValidationResult.Success;
        }
    }
}
