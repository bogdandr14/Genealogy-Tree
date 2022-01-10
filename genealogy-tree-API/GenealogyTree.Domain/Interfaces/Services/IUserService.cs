using GenealogyTree.Domain.DTO.User;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UserDetailsModel> GetUserByIdAsync(int userId);
        Task<UserDetailsModel> GetUser(string username);
        Task<UserDetailsModel> UpdateUser(UserUpdateModel user);
        Task<UserSettingsModel> GetUserSettings(string username);
        Task<UserSettingsModel> UpdateUserSettings(UserSettingsModel userSettings);
    }
}
