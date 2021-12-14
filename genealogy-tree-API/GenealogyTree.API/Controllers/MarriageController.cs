using GenealogyTree.Domain.DTO;
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
    public class MarriageController : Controller
    {
        private readonly IMarriageService _marriageService;
        public MarriageController(IMarriageService marriageService)
        {
            _marriageService = marriageService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<MarriageModel>>> GetPersonMarriages(int personId)
        {
            try
            {
                List<MarriageModel> returnEvent = await _marriageService.GetAllMarriagesForPerson(personId);
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
        [Route("current")]
        public async Task<ActionResult<MarriageModel>> GetPersonCurrentMarriage(int personId)
        {
            try
            {
                MarriageModel returnEvent = await _marriageService.GetCurrentMarriageForPerson(personId);
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
        [Route("{id:int}")]
        public async Task<ActionResult<MarriageModel>> GetMarriage(int id)
        {
            try
            {
                MarriageModel returnEvent = await _marriageService.GetMarriageAsync(id);
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
        public async Task<ActionResult<MarriageModel>> AddMarriage(MarriageModel marriage)
        {
            try
            {
                MarriageModel returnEvent = await _marriageService.AddMarriageAsync(marriage);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("update")]
        public async Task<ActionResult<MarriageModel>> UpdateMarriage(MarriageModel marriage)
        {
            try
            {
                MarriageModel returnEvent = await _marriageService.UpdateMarriageAsync(marriage);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
