using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISyncRequestService
    {
        Task<List<SyncRequestForSenderModel>> GetSyncRequestsSent(int senderId);
        Task<List<SyncRequestForReceiverModel>> GetSyncRequestsReceived(int receiverId);
        Task<List<SyncRequestForSenderModel>> GetRespondedSyncRequests(int senderId);
        Task<SyncRequestForSenderModel> AddSyncRequest(SyncRequestForSenderModel syncRequest);
        Task<UsersToSyncModel> RespondToSyncRequest(SyncRequestForReceiverModel respondedRequest);
        Task<SyncRequestForSenderModel> DeleteSyncRequest(int syncRequestId);
    }
}
