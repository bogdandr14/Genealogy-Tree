using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class RequestService : BaseService, IRequestService
    {
        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;
        private readonly IRelativeService _relativeService;
        public RequestService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService, IRelativeService relativeService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
            _relativeService = relativeService;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsSent(Guid senderId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && x.ReceiverResponded == false)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person).ThenInclude(p => p.Image)
                                                .Include(x => x.Sender).ThenInclude(r => r.Person).ThenInclude(p => p.Image)
                                                .Include(x => x.ReceiverReferenceInSenderTree).ThenInclude(p => p.Image)
                                                .ToList();
            return await MapRequestDetails(requests);
        }

        private async Task<List<RequestDetailsModel>> MapRequestDetails(List<Request> requests)
        {
            List<RequestDetailsModel> returnEvent = new List<RequestDetailsModel>();
            foreach (var request in requests)
            {
                RequestDetailsModel returnRequest = new RequestDetailsModel()
                {
                    Id = request.Id,
                    ReceiverUser = _mapper.Map<GenericPersonModel>(request.Receiver),
                    SenderUser = _mapper.Map<GenericPersonModel>(request.Sender),
                    ReceiverReferenceInSenderTreeId = request.ReceiverReferenceInSenderTreeId
                };
                returnRequest.ReceiverUser.ImageFile = await _fileManagementService.GetFile(request.Receiver.Person.Image);
                returnRequest.SenderUser.ImageFile = await _fileManagementService.GetFile(request.Sender.Person.Image);
                returnEvent.Add(returnRequest);
            }
            return returnEvent;
        }

        private async Task<List<RequestResponseModel>> MapRequestResponse(List<Request> requests)
        {
            List<RequestResponseModel> returnEvent = new List<RequestResponseModel>();
            foreach (var request in requests)
            {
                RequestResponseModel returnRequest = new RequestResponseModel()
                {
                    Id = request.Id,
                    ReceiverUser = _mapper.Map<GenericPersonModel>(request.Receiver),
                    Response = request.Response
                };
                returnRequest.ReceiverUser.ImageFile = await _fileManagementService.GetFile(request.Receiver.Person.Image);
                returnEvent.Add(returnRequest);
            }
            return returnEvent;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsReceived(Guid receiverId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.ReceiverId == receiverId && x.ReceiverResponded == false)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person).ThenInclude(p => p.Image)
                                                .Include(x => x.Sender).ThenInclude(r => r.Person).ThenInclude(p => p.Image)
                                                .Include(x => x.ReceiverReferenceInSenderTree).ThenInclude(p => p.Image).ToList();
            return await MapRequestDetails(requests);
        }

        public async Task<List<RequestResponseModel>> GetRequestsResponded(Guid senderId)
        {
            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && x.ReceiverResponded == true)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person).ThenInclude(p => p.Image).ToList();
            return await MapRequestResponse(requests);
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
            if (respondedRequest.SenderReferenceInReceiverTreeId != null && alreadyRelated != default(Relative))
            {
                request.ReceiverReferenceInSenderTreeId = respondedRequest.SenderReferenceInReceiverTreeId;
            }
            Request updatedRequest = await unitOfWork.Requests.Update(request);

            if (!respondedRequest.Response == null)
            {
                return null;
            }
            UsersToLinkModel firstRelative = new UsersToLinkModel()
            {
                PrimaryUserId = updatedRequest.SenderId,
                LinkedUserId = updatedRequest.ReceiverId,
                PrimaryPersonInRelativeTreeId = respondedRequest.SenderReferenceInReceiverTreeId,
                LinkedPersonInPrimaryTreeId = updatedRequest.ReceiverReferenceInSenderTreeId
            };
            if (respondedRequest.Response)
            {
                await _relativeService.AddRelativeUser(firstRelative);//TODO
            }
            return firstRelative;
        }

        public async Task<RequestDetailsModel> DeleteRequest(int requestId)
        {
            Request request = await unitOfWork.Requests.Delete(requestId);
            RequestDetailsModel returnEvent = _mapper.Map<RequestDetailsModel>(request);
            return returnEvent;
        }
    }
}
