using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [GeneTreeAuthorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ReligionController : Controller
    {
        private readonly IReligionService _religionService;
        public ReligionController(IReligionService religionService)
        {
            _religionService = religionService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<Religion>>> GetAllReligions()
        {
            try
            {
                List<Religion> religions = await _religionService.GetAllReligionsAsync();
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

        [HttpGet]
        [Route("find/{name}")]
        public async Task<ActionResult<List<Religion>>> FindReligion(string name)
        {
            try
            {
                List<Religion> religions = _religionService.FindReligions(name);
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

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult<Religion>> AddReligion(string religionName)
        {
            try
            {
                Religion religion = await _religionService.AddReligionAsync(religionName);
                return Ok(religion);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
