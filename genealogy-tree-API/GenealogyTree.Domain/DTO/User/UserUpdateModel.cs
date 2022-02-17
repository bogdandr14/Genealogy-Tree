using GenealogyTree.Domain.DTO.Person;
using System;

namespace GenealogyTree.Domain.DTO.User
{
    public class UserUpdateModel : PersonCreateUpdateModel
    {
        public string About { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
