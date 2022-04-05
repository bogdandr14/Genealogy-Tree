using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
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
    public class RelativeController : Controller
    {
        private readonly IParentChildService _parentChildService;
        public RelativeController(IParentChildService parentChildService)
        {
            _parentChildService = parentChildService;
        }

        [HttpGet]
        [Route("parents/{childId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetAllParents(int childId)
        {
            try
            {
                List<RelativeModel> parents = await _parentChildService.GetAllParentsForPerson(childId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("children/{parentId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetAllChildren(int parentId)
        {
            try
            {
                List<RelativeModel> children = await _parentChildService.GetAllChildrenForPerson(parentId);
                if (children == null)
                {
                    return NotFound();
                }
                return Ok(children);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("ancestors/{personId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetAncestors(int personId)
        {
            try
            {
                List<RelativeModel> parents = await _parentChildService.GetAllAncestors(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("descendants/{personId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetDescendants(int personId)
        {
            try
            {
                List<RelativeModel> parents = await _parentChildService.GetAllDescendants(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
        [HttpGet]
        [Route("related/{personId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetRelatedPeople(int personId)
        {
            try
            {
                List<RelativeModel> parents = await _parentChildService.GetRelatedPeople(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
        [HttpGet]
        [Route("unrelated/{personId:int}")]
        public async Task<ActionResult<List<GenericPersonModel>>> GetUnrelatedPeople(int personId)
        {
            try
            {
                List<GenericPersonModel> parents = await _parentChildService.GetUnrelatedPeople(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("bloodRelated/{personId:int}")]
        public async Task<ActionResult<List<RelativeModel>>> GetBloodRelatedPeople(int personId)
        {
            try
            {
                List<RelativeModel> parents = await _parentChildService.GetBloodRelatedPeople(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
        [HttpGet]
        [Route("notBloodRelated/{personId:int}")]
        public async Task<ActionResult<List<GenericPersonModel>>> GetNotBLoodRelated(int personId)
        {
            try
            {
                List<GenericPersonModel> parents = await _parentChildService.GetNotBloodRelatedPeople(personId);
                if (parents == null)
                {
                    return NotFound();
                }
                return Ok(parents);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<ActionResult<ParentChildDetailsModel>> GetParentChild(int id)
        {
            try
            {
                ParentChildDetailsModel returnEvent = await _parentChildService.GetParentChildAsync(id);
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
        public async Task<ActionResult<ParentChildDetailsModel>> AddParentChild(ParentChildCreateUpdateModel parentChild)
        {
            try
            {
                ParentChildDetailsModel returnEvent = await _parentChildService.AddParentChildAsync(parentChild);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPut]
        [Route("")]
        public async Task<ActionResult<ParentChildDetailsModel>> UpdateRelativeLink(ParentChildCreateUpdateModel parentChild)
        {
            try
            {
                ParentChildDetailsModel returnEvent = await _parentChildService.UpdateParentChildAsync(parentChild);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id:int}")]
        public async Task<ActionResult<ParentChildDetailsModel>> DeleteRelativeLink(int id)
        {
            try
            {
                ParentChildDetailsModel returnEvent = await _parentChildService.DeleteParentChildAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
