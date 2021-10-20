using AutoMapper;
using GenealogyTree.Domain.Interfaces.Repositories;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class SyncRequestService : BaseService, ISyncRequestService
    {
        private readonly IMapper _mapper;

        public SyncRequestService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public Task<List<SyncRequestForSenderModel>> GetSyncRequestsSent(int senderId)
        {
            throw new NotImplementedException();
        }

        public Task<List<SyncRequestForReceiverModel>> GetSyncRequestsReceived(int receiverId)
        {
            throw new NotImplementedException();
        }

        public Task<SyncRequestResponse> GetRespondedSyncRequests(int senderId)
        {
            throw new NotImplementedException();
        }

        public Task<SyncRequestForSenderModel> AddSyncRequest(SyncRequestForSenderModel syncRequest)
        {
            throw new NotImplementedException();
        }
        public Task<SynchedUserModel> RespondToSyncRequest(SyncRequestForReceiverModel respondedRequest)
        {
            throw new NotImplementedException();
        }

        public Task<SyncRequestForSenderModel> DeleteMSyncdRequest(int syncRequestId)
        {
            throw new NotImplementedException();
        }
    }
}
