using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    public class SynchedUsersController : Controller
    {
        private readonly ISynchedUsersService _synchedUsersService;
        public SynchedUsersController(ISynchedUsersService synchedUsersService)
        {
            _synchedUsersService = synchedUsersService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult> GetSynchedUsersForCurrentUser(int userId)
        {
            try
            {
                List<SynchedUserModel> returnEvent = await _synchedUsersService.GetAllSynchedUsersForUser(userId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetSynchedUser(int id)
        {
            try
            {
                SynchedUserModel returnEvent = await _synchedUsersService.GetSynchedUser(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult> SynchedUsersResponded(UsersToSyncModel usersToSync)
        {
            try
            {
                SynchedUserModel returnEvent = await _synchedUsersService.AddSynchedUser(usersToSync);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id}/remove")]
        public async Task<ActionResult> RemoveSynchedUser(int id)
        {
            try
            {
                SynchedUserModel returnEvent = await _synchedUsersService.DeleteSynchedUser(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

    }
}
