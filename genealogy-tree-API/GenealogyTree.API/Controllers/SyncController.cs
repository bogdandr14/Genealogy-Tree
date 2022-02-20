using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.DTO.SyncRequest;
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
    public class SyncController : Controller
    {
        private readonly ISynchedUsersService _synchedUsersService;
        private readonly ISyncRequestService _syncRequestService;

        public SyncController(ISynchedUsersService synchedUsersService, ISyncRequestService syncRequestService)
        {
            _synchedUsersService = synchedUsersService;
            _syncRequestService = syncRequestService;
        }

        [HttpGet]
        [Route("Users/{userId}")]
        public async Task<ActionResult<List<SyncedUserModel>>> GetSynchedUsersForCurrentUser(Guid userId)
        {
            try
            {
                List<SyncedUserModel> returnEvent = await _synchedUsersService.GetAllSynchedUsersForUser(userId);
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
        [Route("Users")]
        public async Task<ActionResult<UsersToSyncModel>> SynchedUsersResponded(UsersToSyncModel usersToSync)
        {
            try
            {
                SyncedUserModel returnEvent = await _synchedUsersService.AddSynchedUser(usersToSync);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("Users/{id:int}")]
        public async Task<ActionResult<SyncedUserModel>> RemoveSynchedUser(int id)
        {
            try
            {
                SyncedUserModel returnEvent = await _synchedUsersService.DeleteSynchedUser(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("Requests/sent")]
        public async Task<ActionResult<List<SyncRequestDetailsModel>>> SyncRequestsSent(Guid userId)
        {
            try
            {
                List<SyncRequestDetailsModel> returnEvent = await _syncRequestService.GetSyncRequestsSent(userId);
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
        [Route("Requests/received")]
        public async Task<ActionResult<List<SyncRequestDetailsModel>>> SyncRequestsReceived(Guid userId)
        {
            try
            {
                List<SyncRequestDetailsModel> returnEvent = await _syncRequestService.GetSyncRequestsReceived(userId);
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
        [Route("Requests/responded")]
        public async Task<ActionResult<List<SyncRequestCreateUpdateModel>>> SyncRequestsResponded(Guid userId)
        {
            try
            {
                List<SyncRequestCreateUpdateModel> returnEvent = await _syncRequestService.GetRespondedSyncRequests(userId);
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
        [Route("Requests/send")]
        public async Task<ActionResult<SyncRequestCreateUpdateModel>> SendSyncRequest(SyncRequestCreateUpdateModel syncRequest)
        {
            try
            {
                SyncRequestCreateUpdateModel returnEvent = await _syncRequestService.AddSyncRequest(syncRequest);
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
        [Route("Requests/respond/{id:int}")]
        public async Task<ActionResult<UsersToSyncModel>> RespondToSyncRequest(int id, SyncRequestResponseModel syncRequest)
        {
            try
            {
                UsersToSyncModel returnEvent = await _syncRequestService.RespondToSyncRequest(id, syncRequest);
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
        [Route("Requests/{id:int}")]
        public async Task<ActionResult<SyncRequestDetailsModel>> RemoveSyncRequest(int id)
        {
            try
            {
                SyncRequestDetailsModel returnEvent = await _syncRequestService.DeleteSyncRequest(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
