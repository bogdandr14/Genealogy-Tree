using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class LoginResponseModel
    {
        public Guid UserId { get; set; }
        public int PersonId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Token { get; set; }
    }
}
