﻿using System;

namespace GenealogyTree.Domain.Models
{
    public class LoginResponseModel
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
    }
}
