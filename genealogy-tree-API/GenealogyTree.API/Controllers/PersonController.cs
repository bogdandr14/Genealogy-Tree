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
        private readonly ILocationService _locationService;

        public PersonController(IPersonService personService, IImageService imageService, ILocationService locationService)
        {
            _personService = personService;
            _imageService = imageService;
            _locationService = locationService;
        }

        [HttpGet]
        [Route("treeList/{treeId:Guid}")]
        public async Task<ActionResult<GenericPersonModel>> GetPeopleListInTree(Guid treeId)
        {
            try
            {
                List<GenericPersonModel> returnEvent = await _personService.GetPeopleListInTree(treeId);
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
        [Route("treeData/{treeId:Guid}")]
        public async Task<ActionResult<PersonTreeInfoModel>> GetPeopleTreeDataInTree(Guid treeId)
        {
            try
            {
                List<PersonTreeInfoModel> returnEvent = await _personService.GetPeopleTreeDataInTree(treeId);
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
        [Route("events/{treeId:Guid}")]
        public async Task<ActionResult<EventInTreeModel>> GetEventsInTree(Guid treeId)
        {
            try
            {
                List<EventInTreeModel> returnEvent = await _personService.GetEventsInTree(treeId);
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
        [Route("withoutRelative/{treeId:Guid}")]
        public async Task<ActionResult<PersonTreeInfoModel>> GetPeopleWithoutRelative(Guid treeId)
        {
            try
            {
                List<GenericPersonModel> returnEvent = await _personService.GetPeopleWithoutRelative(treeId);
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

        [HttpPost]
        [Route("")]
        public async Task<ActionResult<PersonDetailsModel>> AddPerson([FromBody]PersonCreateUpdateModel person)
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
        [Route("")]
        public async Task<ActionResult<PersonDetailsModel>> UpdatePerson(PersonCreateUpdateModel person)
        {
            try
            {
                PersonDetailsModel returnEvent = await _personService.UpdatePersonAsync( person);
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

        [HttpPost]
        [Route("photo/{personId:int}")]
        public async Task<ActionResult<ImageFile>> UploadPhoto(int personId, [Required][FromForm][MaxImageSize(4 * 1024)] IFormFile image)
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

        [HttpPut]
        [Route("photo")]
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
    }
}
