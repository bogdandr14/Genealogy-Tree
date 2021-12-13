using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    //    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class EducationController : Controller
    {
        private readonly IEducationService _educationService;
        public EducationController(IEducationService educationService)
        {
            _educationService = educationService;
        }

        [HttpGet]
        [Route("")]
        public async Task<ActionResult<List<EducationModel>>> GetPersonEducations(int personId)
        {
            try
            {
                List<EducationModel> returnEvent = _educationService.GetAllEducationsForPerson(personId);
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

        [HttpPost]
        [Route("add")]
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

        [HttpPut]
        [Route("update")]
        public async Task<ActionResult<EducationModel>> UpdateEducation(EducationModel education)
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

        [HttpDelete]
        [Route("{id}/delete")]
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
    }
}
