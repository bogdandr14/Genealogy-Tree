using System;

namespace GenealogyTree.Domain.DTO
{
    public class TokenResponseModel
    {
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
    }
}
