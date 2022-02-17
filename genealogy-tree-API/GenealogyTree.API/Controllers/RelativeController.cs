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
        public async Task<ActionResult<List<ParentModel>>> GetAllParents(int childId)
        {
            try
            {
                List<ParentModel> parents = await _parentChildService.GetAllParentsForPerson(childId);
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
        public async Task<ActionResult<List<ParentModel>>> GetAllChildren(int parentId)
        {
            try
            {
                List<ChildModel> children = await _parentChildService.GetAllChildrenForPerson(parentId);
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
        public async Task<ActionResult<List<ParentModel>>> GetAncestors(int personId)
        {
            try
            {
                List<ParentModel> parents = await _parentChildService.GetAllAncestors(personId);
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
        public async Task<ActionResult<List<ParentModel>>> GetDescendants(int personId)
        {
            try
            {
                List<ChildModel> parents = await _parentChildService.GetAllDescendants(personId);
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
        public async Task<ActionResult<List<BasePersonModel>>> GetUnrelatedPeople(int personId)
        {
            try
            {
                List<BasePersonModel> parents = await _parentChildService.GetUnrelatedPeople(personId);
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
        [Route("{id:int}")]
        public async Task<ActionResult<ParentChildDetailsModel>> UpdateLocation(int id, ParentChildCreateUpdateModel parentChild)
        {
            try
            {
                ParentChildDetailsModel returnEvent = await _parentChildService.UpdateParentChildAsync(id, parentChild);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpDelete]
        [Route("{id:int}")]
        public async Task<ActionResult<ParentChildDetailsModel>> DeleteLocation(int id)
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
