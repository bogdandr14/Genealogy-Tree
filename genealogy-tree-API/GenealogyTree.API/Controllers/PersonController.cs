using GenealogyTree.API.Attributes;
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

        [GeneTreeAuthorize]
        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<PersonDetailsModel>> GetPersonDetails(int id)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.GetPersonAsync(id);
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
        [Route("{name}")]
        public async Task<ActionResult<PersonDetailsModel>> SearchPersons(string name)
        {
            try
            {
                List<PersonDetailsModel> returnEvent = await _personService.FindPerson(name);
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
        public async Task<ActionResult<PersonDetailsModel>> AddPerson(PersonCreationModel person)
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
        public async Task<ActionResult<PersonDetailsModel>> UpdatePerson(PersonUpdateModel person)
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
        [Route("{id:int}/delete")]
        public async Task<ActionResult<PersonDetailsModel>> DeletePerson(int id)
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
