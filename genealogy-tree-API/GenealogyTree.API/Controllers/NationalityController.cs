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
    public class NationalityController : Controller
    {
        private readonly INationalityService _nationalityService;
        public NationalityController(INationalityService nationalityService)
        {
            _nationalityService = nationalityService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<GenericNameModel>>> GetAllNationalities()
        {
            try
            {
                List<GenericNameModel> nationalities = await _nationalityService.GetAllNationalitiesAsync();
                if (nationalities == null)
                {
                    return NotFound();
                }
                return Ok(nationalities);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<GenericNameModel>> GetNationality(int id)
        {
            try
            {
                GenericNameModel returnEvent = await _nationalityService.GetNationalityAsync(id);
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
        public async Task<ActionResult<List<GenericNameModel>>> SearchNationalities(string name)
        {
            try
            {
                List<GenericNameModel> nationalities = _nationalityService.FindNationalities(name);
                if (nationalities == null)
                {
                    return NotFound();
                }
                return Ok(nationalities);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize(UserRoleEnum.Admin)]
        [HttpPost]
        [Route("add")]
        public async Task<ActionResult<GenericNameModel>> AddNationality(string nationalityName)
        {
            try
            {
                GenericNameModel nationality = await _nationalityService.AddNationalityAsync(nationalityName);
                return Ok(nationality);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
