using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.DTO.SyncRequest;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISyncRequestService
    {
        Task<List<SyncRequestDetailsModel>> GetSyncRequestsSent(int senderId);
        Task<List<SyncRequestDetailsModel>> GetSyncRequestsReceived(int receiverId);
        Task<List<SyncRequestCreateUpdateModel>> GetRespondedSyncRequests(int senderId);
        Task<SyncRequestCreateUpdateModel> AddSyncRequest(SyncRequestCreateUpdateModel syncRequest);
        Task<UsersToSyncModel> RespondToSyncRequest(SyncRequestResponseModel respondedRequest);
        Task<SyncRequestDetailsModel> DeleteSyncRequest(int syncRequestId);
    }
}
