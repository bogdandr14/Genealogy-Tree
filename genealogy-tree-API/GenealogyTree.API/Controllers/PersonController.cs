using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
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
    public class PersonController : Controller
    {
        private readonly IPersonService _personService;
        public PersonController(IPersonService personService)
        {
            _personService = personService;
        }

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
        [Route("tree/{treeId:Guid}")]
        public async Task<ActionResult<GenericPersonModel>> GetPeopleInTree(Guid treeId)
        {
            try
            {
                List<GenericPersonModel> returnEvent = await _personService.GetAllPeopleInTree(treeId);
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
        [Route("search/{name}")]
        public async Task<ActionResult<PersonDetailsModel>> SearchPeople(string name)
        {
            try
            {
                List<PersonDetailsModel> returnEvent = await _personService.FindPeople(name);
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
        public async Task<ActionResult<PersonDetailsModel>> AddPerson(PersonCreateUpdateModel person)
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
        [Route("update/{id:int}")]
        public async Task<ActionResult<PersonDetailsModel>> UpdatePerson(PersonCreateUpdateModel person)
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
        [Route("{id:int}")]
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

        [HttpPut]
        [Route("updatePhoto")]
        public async Task<ActionResult<PersonDetailsModel>> UpdatePhoto([MaxImageSize(2 * 1024)]PersonImageUpdateModel imageUpdate)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.UpdatePersonAsync(imageUpdate);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("photo")]
        public async Task<ActionResult<PersonDetailsModel>> GetPhoto(int imageId)
        {
            try
            {
                var imagePath = await personservice.SaveEventImageAsync(eventId.Value, version, image.ToGenericFile());

                Image image = await _imageService.getImageAsync(imageId);
                if(image is null)
                {
                    return NoContent();
                }
                var imageContent =  await _imageService.GetFile(image.Path);
                if(imageContent !=null && imageContent.Length > 0)
                {
                    return File(imageContent, image.MimeType);
                }
                return NoContent();
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }



    }
}
