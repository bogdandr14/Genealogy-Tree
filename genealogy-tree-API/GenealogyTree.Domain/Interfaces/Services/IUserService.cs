using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface IUserService
    {
        Task<User> RegisterUser();
        Task<User> LoginUser();
        Task<User> GetUser(int userId);
        Task<User> UpdateUser();
        Task<List<User>> GetRelatedUsers(int userId);
    }
}
