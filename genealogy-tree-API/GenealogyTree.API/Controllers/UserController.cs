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

        [HttpPost]
        [Route("login")]
        public async Task<ActionResult<LoginResponseModel>> Login(LoginModel loginCredentials)
        {
            try
            {
                LoginResponseModel loginResponse = await _userService.LoginUser(loginCredentials);
                if (loginResponse == null)
                {
                    return NotFound();
                }
                return Ok(loginResponse);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("register")]
        public async Task<ActionResult<UserDetailsModel>> Register(UserRegisterModel userRegister)
        {
            try
            {
                UserDetailsModel userDetails = await _userService.RegisterUser(userRegister);
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

        //[Authorize]
        [HttpGet]
        [Route("info")]
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

        //[Authorize]
        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<UserDetailsModel>> GetUserInfo(int id)
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

        //[Authorize]
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

       // [Authorize]
        [HttpPut]
        [Route("changePassword")]
        public async Task<ActionResult<UserDetailsModel>> ChangePassword(UpdatePasswordModel updatePassword)
        {
            try
            {
                UserDetailsModel updatedUser = await _userService.UpdatePassword(updatePassword);
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
