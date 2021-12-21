using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO;
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
    public class OccupationController : Controller
    {
        private readonly IOccupationService _occupationService;
        public OccupationController(IOccupationService occupationService)
        {
            _occupationService = occupationService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<OccupationModel>>> GetPersonOccupations(int personId)
        {
            try
            {
                List<OccupationModel> returnEvent = _occupationService.GetAllOccupationsForPerson(personId);
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
        [Route("{id}")]
        public async Task<ActionResult<OccupationModel>> GetOccupation(int id)
        {
            try
            {
                OccupationModel returnEvent = await _occupationService.GetOccupationAsync(id);
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
        public async Task<ActionResult<OccupationModel>> AddOccupation(OccupationModel occupation)
        {
            try
            {
                OccupationModel returnEvent = await _occupationService.AddOccupationAsync(occupation);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("update")]
        public async Task<ActionResult<OccupationModel>> UpdateOccupation(OccupationModel occupation)
        {
            try
            {
                OccupationModel returnEvent = await _occupationService.UpdateOccupationAsync(occupation);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id}/delete")]
        public async Task<ActionResult<OccupationModel>> DeleteOccupation(int id)
        {
            try
            {
                OccupationModel returnEvent = await _occupationService.DeleteOccupationAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
