using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class LoginResponseModel
    {
        public Guid UserId { get; set; }
        public Guid TreeId { get; set; }
        public string Token { get; set; }
    }
}
