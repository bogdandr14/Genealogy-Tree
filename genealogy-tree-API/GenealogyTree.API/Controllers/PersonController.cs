using GenealogyTree.API.Attributes;
using GenealogyTree.Business.Helpers;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [GeneTreeAuthorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : Controller
    {
        private readonly IPersonService _personService;
        private readonly IImageService _imageService;
        public PersonController(IPersonService personService, IImageService imageService)
        {
            _personService = personService;
            _imageService = imageService;
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
        public async Task<ActionResult<BasePersonModel>> GetPeopleInTree(Guid treeId)
        {
            try
            {
                List<BasePersonModel> returnEvent = await _personService.GetAllPeopleInTree(treeId);
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
        [Route("photo/update")]
        public async Task<ActionResult<ImageFile>> UpdatePhoto([FromQuery] int personId, [FromQuery] int imageId)
        {
            try
            {
                ImageFile imageFile = await _personService.UpdatePictureAsync(personId, imageId);
                return Ok(imageFile);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("photo/upload")]
        public async Task<ActionResult<ImageFile>> UploadPhoto([FromQuery] int personId, [Required][FromForm][MaxImageSize(4 * 1024)] IFormFile image)
        {
            try
            {
                Image createdImage = await _imageService.AddImageAsync(image.ToImageFile());
                ImageFile imageFile = await _personService.UpdatePictureAsync(personId, createdImage.Id);
                return Ok(imageFile);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
