using GenealogyTree.API.Attributes;
using GenealogyTree.Business.Auth;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenderController : Controller
    {
        private readonly IGenderService _genderService;
        public GenderController(IGenderService genderService)
        {
            _genderService = genderService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<GenericNameModel>>> GetAllGenders()
        {
            try
            {
                List<GenericNameModel> returnEvent = await _genderService.GetAllGendersAsync();
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<GenericNameModel>> GetGender(int id)
        {
            try
            {
                GenericNameModel returnEvent = await _genderService.GetGenderAsync(id);
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
        [Route("search/{name}")]
        public async Task<ActionResult<List<GenericNameModel>>> SearchGenders(string name)
        {
            try
            {
                List<GenericNameModel> returnEvent = _genderService.FindGenders(name);
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

        [GeneTreeAuthorize(UserRoleEnum.Admin)]
        [HttpPost]
        [Route("add")]
        public async Task<ActionResult<GenericNameModel>> AddGender(string genderName)
        {
            try
            {
                GenericNameModel returnEvent = await _genderService.AddGenderAsync(genderName);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
