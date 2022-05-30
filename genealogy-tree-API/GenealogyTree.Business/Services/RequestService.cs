using AutoMapper;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class RequestService : BaseService, IRequestService
    {
        private readonly IMapper _mapper;

        public RequestService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsSent(Guid senderId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && x.ReceiverResponded == false).ToList();
            List<RequestDetailsModel> returnEvent = _mapper.Map<List<RequestDetailsModel>>(requests);
            return returnEvent;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsReceived(Guid receiverId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.ReceiverId == receiverId && x.ReceiverResponded == false).ToList();
            List<RequestDetailsModel> returnEvent = _mapper.Map<List<RequestDetailsModel>>(requests);
            return returnEvent;
        }

        public async Task<List<RequestCreateUpdateModel>> GetRequestsResponded(Guid senderId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && x.ReceiverResponded == true).ToList();
            List<RequestCreateUpdateModel> returnEvent = _mapper.Map<List<RequestCreateUpdateModel>>(requests);
            return returnEvent;
        }

        public async Task<RequestCreateUpdateModel> AddRequest(RequestCreateUpdateModel request)
        {
            if (request == null)
            {
                return null;
            }
            Request requestEntity = _mapper.Map<Request>(request);
            requestEntity.ReceiverReferenceInSenderTree = null;
            Request createdRequest = await unitOfWork.Requests.Create(requestEntity);
            RequestCreateUpdateModel returnEvent = _mapper.Map<RequestCreateUpdateModel>(createdRequest);
            return returnEvent;
        }

        public async Task<UsersToLinkModel> RespondToRequest(int requestId, RequestResponseModel respondedRequest)
        {
            Request request = await unitOfWork.Requests.FindById(requestId);
            if (request == null)
            {
                return null;
            }
            request.ReceiverResponded = true;
            request.Response = respondedRequest.Response;

            Relative alreadyRelated = unitOfWork.Relatives.Filter(x => x.PrimaryUserId == request.ReceiverId && x.RelativeUserId == request.SenderId).FirstOrDefault();
            if (respondedRequest.SenderReferenceInReceiverTree != null && alreadyRelated != default(Relative))
            {
                request.ReceiverReferenceInSenderTreeId = respondedRequest.SenderReferenceInReceiverTree.PersonId;
            }
            Request updatedRequest = await unitOfWork.Requests.Update(request);

            if (!respondedRequest.Response)
            {
                return null;
            }
            UsersToLinkModel returnEvent = _mapper.Map<UsersToLinkModel>(updatedRequest);
            return returnEvent;
        }

        public async Task<RequestDetailsModel> DeleteRequest(int requestId)
        {
            Request request = await unitOfWork.Requests.Delete(requestId);
            RequestDetailsModel returnEvent = _mapper.Map<RequestDetailsModel>(request);
            return returnEvent;
        }
    }
}
