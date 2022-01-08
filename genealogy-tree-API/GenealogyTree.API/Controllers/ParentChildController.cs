﻿using GenealogyTree.API.Attributes;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [GeneTreeAuthorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ParentChildController : Controller
    {
        private readonly IParentChildService _parentChildService;
        public ParentChildController(IParentChildService parentChildService)
        {
            _parentChildService = parentChildService;
        }

        [HttpGet]
        [Route("/parents/{childId:int}")]
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
        [Route("/children/{parentId:int}")]
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
        [Route("add")]
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
        [Route("update")]
        public async Task<ActionResult<ParentChildDetailsModel>> UpdateLocation(ParentChildCreateUpdateModel parentChild)
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
        [Route("{id:int}/delete")]
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
