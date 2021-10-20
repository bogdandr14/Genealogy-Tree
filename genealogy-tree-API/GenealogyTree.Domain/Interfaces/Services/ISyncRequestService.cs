using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISyncRequestService
    {
        Task<List<SyncRequestForSenderModel>> GetSyncRequestsSent(int senderId);
        Task<List<SyncRequestForReceiverModel>> GetSyncRequestsReceived(int receiverId);
        Task<SyncRequestResponse> GetRespondedSyncRequests(int senderId);
        Task<SyncRequestForSenderModel> AddSyncRequest(SyncRequestForSenderModel syncRequest);
        Task<SynchedUserModel> RespondToSyncRequest(SyncRequestForReceiverModel respondedRequest);
        Task<SyncRequestForSenderModel> DeleteMSyncdRequest(int syncRequestId);
    }
}
