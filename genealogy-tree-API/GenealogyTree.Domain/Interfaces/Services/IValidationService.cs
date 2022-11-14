using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IValidationService
    {

        /// <summary>
        /// Validates that the login of the user was made successfully.
        /// </summary>
        Task ValidateLogin();

        /// <summary>
        /// Generates a JWT for the specified user.
        /// This token will be used to confirm the identity of the user and authorize
        ///  him/her throughout the API.
        /// </summary>
        /// <param name="user"> All informations of the user from the database which 
        /// will be used for generating the JWT token.</param>
        /// <returns>
        /// Returns a string which represents the raw value of the generated JWT token.
        /// </returns>
        Task<string> GenerateToken(User user);
    }
}
