using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : Controller
    {
        private readonly IPersonService _personService;
        public PersonController(IPersonService personService)
        {
            _personService = personService;
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetPersonDetails(int id)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.GetPersonAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{name}")]
        public async Task<ActionResult> SearchPersons(string name)
        {
            try
            {
                List<PersonDetailsModel> returnEvent = await _personService.FindPerson(name);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }

        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult> AddPerson(PersonCreationModel person)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.AddPersonAsync(person);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("update")]
        public async Task<ActionResult> UpdatePerson(PersonUpdateModel person)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.UpdatePersonAsync(person);
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
                PersonDetailsModel returnEvent = await _personService.DeletePersonAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
