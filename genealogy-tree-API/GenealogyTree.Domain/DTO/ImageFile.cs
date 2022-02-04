using System;
using System.IO;

namespace GenealogyTree.Domain.DTO
{
    public class ImageFile
    {
        public int Id { get; set; }
        public string MimeType { get; set; }
        public Stream Stream { get; set; }
        public long SizeInBytes { get; set; }
        public Guid Name { get; set; }
        public string FileName => $"{Name}.{Extension}";
        public string Extension => FileHelper.GetExtension(MimeType);
        public byte[] FileInBytes { get; set; }
    }
}
