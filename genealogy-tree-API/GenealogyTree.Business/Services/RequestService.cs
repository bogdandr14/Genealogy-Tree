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
        private readonly ICachingService _cachingService;
        private readonly IImageService _imageService;

        private readonly string _requestsSentKey = "requests_sender_{0}";
        private readonly string _requestsReceivedKey = "requests_receiver_{0}";
        private readonly string _requestsRespondedKey = "requests_responded_sender_{0}";


        public RequestService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService, IRelativeService relativeService, ICachingService cachingService, IImageService imageService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
            _relativeService = relativeService;
            _cachingService = cachingService;
            _imageService = imageService;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsSent(Guid senderId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_requestsSentKey, senderId)))
            {
                return _cachingService.GetObject<List<RequestDetailsModel>>(CacheKey(_requestsSentKey, senderId));
            }

            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && !x.ReceiverResponded)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person)
                                                .Include(x => x.Sender).ThenInclude(r => r.Person)
                                                .Include(x => x.ReceiverReferenceInSenderTree)
                                                .ToList();

            List<RequestDetailsModel> requestDetailsModels = await MapRequestDetails(requests);
            _cachingService.SetObject(CacheKey(_requestsSentKey, senderId), requestDetailsModels);

            return await AddImagesToRequestDetails(requestDetailsModels);
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

                returnEvent.Add(returnRequest);
            }

            return returnEvent;
        }

        private async Task<List<RequestDetailsModel>> AddImagesToRequestDetails(List<RequestDetailsModel> requestDetails)
        {
            List<RequestDetailsModel> returnEvent = new List<RequestDetailsModel>();

            foreach (var request in requestDetails)
            {
                request.ReceiverUser.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(request.ReceiverUser.ImageId));
                request.SenderUser.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(request.SenderUser.ImageId));
                returnEvent.Add(request);
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

        private async Task<List<RequestResponseModel>> AddImagesToRequestResponse(List<RequestResponseModel> requestResponses)
        {
            List<RequestResponseModel> returnEvent = new List<RequestResponseModel>();

            foreach (var request in requestResponses)
            {
                request.ReceiverUser.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(request.ReceiverUser.ImageId));
                returnEvent.Add(request);
            }

            return returnEvent;
        }

        public async Task<List<RequestDetailsModel>> GetRequestsReceived(Guid receiverId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_requestsReceivedKey, receiverId)))
            {
                return _cachingService.GetObject<List<RequestDetailsModel>>(CacheKey(_requestsReceivedKey, receiverId));
            }

            List<Request> requests = unitOfWork.Requests.Filter(x => x.ReceiverId == receiverId && !x.ReceiverResponded)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person)
                                                .Include(x => x.Sender).ThenInclude(r => r.Person)
                                                .Include(x => x.ReceiverReferenceInSenderTree).ToList();

            List<RequestDetailsModel> requestDetailsModels = await MapRequestDetails(requests);
            _cachingService.SetObject(CacheKey(_requestsReceivedKey, receiverId), requestDetailsModels);

            return await AddImagesToRequestDetails(requestDetailsModels);
        }

        public async Task<List<RequestResponseModel>> GetRequestsResponded(Guid senderId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_requestsRespondedKey, senderId)))
            {
                return _cachingService.GetObject<List<RequestResponseModel>>(CacheKey(_requestsReceivedKey, senderId));
            }

            List<Request> requests = unitOfWork.Requests.Filter(x => x.SenderId == senderId && x.ReceiverResponded)
                                                .Include(x => x.Receiver).ThenInclude(r => r.Person).ToList();


            List<RequestResponseModel> requestResponseModels = await MapRequestResponse(requests);
            _cachingService.SetObject(CacheKey(_requestsRespondedKey, senderId), requestResponseModels);

            return await AddImagesToRequestResponse(requestResponseModels);
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

            _cachingService.Remove(CacheKey(_requestsReceivedKey, request.ReceiverUser.UserId.Value));
            _cachingService.Remove(CacheKey(_requestsSentKey, request.SenderUserId));

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

            if (respondedRequest.SenderReferenceInReceiverTreeId != 0 && alreadyRelated != default(Relative))
            {
                request.ReceiverReferenceInSenderTreeId = respondedRequest.SenderReferenceInReceiverTreeId;
            }

            Request updatedRequest = await unitOfWork.Requests.Update(request);

            UsersToLinkModel firstRelative = new UsersToLinkModel()
            {
                PrimaryUserId = updatedRequest.SenderId,
                LinkedUserId = updatedRequest.ReceiverId,
                PrimaryPersonInRelativeTreeId = respondedRequest.SenderReferenceInReceiverTreeId,
                LinkedPersonInPrimaryTreeId = updatedRequest.ReceiverReferenceInSenderTreeId
            };

            if (respondedRequest.Response)
            {
                await _relativeService.AddRelativeUser(firstRelative);
            }

            _cachingService.Remove(CacheKey(_requestsReceivedKey, updatedRequest.ReceiverId));
            _cachingService.Remove(CacheKey(_requestsSentKey, updatedRequest.SenderId));
            _cachingService.Remove(CacheKey(_requestsRespondedKey, updatedRequest.SenderId));

            return firstRelative;
        }

        public async Task<RequestDetailsModel> DeleteRequest(int requestId)
        {
            Request request = await unitOfWork.Requests.Delete(requestId);
            RequestDetailsModel returnEvent = _mapper.Map<RequestDetailsModel>(request);

            _cachingService.Remove(CacheKey(_requestsReceivedKey, request.ReceiverId));
            _cachingService.Remove(CacheKey(_requestsSentKey, request.SenderId));

            return returnEvent;
        }
    }
}
