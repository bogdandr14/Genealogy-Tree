using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain
{
    public static class FileHelper
    {
        public static string GetExtension(string mimeType)
        {
            switch (mimeType.ToLower())
            {
                case "image/jpeg":
                    return "jpg";
                case "image/png":
                    return "png";
                case "image/gif":
                    return "gif";
                default:
                    throw new BadImageFormatException("File format is not an image type");
            }
        }
    }
}
