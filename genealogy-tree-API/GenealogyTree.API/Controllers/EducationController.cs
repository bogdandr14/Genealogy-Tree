using GenealogyTree.API.Attributes;
using GenealogyTree.Business.Auth;
using GenealogyTree.Domain.DTO;
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
    public class EducationController : Controller
    {
        private readonly IEducationService _educationService;
        public EducationController(IEducationService educationService)
        {
            _educationService = educationService;
        }

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("ForPerson/{personId:Guid}")]
        public async Task<ActionResult<List<EducationModel>>> GetPersonEducations(Guid personId)
        {
            try
            {
                List<EducationModel> returnEvent = _educationService.GetAllEducationsForUser(personId);
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

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<EducationModel>> GetEducation(int id)
        {
            try
            {
                EducationModel returnEvent = await _educationService.GetEducationAsync(id);
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

        [GeneTreeAuthorize]
        [HttpPost]
        [Route("")]
        public async Task<ActionResult<EducationModel>> AddEducation(EducationModel education)
        {
            try
            {
                EducationModel returnEvent = await _educationService.AddEducationAsync(education);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpPut]
        [Route("")]
        public async Task<ActionResult<EducationModel>> UpdateEducation( EducationModel education)
        {
            try
            {
                EducationModel returnEvent = await _educationService.UpdateEducationAsync(education);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [GeneTreeAuthorize]
        [HttpDelete]
        [Route("{id:int}")]
        public async Task<ActionResult> DeleteEducation(int id)
        {
            try
            {
                EducationModel returnEvent = await _educationService.DeleteEducationAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("levels")]
        public async Task<ActionResult<List<GenericNameModel>>> GetEducationLevels()
        {
            try
            {
                List<GenericNameModel> returnEvent = await _educationService.GetAllEducationLevelsAsync();
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

        [GeneTreeAuthorize(UserRoleEnum.Admin)]
        [HttpPost]
        [Route("levels")]
        public async Task<ActionResult<GenericNameModel>> AddEducationLevel(string name)
        {
            try
            {
                GenericNameModel returnEvent = await _educationService.AddEducationLevelAsync(name);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
