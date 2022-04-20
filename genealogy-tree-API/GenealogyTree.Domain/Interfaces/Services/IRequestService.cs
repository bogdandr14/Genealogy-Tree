using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IRequestService
    {
        Task<List<RequestDetailsModel>> GetRequestsSent(Guid senderId);
        Task<List<RequestDetailsModel>> GetRequestsReceived(Guid receiverId);
        Task<List<RequestCreateUpdateModel>> GetRequestsResponded(Guid senderId);
        Task<RequestCreateUpdateModel> AddRequest(RequestCreateUpdateModel request);
        Task<UsersToLinkModel> RespondToRequest(int requestId, RequestResponseModel respondedRequest);
        Task<RequestDetailsModel> DeleteRequest(int requestId);
    }
}
