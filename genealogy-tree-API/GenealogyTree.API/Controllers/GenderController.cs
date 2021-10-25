﻿using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [Authorize]
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
                List<Gender> returnEvent = await _genderService.GetAllGendersAsync();
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<ActionResult> GetGender(int id)
        {
            try
            {
                Gender returnEvent = await _genderService.GetGenderAsync(id);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet]
        [Route("find/{name}")]
        public async Task<ActionResult> FindGender(string name)
        {
            try
            {
                List<Gender> returnEvent = _genderService.FindGenders(name);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult> AddGender(string genderName)
        {
            try
            {
                Gender returnEvent = await _genderService.AddGenderAsync(genderName);
                return Ok(returnEvent);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
