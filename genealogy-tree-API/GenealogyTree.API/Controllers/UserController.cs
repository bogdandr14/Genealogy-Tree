using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
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

        [HttpGet]
        [Route("login")]
        public async Task<ActionResult> Login(LoginModel loginCredentials)
        {
            try
            {
                LoginResponseModel loginResponse = await _userService.LoginUser(loginCredentials);
                return Ok(loginResponse);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("register")]
        public async Task<ActionResult> Register(UserRegisterModel userRegister)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.RegisterUser(userRegister);
                return Ok(userDetails);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [Authorize]
        [HttpGet]
        [Route("info")]
        public async Task<ActionResult> GetPersonalInfo(string username)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.GetUser(username);
                return Ok(userDetails);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [Authorize]
        [HttpGet]
        [Route("info/{id}")]
        public async Task<ActionResult> GetUserInfo(int id)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.GetUserByIdAsync(id);
                return Ok(userDetails);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [Authorize]
        [HttpPut]
        [Route("info/update")]
        public async Task<ActionResult> UpdateUser(UserUpdateModel user)
        {
            try
            {
                UserDetailsModel updatedUser = await _userService.UpdateUser(user);
                return Ok(updatedUser);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [Authorize]
        [HttpPut]
        [Route("info/change-password")]
        public async Task<ActionResult> ChangePassword(UpdatePasswordModel updatePassword)
        {
            try
            {
                UserDetailsModel updatedUser = await _userService.UpdatePassword(updatePassword);
                return Ok(updatedUser);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
