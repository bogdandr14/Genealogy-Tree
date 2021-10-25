using System;
using System.Security.Cryptography;

namespace GenealogyTree.Business.Authorization
{
    public class Salt
    {
        public static string Create()
        {
            byte[] salt = new byte[128 / 8];
            using (var rngCsp = new RNGCryptoServiceProvider())
            {
                rngCsp.GetNonZeroBytes(salt);
                return Convert.ToBase64String(salt);
            }
        }
    }
}
