using GenealogyTree.Business.Services;
using GenealogyTree.Domain.Interfaces.Services;
using GenealogyTree.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EducationController : Controller
    {
        private readonly IEducationService _educationService;
        public EducationController(IEducationService educationService)
        {
            _educationService = educationService;
        }
        [HttpGet]
        [Route("")]
        public async Task<ActionResult> Index()
        {
            return Ok(await _educationService.GetEducationAsync(1));
        }
        [HttpPut]
        [Route("AddEducation")]
        public async Task<ActionResult> AddEducation(EducationModel education)
        {
            return Ok(await _educationService.AddEducationAsync(education));
        }
    }
}
