using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.DTO.SyncRequest;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISyncRequestService
    {
        Task<List<SyncRequestDetailsModel>> GetSyncRequestsSent(Guid senderId);
        Task<List<SyncRequestDetailsModel>> GetSyncRequestsReceived(Guid receiverId);
        Task<List<SyncRequestCreateUpdateModel>> GetRespondedSyncRequests(Guid senderId);
        Task<SyncRequestCreateUpdateModel> AddSyncRequest(SyncRequestCreateUpdateModel syncRequest);
        Task<UsersToSyncModel> RespondToSyncRequest(SyncRequestResponseModel respondedRequest);
        Task<SyncRequestDetailsModel> DeleteSyncRequest(int syncRequestId);
    }
}
