using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.User;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {
        private readonly IAuthService _authService;
        public AuthController(IAuthService userService)
        {
            _authService = userService;
        }

        [HttpPost]
        [Route("login")]
        public async Task<ActionResult<LoginResponseModel>> Login(LoginModel loginCredentials)
        {
            try
            {
                LoginResponseModel loginResponse = await _authService.Login(loginCredentials);

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
        public async Task<ActionResult<UserDetailsModel>> Register(RegisterModel userRegister)
        {
            try
            {
                UserDetailsModel userDetails = await _authService.Register(userRegister);

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
        [Route("changePassword")]
        public async Task<ActionResult<UserDetailsModel>> ChangePassword(UpdatePasswordModel updatePassword)
        {
            try
            {
                UserDetailsModel updatedUser = await _authService.UpdatePassword(updatePassword);

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
