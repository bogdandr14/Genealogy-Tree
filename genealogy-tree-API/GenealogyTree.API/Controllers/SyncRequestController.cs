using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using Microsoft.AspNetCore.Http;
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
        public async Task<ActionResult> SyncRequestsSent(int userId)
        {
            try
            {
                List<SyncRequestForSenderModel> returnEvent = await _syncRequestService.GetSyncRequestsSent(userId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("received")]
        public async Task<ActionResult> SyncRequestsReceived(int userId)
        {
            try
            {
                List<SyncRequestForReceiverModel> returnEvent = await _syncRequestService.GetSyncRequestsReceived(userId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("responded")]
        public async Task<ActionResult> SyncRequestsResponded(int userId)
        {
            try
            {
                List<SyncRequestForSenderModel> returnEvent = await _syncRequestService.GetRespondedSyncRequests(userId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("send")]
        public async Task<ActionResult> SendSyncRequest(SyncRequestForSenderModel syncRequest)
        {
            try
            {
                SyncRequestForSenderModel returnEvent = await _syncRequestService.AddSyncRequest(syncRequest);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("respond")]
        public async Task<ActionResult> RespondToSyncRequest(SyncRequestForReceiverModel syncRequest)
        {
            try
            {
                UsersToSyncModel returnEvent = await _syncRequestService.RespondToSyncRequest(syncRequest);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id}/delete")]
        public async Task<ActionResult> RepoveSyncRequest(int id)
        {
            try
            {
                SyncRequestForSenderModel returnEvent = await _syncRequestService.DeleteSyncRequest(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
