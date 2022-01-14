using GenealogyTree.Domain.DTO.User;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IAuthService
    {
        Task<LoginResponseModel> Login(LoginModel userLogin);
        Task<UserDetailsModel> Register(RegisterModel userRegister);
        Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword);
    }
}
