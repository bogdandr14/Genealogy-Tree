using GenealogyTree.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<User> RegisterUser();
        Task<User> LoginUser();
        Task<User> GetUser(int userId);
        Task<User> UpdateUser();
        Task<List<User>> GetRelatedUsers(int userId);
    }
}
