using AutoMapper;
using GenealogyTree.Domain.DTO.Sync;
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

        public async Task<List<SyncRequestDetailsModel>> GetSyncRequestsSent(int senderId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.SenderId == senderId && x.ReceiverResponded == false).ToList();
            List<SyncRequestDetailsModel> returnEvent = _mapper.Map<List<SyncRequestDetailsModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<List<SyncRequestDetailsModel>> GetSyncRequestsReceived(int receiverId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.ReceiverId == receiverId && x.ReceiverResponded == false).ToList();
            List<SyncRequestDetailsModel> returnEvent = _mapper.Map<List<SyncRequestDetailsModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<List<SyncRequestCreateUpdateModel>> GetRespondedSyncRequests(int senderId)
        {
            List<SyncRequest> syncRequests = unitOfWork.SyncRequest.Filter(x => x.SenderId == senderId && x.ReceiverResponded == true).ToList();
            List<SyncRequestCreateUpdateModel> returnEvent = _mapper.Map<List<SyncRequestCreateUpdateModel>>(syncRequests);
            return returnEvent;
        }

        public async Task<SyncRequestCreateUpdateModel> AddSyncRequest(SyncRequestCreateUpdateModel syncRequest)
        {
            if (syncRequest == null)
            {
                return null;
            }
            SyncRequest syncRequestEntity = _mapper.Map<SyncRequest>(syncRequest);
            SyncRequest createdSyncRequest = await unitOfWork.SyncRequest.Create(syncRequestEntity);
            SyncRequestCreateUpdateModel returnEvent = _mapper.Map<SyncRequestCreateUpdateModel>(createdSyncRequest);
            return returnEvent;
        }

        public async Task<UsersToSyncModel> RespondToSyncRequest(SyncRequestResponseModel respondedRequest)
        {
            if (respondedRequest == null)
            {
                return null;
            }
            SyncRequest syncRequest = await unitOfWork.SyncRequest.FindById(respondedRequest.Id);
            syncRequest.ReceiverResponded = true;
            syncRequest.Response = respondedRequest.Response;

            Sync alreadySynchedUser = unitOfWork.SynchedUsers.Filter(x => x.PrimaryUserId == syncRequest.ReceiverId && x.SyncedUserId == syncRequest.SenderId).FirstOrDefault();
            if (respondedRequest.SenderReferenceInReceiverTree != null && alreadySynchedUser != default(Sync))
            {
                syncRequest.ReceiverReferenceInSenderTreeId = respondedRequest.SenderReferenceInReceiverTree.Id;
            }
            SyncRequest updatedSyncRequest = await unitOfWork.SyncRequest.Update(syncRequest);

            if (!respondedRequest.Response)
            {
                return null;
            }
            UsersToSyncModel returnEvent = _mapper.Map<UsersToSyncModel>(updatedSyncRequest);
            return returnEvent;
        }

        public async Task<SyncRequestDetailsModel> DeleteSyncRequest(int syncRequestId)
        {
            SyncRequest syncRequest = await unitOfWork.SyncRequest.Delete(syncRequestId);
            SyncRequestDetailsModel returnEvent = _mapper.Map<SyncRequestDetailsModel>(syncRequest);
            return returnEvent;
        }
    }
}
