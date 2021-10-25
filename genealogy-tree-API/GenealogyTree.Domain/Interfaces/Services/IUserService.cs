using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Models;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UserDetailsModel> RegisterUser(UserRegisterModel userRegister);
        Task<LoginResponseModel> LoginUser(LoginModel userLogin);
        Task<UserDetailsModel> GetUserByIdAsync(int userId);
        Task<UserDetailsModel> GetUser(string username);

        Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword);
        Task<UserDetailsModel> UpdateUser(UserUpdateModel user);
    }
}
