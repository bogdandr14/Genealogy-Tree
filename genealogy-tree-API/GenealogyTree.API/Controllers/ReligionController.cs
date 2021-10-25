using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    //[Authorize]
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
        public async Task<ActionResult> GetAllReligions()
        {
            try
            {
                System.Collections.Generic.List<Religion> religions = await _religionService.GetAllReligionsAsync();
                return Ok(religions);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("Find/{name}")]
        public async Task<ActionResult> FindReligion(string name)
        {
            try
            {
                System.Collections.Generic.List<Religion> religions = _religionService.FindReligions(name);
                return Ok(religions);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> AddReligion(string religionName)
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
