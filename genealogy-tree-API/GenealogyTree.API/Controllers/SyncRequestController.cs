using GenealogyTree.Domain.DTO.Sync;
using GenealogyTree.Domain.DTO.SyncRequest;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SyncRequestController : Controller
    {
        private readonly ISyncRequestService _syncRequestService;
        public SyncRequestController(ISyncRequestService syncRequestService)
        {
            _syncRequestService = syncRequestService;
        }

        [HttpGet]
        [Route("sent")]
        public async Task<ActionResult<List<SyncRequestDetailsModel>>> SyncRequestsSent(int userId)
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
        [Route("received")]
        public async Task<ActionResult<List<SyncRequestDetailsModel>>> SyncRequestsReceived(int userId)
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
        [Route("responded")]
        public async Task<ActionResult<List<SyncRequestCreateUpdateModel>>> SyncRequestsResponded(int userId)
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
        [Route("send")]
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
        [Route("respond")]
        public async Task<ActionResult<UsersToSyncModel>> RespondToSyncRequest(SyncRequestResponseModel syncRequest)
        {
            try
            {
                UsersToSyncModel returnEvent = await _syncRequestService.RespondToSyncRequest(syncRequest);
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
        [Route("{id:int}/delete")]
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
