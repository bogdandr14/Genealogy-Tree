using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Models;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UserDetailsModel> RegisterUser(UserRegisterModel userRegister);
        Task<UserDetailsModel> LoginUser(LoginModel userLogin);
        Task<UserDetailsModel> GetUserAsync(int userId);
        Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword);
        Task<UserDetailsModel> UpdateUser(UserUpdateModel user);
    }
}
