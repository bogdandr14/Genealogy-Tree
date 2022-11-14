using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRelativeService
    {

        /// <summary>
        /// Retrieves all relatives of the specified user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for which to return all relatives.</param>
        /// <returns>
        /// Returns a list of <see cref="RelativeModel"/> object, which represents the users which
        /// are viewed as relatives by the specified user.
        /// </returns>
        Task<List<RelativeModel>> GetAllRelativesForUser(Guid userId);

        /// <summary>
        /// Retrieves a specific relative.
        /// </summary>
        /// <param name="relativeId"> The Id of the relative that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="RelativeModel"/> object which contains all information about the 
        /// relative.
        /// </returns>
        Task<RelativeModel> GetRelative(int relativeId);

        /// <summary>
        /// Checks the state between 2 users to see if the are relatives or not.
        /// </summary>
        /// <param name="userId"> The Guid of the user for whom the request should be checked.</param>
        /// <param name="relativeId"> The Guid of the relative user that should be checked.</param>
        /// <returns>
        /// Returns an <see cref="RelativeState"/> which mentions if the 2 users are related, unrelated
        /// or a relative request was sent between then.
        /// </returns>
        Task<RelativeState> CheckRelative(Guid userId, Guid relativeId);

        /// <summary>
        /// Marks when the user acknowledged the last changes from a relative.
        /// </summary>
        /// <param name="relativeId"> The id of the relative for whom should mark changes as checked.</param>
        /// <returns>
        /// Returns an <see cref="RelativeModel"/> object which contrains all information about the 
        /// relative.
        /// </returns>
        Task<RelativeModel> MarkChanges(int relativeId);

        /// <summary>
        /// Createa a new relative link.
        /// </summary>
        /// <param name="usersToLink"> Is the <see cref="UsersToLinkModel"/> object which contains all
        /// the information to create a new link for 2 users, in order to mark them as relatives.</param>
        /// <returns>
        /// Returns the <see cref="RelativeModel"/> object which contrains all information about the 
        /// relative.
        /// </returns>
        Task<RelativeModel> AddRelativeUser(UsersToLinkModel usersToLink);

        /// <summary>
        /// Deletes an existing relative.
        /// </summary>
        /// <param name="relativeId"> The Id for the relative that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="RelativeModel"/> object that was removed.
        /// </returns>
        Task<RelativeModel> DeleteRelative(int relativeId);


        /// <summary>
        /// Retrieves the last known geographic positions of a user's relatives.
        /// </summary>
        /// <param name="userId"> The Guid of the user fow whom to retrieve all positions of his/her
        /// relatves.</param>
        /// <returns>
        /// Returns an <see cref="UserPositionModel"/> object which contains all information about the 
        /// last positions of the relatives.
        /// </returns>
        Task<List<UserPositionModel>> GetRelativesPosition(Guid userId);
    }
}
