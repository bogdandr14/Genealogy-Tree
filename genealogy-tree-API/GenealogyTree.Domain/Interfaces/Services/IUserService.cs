using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<UsersFound> FindUsers(InfiniteScrollFilter filter);
        Task<UserDetailsModel> GetUserByIdAsync(Guid userId);
        Task<UserDetailsModel> GetUser(string username);
        Task<GenericPersonModel> GetTreeRoot(Guid treeId);
        Task<int> GetNotificationsCount(Guid userId);
        Task<NotificationsBundle> GetNotifications(Guid userId);
        Task<UserDetailsModel> UpdateUser(Guid userId, UserUpdateModel user);
        Task<bool> CheckUsernameAvailable(string username);
        Task<bool> CheckEmailAvailable(string email);
        Task<UserSettingsModel> GetUserSettings(Guid userId);
        Task<UserSettingsModel> UpdateUserSettings(Guid userId, UserSettingsModel userSettings);
        Task<UserPositionModel> UpdateUserPosition(int positionId, PositionModel position);
    }
}
