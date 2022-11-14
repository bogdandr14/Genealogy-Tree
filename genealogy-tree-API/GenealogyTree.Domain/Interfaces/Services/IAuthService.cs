using GenealogyTree.Domain.DTO.User;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{

    /// <summary>
    /// Class <c>AuthService</c> can be used to make operations regarding the state 
    /// of the authorization for a user.
    /// </summary>
    public interface IAuthService
    {

        /// <summary>
        /// Logins a user in the application based on the provided information.
        /// </summary>
        /// <param name="userLogin">the user's credentials for authentication.</param>
        /// <returns>
        /// Returns a <see cref="LoginResponseModel"/> object, which contains the IDs 
        /// for the person, person's tree and the JWT token.
        /// </returns>
        Task<LoginResponseModel> Login(LoginModel userLogin);

        /// <summary>
        /// Register a user in the application with all the information for the person.
        /// </summary>
        /// <param name="userRegister">Contains all information required for the account,
        /// but also for the person that will be shown in the genealogy tree</param>
        /// <returns>
        /// Returns a <see cref="UserDetailsModel"/> object, which contains all the information
        /// for the user.
        /// </returns>
        Task<UserDetailsModel> Register(RegisterModel userRegister);

        /// <summary>
        /// Updated the user's password. The new password will be validated in order 
        /// to have a specific format. 
        /// </summary>
        /// <param name="updatePassword">Contains the user's username, old and new password.</param>
        /// <returns>
        /// Returns a <see cref="UserDetailsModel"/> object, which contains all the information
        /// of the user.
        /// </returns>
        Task<UserDetailsModel> UpdatePassword(UpdatePasswordModel updatePassword);
    }
}
