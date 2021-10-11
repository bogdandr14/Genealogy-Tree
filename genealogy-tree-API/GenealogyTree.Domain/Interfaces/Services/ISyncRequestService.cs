using GenealogyTree.Domain.Entities;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ISyncRequestService
    {
        Task AddSyncRequest();
        Task<SyncRequest> GetSyncRequestsSent(int senderId);
        Task<SyncRequest> GetSyncRequestsReceived(int receiverId);
        Task RespondToSyncRequest();
        Task GetRespondedSyncRequests(int senderId);
        Task DeleteMSyncdRequest(int syncRequestId);
    }
}
