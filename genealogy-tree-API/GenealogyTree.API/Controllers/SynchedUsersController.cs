using GenealogyTree.Domain.DTO.SynchedUser;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SynchedUsersController : Controller
    {
        private readonly ISynchedUsersService _synchedUsersService;
        public SynchedUsersController(ISynchedUsersService synchedUsersService)
        {
            _synchedUsersService = synchedUsersService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<SynchedUserModel>>> GetSynchedUsersForCurrentUser(int userId)
        {
            try
            {
                List<SynchedUserModel> returnEvent = await _synchedUsersService.GetAllSynchedUsersForUser(userId);
                if(returnEvent== null)
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
        [Route("{id:int}")]
        public async Task<ActionResult> GetSynchedUser(int id)
        {
            try
            {
                SynchedUserModel returnEvent = await _synchedUsersService.GetSynchedUser(id);
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
        [Route("add")]
        public async Task<ActionResult<UsersToSyncModel>> SynchedUsersResponded(UsersToSyncModel usersToSync)
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
        [Route("{id:int}/remove")]
        public async Task<ActionResult<SynchedUserModel>> RemoveSynchedUser(int id)
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
