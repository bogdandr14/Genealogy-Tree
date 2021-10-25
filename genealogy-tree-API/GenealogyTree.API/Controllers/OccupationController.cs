using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Authorize]
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
        public async Task<ActionResult> GetPersonOccupations(int personId)
        {
            try
            {
                List<OccupationModel> returnEvent = _occupationService.GetAllOccupationsForPerson(personId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetOccupation(int id)
        {
            try
            {
                OccupationModel returnEvent = await _occupationService.GetOccupationAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult> AddOccupation(OccupationModel occupation)
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
        public async Task<ActionResult> UpdateOccupation(OccupationModel occupation)
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
        public async Task<ActionResult> DeleteOccupation(int id)
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
