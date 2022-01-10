using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [GeneTreeAuthorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : Controller
    {
        private readonly ILocationService _locationService;
        public LocationController(ILocationService locationService)
        {
            _locationService = locationService;
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<LocationModel>> GetLocationAsync(int id)
        {
            try
            {
                LocationModel returnEvent = await _locationService.GetLocationAsync(id);
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
        public async Task<ActionResult<LocationModel>> AddLocation(LocationModel location)
        {
            try
            {
                LocationModel returnEvent = await _locationService.AddLocationAsync(location);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("update")]
        public async Task<ActionResult<LocationModel>> UpdateLocation(LocationModel location)
        {
            try
            {
                LocationModel returnEvent = await _locationService.UpdateLocation(location);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id}/delete")]
        public async Task<ActionResult<LocationModel>> DeleteLocation(int id)
        {
            try
            {
                LocationModel returnEvent = await _locationService.DeleteLocation(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
