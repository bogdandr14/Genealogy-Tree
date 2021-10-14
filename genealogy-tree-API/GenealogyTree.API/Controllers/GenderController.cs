using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
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
        public async Task<ActionResult> GetAllGenders()
        {
            try
            {
                System.Collections.Generic.List<Gender> genders = await _genderService.GetAllGendersAsync();
                return Ok(genders);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{genderId}")]
        public async Task<ActionResult> GetGender(int genderId)
        {
            try
            {
                Gender gender = await _genderService.GetGenderAsync(genderId);
                return Ok(gender);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("Find/{name}")]
        public async Task<ActionResult> FindGender(string name)
        {
            try
            {
                System.Collections.Generic.List<Gender> genders = _genderService.FindGenders(name);
                return Ok(genders);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> AddGender(string genderName)
        {
            try
            {
                Gender gender = await _genderService.AddGenderAsync(genderName);
                return Ok(gender);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
