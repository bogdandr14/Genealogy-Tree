using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System;
using System.Text;

namespace GenealogyTree.Business.Auth
{
    internal static class Hash
    {
        public static string CreateHash(string value, string salt)
        {
            var hash = KeyDerivation.Pbkdf2(
                                password: value,
                                salt: Encoding.UTF8.GetBytes(salt),
                                prf: KeyDerivationPrf.HMACSHA512,
                                iterationCount: 10000,
                                numBytesRequested: 256 / 8);

            return Convert.ToBase64String(hash);
        }

        public static bool ValidateHash(string value, string salt, string hash)
            => CreateHash(value, salt).Equals(hash);
    }
}
