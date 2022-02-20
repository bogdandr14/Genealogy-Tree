using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Marriage;
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
    public class MarriageController : Controller
    {
        private readonly IMarriageService _marriageService;
        public MarriageController(IMarriageService marriageService)
        {
            _marriageService = marriageService;
        }

        [HttpGet]
        [Route("ForPerson/{personId:int}")]
        public async Task<ActionResult<List<MarriedPersonModel>>> GetPersonMarriages(int personId)
        {
            try
            {
                List<MarriedPersonModel> returnEvent = await _marriageService.GetAllMarriagesForPerson(personId);
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
        [Route("ForPerson/{personId:int}/current")]
        public async Task<ActionResult<MarriedPersonModel>> GetPersonCurrentMarriage(int personId)
        {
            try
            {
                MarriedPersonModel returnEvent = await _marriageService.GetCurrentMarriageForPerson(personId);
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
        public async Task<ActionResult<MarriageDetailsModel>> GetMarriage(int id)
        {
            try
            {
                MarriageDetailsModel returnEvent = await _marriageService.GetMarriageAsync(id);
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
        [Route("")]
        public async Task<ActionResult<MarriageDetailsModel>> AddMarriage(MarriageCreateUpdateModel marriage)
        {
            try
            {
                MarriageDetailsModel returnEvent = await _marriageService.AddMarriageAsync(marriage);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("")]
        public async Task<ActionResult<MarriageDetailsModel>> UpdateMarriage(MarriageCreateUpdateModel marriage)
        {
            try
            {
                MarriageDetailsModel returnEvent = await _marriageService.UpdateMarriageAsync(marriage);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
