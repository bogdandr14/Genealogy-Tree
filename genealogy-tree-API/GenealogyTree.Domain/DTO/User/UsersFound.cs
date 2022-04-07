using GenealogyTree.Domain.DTO.Person;
using System.Collections.Generic;

namespace GenealogyTree.Domain.DTO.User
{
    public class UsersFound
    {
        public UsersFound()
        {
            users = new List<GenericPersonModel>();
        }
        public ICollection<GenericPersonModel> users { get; set; }
        public int skippedUsers { get; set; }
        public int takenUsers { get; set; } = 15;
        public int totalUsers { get; set; }
        public bool areLast { get; set; }
    }
}
