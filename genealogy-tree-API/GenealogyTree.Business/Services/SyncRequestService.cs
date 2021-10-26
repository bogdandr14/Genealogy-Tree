using AutoMapper;
using GenealogyTree.Domain.DTO.SynchedUser;
using GenealogyTree.Domain.DTO.SyncRequest;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<List<SyncRequestForSenderModel>> GetSyncRequestsSent(int senderId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.SenderId == senderId && x.ReceiverResponded == false).ToList();
            List<SyncRequestForSenderModel> returnEvent = _mapper.Map<List<SyncRequestForSenderModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<List<SyncRequestForReceiverModel>> GetSyncRequestsReceived(int receiverId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.ReceiverId == receiverId && x.ReceiverResponded == false).ToList();
            List<SyncRequestForReceiverModel> returnEvent = _mapper.Map<List<SyncRequestForReceiverModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<List<SyncRequestForSenderModel>> GetRespondedSyncRequests(int senderId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.SenderId == senderId && x.ReceiverResponded == true).ToList();
            List<SyncRequestForSenderModel> returnEvent = _mapper.Map<List<SyncRequestForSenderModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<SyncRequestForSenderModel> AddSyncRequest(SyncRequestForSenderModel syncRequest)
        {
            if (syncRequest == null)
            {
                return null;
            }
            SyncRequest syncRequestEntity = _mapper.Map<SyncRequest>(syncRequest);
            SyncRequest createdSyncRequest = await unitOfWork.SyncRequest.Create(syncRequestEntity);
            SyncRequestForSenderModel returnEvent = _mapper.Map<SyncRequestForSenderModel>(createdSyncRequest);
            return returnEvent;
        }

        public async Task<UsersToSyncModel> RespondToSyncRequest(SyncRequestForReceiverModel respondedRequest)
        {
            if (respondedRequest == null)
            {
                return null;
            }
            SyncRequest syncRequest = await unitOfWork.SyncRequest.FindById(respondedRequest.Id);
            syncRequest.ReceiverResponded = true;
            syncRequest.Response = respondedRequest.Response;

            SynchedUsers alreadySynchedUser = unitOfWork.SynchedUsers.Filter(x => x.PrimaryUserId == syncRequest.ReceiverId && x.SynchedUserId == syncRequest.SenderId).FirstOrDefault();
            if (respondedRequest.ReceiverReferenceInSenderTree != null && alreadySynchedUser != default(SynchedUsers))
            {
                syncRequest.ReceiverReferenceInSenderTreeId = respondedRequest.ReceiverReferenceInSenderTree.Id;
            }
            SyncRequest updatedSyncRequest = await unitOfWork.SyncRequest.Update(syncRequest);

            if (!respondedRequest.Response)
            {
                return null;
            }
            UsersToSyncModel returnEvent = _mapper.Map<UsersToSyncModel>(updatedSyncRequest);
            return returnEvent;
        }

        public async Task<SyncRequestForSenderModel> DeleteSyncRequest(int syncRequestId)
        {
            SyncRequest syncRequest = await unitOfWork.SyncRequest.Delete(syncRequestId);
            SyncRequestForSenderModel returnEvent = _mapper.Map<SyncRequestForSenderModel>(syncRequest);
            return returnEvent;
        }
    }
}
