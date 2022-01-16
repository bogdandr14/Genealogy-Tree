﻿using GenealogyTree.API.Attributes;
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
        public UserController(IUserService userService)
        {
            _userService = userService;
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
        [Route("update")]
        public async Task<ActionResult<UserDetailsModel>> UpdateUser(UserUpdateModel user)
        {
            try
            {
                UserDetailsModel updatedUser = await _userService.UpdateUser(user);
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

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("settings/{username}")]
        public async Task<ActionResult<UserSettingsModel>> GetUserSettings(string username)
        {
            try
            {
                UserSettingsModel updatedUser = await _userService.GetUserSettings(username);
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
        [Route("settings/update")]
        public async Task<ActionResult<UserSettingsModel>> UpdateUserSettings(UserSettingsModel user)
        {
            try
            {
                UserSettingsModel updatedUser = await _userService.UpdateUserSettings(user);
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
