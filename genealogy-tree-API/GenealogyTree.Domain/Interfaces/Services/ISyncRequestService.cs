using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    interface ISyncRequestService
    {
        Task AddSyncRequest();
        Task<SyncRequest> GetSyncRequestsSent(int senderId);
        Task<SyncRequest> GetSyncRequestsReceived(int receiverId);
        Task RespondToSyncRequest();
        Task GetRespondedSyncRequests(int senderId);
        Task DeleteMSyncdRequest(int syncRequestId);
    }
}
