using GenealogyTree.Domain.DTO.User;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UserDetailsModel> GetUserByIdAsync(Guid userId);
        Task<UserDetailsModel> GetUser(string username);
        Task<UserDetailsModel> UpdateUser(Guid userId, UserUpdateModel user);
        Task<bool> CheckUsernameAvailable(string username);
        Task<bool> CheckEmailAvailable(string email);
        Task<UserSettingsModel> GetUserSettings(Guid userId);
        Task<UserSettingsModel> UpdateUserSettings(Guid userId, UserSettingsModel userSettings);
    }
}
