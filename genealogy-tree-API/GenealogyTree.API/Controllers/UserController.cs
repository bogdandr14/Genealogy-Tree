using GenealogyTree.API.Attributes;
using GenealogyTree.Domain;
using GenealogyTree.Domain.DTO.Email;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUserService _userService;
        private readonly IEmailService _emailService;
        public UserController(IUserService userService, IEmailService emailService)
        {
            _userService = userService;
            _emailService = emailService;
        }

        [HttpGet]
        [Route("findUsers")]
        public async Task<ActionResult<bool>> CheckUsername([FromQuery] InfiniteScrollFilter filter)
        {
            try
            {
                UsersFound usersFound = await _userService.FindUsers(filter);
                return Ok(usersFound);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }

        }
        [HttpGet]
        [Route("usernameAvailable/{username}")]
        public async Task<ActionResult<bool>> CheckUsername(string username)
        {
            try
            {
                bool isAvailable = await _userService.CheckUsernameAvailable(username);
                return Ok(isAvailable);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("emailAvailable/{email}")]
        public async Task<ActionResult<UserDetailsModel>> CheckEmail(string email)
        {
            try
            {
                bool isAvailable = await _userService.CheckEmailAvailable(email);
                return Ok(isAvailable);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("support")]
        public async Task<ActionResult<bool>> SendSupportTicket(SupportTicket supportTicket)
        {
            try
            {
                await _emailService.SendSupportTicket(supportTicket);
                return Ok(true);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("info/{username}")]
        public async Task<ActionResult<UserDetailsModel>> GetPersonalInfo(string username)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.GetUser(username);
                if (userDetails == null)
                {
                    return NotFound();
                }
                return Ok(userDetails);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("{id:Guid}")]
        public async Task<ActionResult<UserDetailsModel>> GetUserInfo(Guid id)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.GetUserByIdAsync(id);
                if (userDetails == null)
                {
                    return NotFound();
                }
                return Ok(userDetails);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpPut]
        [Route("{id:Guid}")]
        public async Task<ActionResult<UserDetailsModel>> UpdateUser(Guid id, UserUpdateModel user)
        {
            try
            {
                UserDetailsModel updatedUser = await _userService.UpdateUser(id, user);
                if (updatedUser == null)
                {
                    return NotFound();
                }
                return Ok(updatedUser);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("settings/{id:Guid}")]
        public async Task<ActionResult<UserSettingsModel>> GetUserSettings(Guid id)
        {
            try
            {
                UserSettingsModel updatedUser = await _userService.GetUserSettings(id);
                if (updatedUser == null)
                {
                    return NotFound();
                }
                return Ok(updatedUser);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpPut]
        [Route("settings/{id:Guid}")]
        public async Task<ActionResult<UserSettingsModel>> UpdateUserSettings(Guid id, UserSettingsModel user)
        {
            try
            {
                UserSettingsModel updatedUser = await _userService.UpdateUserSettings(id, user);
                if (updatedUser == null)
                {
                    return NotFound();
                }
                return Ok(updatedUser);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
