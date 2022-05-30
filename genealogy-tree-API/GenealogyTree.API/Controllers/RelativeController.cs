using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.DTO.Request;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [GeneTreeAuthorize]
    [Route("api/[controller]")]
    [ApiController]
    public class RelativeController : Controller
    {
        private readonly IRelativeService _relativeService;
        private readonly IRequestService _requestService;

        public RelativeController(IRelativeService relativeService, IRequestService requestService)
        {
            _relativeService = relativeService;
            _requestService = requestService;
        }

        [HttpGet]
        [Route("{userId:Guid}")]
        public async Task<ActionResult<List<RelativeModel>>> GetRelativesForUser(Guid userId)
        {
            try
            {
                List<RelativeModel> returnEvent = await _relativeService.GetAllRelativesForUser(userId);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("canAdd/{userId:Guid}")]
        public async Task<ActionResult<List<RelativeModel>>> CanAddRelativeForUser(Guid userId, [FromQuery] Guid relativeId)
        {
            try
            {
                bool canAdd = await _relativeService.CanAddRelative(userId, relativeId);
                if (canAdd == null)
                {
                    return NotFound();
                }
                return Ok(canAdd);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("")]
        public async Task<ActionResult<UsersToLinkModel>> UserResponded(UsersToLinkModel usersToLink)
        {
            try
            {
                RelativeModel returnEvent = await _relativeService.AddRelativeUser(usersToLink);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id:int}")]
        public async Task<ActionResult<RelativeModel>> RemoveRelative(int id)
        {
            try
            {
                RelativeModel returnEvent = await _relativeService.DeleteRelative(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("request/sent/{userId:Guid}")]
        public async Task<ActionResult<List<RequestDetailsModel>>> RequestsSent(Guid userId)
        {
            try
            {
                List<RequestDetailsModel> returnEvent = await _requestService.GetRequestsSent(userId);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("request/received/{userId:Guid}")]
        public async Task<ActionResult<List<RequestDetailsModel>>> RequestsReceived(Guid userId)
        {
            try
            {
                List<RequestDetailsModel> returnEvent = await _requestService.GetRequestsReceived(userId);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("request/responded/{userId:Guid}")]
        public async Task<ActionResult<List<RequestCreateUpdateModel>>> RequestsResponded(Guid userId)
        {
            try
            {
                List<RequestCreateUpdateModel> returnEvent = await _requestService.GetRequestsResponded(userId);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("request")]
        public async Task<ActionResult<RequestCreateUpdateModel>> SendRequest(RequestCreateUpdateModel request)
        {
            try
            {
                RequestCreateUpdateModel returnEvent = await _requestService.AddRequest(request);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("request/{id:int}")]
        public async Task<ActionResult<UsersToLinkModel>> RespondToRequest(int id, RequestResponseModel request)
        {
            try
            {
                UsersToLinkModel returnEvent = await _requestService.RespondToRequest(id, request);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("request/{id:int}")]
        public async Task<ActionResult<RequestDetailsModel>> RemoveRequest(int id)
        {
            try
            {
                RequestDetailsModel returnEvent = await _requestService.DeleteRequest(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }


        [HttpGet]
        [Route("position/{userId:Guid}")]
        public async Task<ActionResult<List<UserPositionModel>>> RelativesPosition(Guid userId)
        {
            try
            {
                List<UserPositionModel> returnEvent = await _relativeService.GetRelativesPosition(userId);
                if (returnEvent == null)
                {
                    return NotFound();
                }
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
