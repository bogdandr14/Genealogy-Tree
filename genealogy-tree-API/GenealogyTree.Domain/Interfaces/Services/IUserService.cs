using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.User;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IUserService
    {

        /// <summary>
        /// Retrieves all users that use the application and can be found based on the applied filter.
        /// This can be used to find new relatives.
        /// </summary>
        /// <param name="filter"> The <see cref="InfiniteScrollFilter"/> object that contains all the filter 
        /// information about the searched users.</param>
        /// <returns>
        /// Returns a list of <see cref="UsersFound"/> object, which represents the users that correspond
        /// to the applied filters.
        /// </returns>
        Task<UsersFound> FindUsers(InfiniteScrollFilter filter);

        /// <summary>
        /// Retrieves a specific user by its Guid.
        /// </summary>
        /// <param name="userId"> The Guid of the user that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="UserDetailsModel"/> object which contains all information about the 
        /// requested user.
        /// </returns>
        Task<UserDetailsModel> GetUserByIdAsync(Guid userId);

        /// <summary>
        /// Retrieves a specific user by its username.
        /// </summary>
        /// <param name="username"> The username of the user that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="UserDetailsModel"/> object which contains all information about the 
        /// requested user.
        /// </returns>
        Task<UserDetailsModel> GetUser(string username);

        /// <summary>
        /// Retrieves information about the user that is the tree root of a genealogy tree.
        /// </summary>
        /// <param name="treeId"> The Guid of the tree for which to find the root.</param>
        /// <returns>
        /// Returns an <see cref="GenericPersonModel"/> object which contains information about 
        /// the user that is the tree root for the specified tree Guid.
        /// </returns>
        Task<GenericPersonModel> GetTreeRoot(Guid treeId);

        /// <summary>
        /// Retrieves the notifications count of a specified user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for which to retrieve the notifications
        /// count.</param>
        /// <returns>
        /// Returns a number which represents the notifications count.
        /// </returns>
        Task<int> GetNotificationsCount(Guid userId);

        /// <summary>
        /// Retrieves all current notifications of a user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for whom to return his/her notifications.</param>
        /// <returns>
        /// Returns a <see cref="NotificationsBundle"/> object that contains a separate list for
        /// each possible notification type.
        /// </returns>
        Task<NotificationsBundle> GetNotifications(Guid userId);

        /// <summary>
        /// Updates the information of the specified user.
        /// Only the authenticated user can change its own information.
        /// </summary>
        /// <param name="userId"> The Guid of the user to update.</param>
        /// <param name="user"> Is the <see cref="UserUpdateModel"/> object which contains information
        /// to update about the user.</param>
        /// <returns>
        /// Returns the <see cref="UserDetailsModel"/> object for the updated user.
        /// </returns>
        Task<UserDetailsModel> UpdateUser(Guid userId, UserUpdateModel user);

        /// <summary>
        /// Checks if the username is available to use.
        /// </summary>
        /// <param name="username"> The username that should be checked.</param>
        /// <returns>
        /// Returns true if the username is available, or false if the username is already taken.
        /// </returns>
        Task<bool> CheckUsernameAvailable(string username);

        /// <summary>
        /// Checks if the email is available to use.
        /// </summary>
        /// <param name="email"> The email that should be checked.</param>
        /// <returns>
        /// Returns true if the email is available, or false if the username is already taken.
        /// </returns>
        Task<bool> CheckEmailAvailable(string email);

        /// <summary>
        /// Retrieves a the user settings and preferences for the application.
        /// </summary>
        /// <param name="userId"> The Guid of the user for whom the settings should be returned.</param>
        /// <returns>
        /// Returns an <see cref="UserSettingsModel"/> object which contains all information about the 
        /// user's settings and preferences.
        /// </returns>
        Task<UserSettingsModel> GetUserSettings(Guid userId);

        /// <summary>
        /// Updates the settings of the user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for whom the settings should be updated.</param>
        /// <param name="userSettings"> Is the <see cref="UserSettingsModel"/> object which contains all
        /// the information about the settings to be updated.</param>
        /// <returns>
        /// Returns the <see cref="UserSettingsModel"/> object for the updated user settings.
        /// </returns>
        Task<UserSettingsModel> UpdateUserSettings(Guid userId, UserSettingsModel userSettings);

        /// <summary>
        /// Updates the last known position of the user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for whom to update the position.</param>
        /// <param name="position"> Is the <see cref="PositionModel"/> object which contains all
        /// the information about the position of the user.</param>
        /// <returns>
        /// Returns the <see cref="PositionModel"/> object for the updated user position.
        /// </returns>
        Task<PositionModel> UpdateUserPosition(Guid userId, PositionModel position);
    }
}
