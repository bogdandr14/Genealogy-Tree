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
    public class CommonController : Controller
    {
        private readonly INationalityService _nationalityService;
        private readonly IReligionService _religionService;

        public CommonController(INationalityService nationalityService, IReligionService religionService)
        {
            _nationalityService = nationalityService;
            _religionService = religionService;
        }

        [HttpGet]
        [Route("nationality")]
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

        [GeneTreeAuthorize(UserRoles.Admin)]
        [HttpPost]
        [Route("nationality")]
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

        [HttpGet]
        [Route("religion")]
        public async Task<ActionResult<List<GenericNameModel>>> GetAllReligions()
        {
            try
            {
                List<GenericNameModel> religions = await _religionService.GetAllReligionsAsync();

                if (religions == null)
                {
                    return NotFound();
                }

                return Ok(religions);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize(UserRoles.Admin)]
        [HttpPost]
        [Route("religion")]
        public async Task<ActionResult<GenericNameModel>> AddReligion(string religionName)
        {
            try
            {
                GenericNameModel religion = await _religionService.AddReligionAsync(religionName);
                return Ok(religion);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
