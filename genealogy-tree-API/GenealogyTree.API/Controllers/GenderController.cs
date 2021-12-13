using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    //[Authorize]
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
        public async Task<ActionResult<List<Gender>> > GetAllGenders()
        {
            try
            {
                List<Gender> returnEvent = await _genderService.GetAllGendersAsync();
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<Gender>> GetGender(int id)
        {
            try
            {
                Gender returnEvent = await _genderService.GetGenderAsync(id);
                if(returnEvent == null)
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
        [Route("find/{name}")]
        public async Task<ActionResult<List<Gender>>> FindGender(string name)
        {
            try
            {
                List<Gender> returnEvent = _genderService.FindGenders(name);
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

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult<Gender>> AddGender(string genderName)
        {
            try
            {
                Gender returnEvent = await _genderService.AddGenderAsync(genderName);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
