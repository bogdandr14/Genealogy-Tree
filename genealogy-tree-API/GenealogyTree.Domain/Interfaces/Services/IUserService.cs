using GenealogyTree.Domain.DTO.User;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UserDetailsModel> GetUserByIdAsync(Guid userId);
        Task<UserDetailsModel> GetUser(string username);
        Task<UserDetailsModel> UpdateUser(UserUpdateModel user);
        Task<bool> CheckUsernameAvailable(string username);
        Task<bool> CheckEmailAvailable(string email);
        Task<UserSettingsModel> GetUserSettings(string username);
        Task<UserSettingsModel> UpdateUserSettings(UserSettingsModel userSettings);
    }
}
