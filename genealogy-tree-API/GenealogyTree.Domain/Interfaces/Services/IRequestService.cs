using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRequestService
    {
        /// <summary>
        /// Retrieves all requests sent by a user.
        /// </summary>
        /// <param name="senderId"> The Guid of the user which sent the requests.</param>
        /// <returns>
        /// Returns a list of <see cref="RequestDetailsModel"/> objects, which represents the 
        /// requests sent by the specified user.
        /// </returns>
        Task<List<RequestDetailsModel>> GetRequestsSent(Guid senderId);

        /// <summary>
        /// Retrieves all requests received by a user.
        /// </summary>
        /// <param name="receiverId"> The Guid of the user which received the requests.</param>
        /// <returns>
        /// Returns a list of <see cref="RequestDetailsModel"/> objects, which represents the 
        /// requests received by the specified user.
        /// </returns>
        Task<List<RequestDetailsModel>> GetRequestsReceived(Guid receiverId);

        /// <summary>
        /// Retrieves all requests responded by a user.
        /// </summary>
        /// <param name="senderId"> The Guid of the user which responded to the requests.</param>
        /// <returns>
        /// Returns a list of <see cref="RequestResponseModel"/> objects, which represents the 
        /// response of the specified user.
        /// </returns>
        Task<List<RequestResponseModel>> GetRequestsResponded(Guid senderId);

        /// <summary>
        /// Creates a new request that can be responded on.
        /// </summary>
        /// <param name="request"> Is the <see cref="RequestCreateUpdateModel"/> object which contains
        /// all the information required to create a request between a sender and a receiver user.</param>
        /// <returns>
        /// Returns the <see cref="RequestCreateUpdateModel"/> object for the created request.
        /// </returns>
        Task<RequestCreateUpdateModel> AddRequest(RequestCreateUpdateModel request);

        /// <summary>
        /// The request receiver responds to the relative request.
        /// </summary>
        /// <param name="respondedRequest"> Is the <see cref="RequestCreateUpdateModel"/> object which contains
        /// all the information about the response to a relative .</param>
        /// <returns>
        /// Returns the <see cref="RequestCreateUpdateModel"/> object for the created request.
        /// </returns>
        Task<UsersToLinkModel> RespondToRequest(int requestId, RequestResponseModel respondedRequest);

        /// <summary>
        /// Deletes a relative request which was or was not yes answered by the receiver.
        /// </summary>
        /// <param name="requestId"> The Id for the request that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="RequestDetailsModel"/> object that was removed.
        /// </returns>
        Task<RequestDetailsModel> DeleteRequest(int requestId);
    }
}
