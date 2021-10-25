using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using Microsoft.AspNetCore.Authorization;
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
        public async Task<ActionResult> GetPersonEducations(int personId)
        {
            try
            {
                List<EducationModel> returnEvent = _educationService.GetAllEducationsForPerson(personId);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetEducation(int id)
        {
            try
            {
                EducationModel returnEvent = await _educationService.GetEducationAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }

        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult> AddEducation(EducationModel education)
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
        public async Task<ActionResult> UpdateEducation(EducationModel education)
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
