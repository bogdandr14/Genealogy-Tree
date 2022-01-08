using AutoMapper;
using GenealogyTree.Domain.DTO.Generic;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class EducationLevelService : BaseService, IEducationLevelService
    {
        private readonly IMapper _mapper;
        public EducationLevelService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<GenericNameModel>> GetAllEducationLevelsAsync()
        {
            List<EducationLevel> educationLevels = unitOfWork.EducationLevel.GetAll().ToList();
            List<GenericNameModel> returnEvent = _mapper.Map<List<GenericNameModel>>(educationLevels);
            return returnEvent;
        }

        public async Task<GenericNameModel> GetEducationLevelAsync(int educationLevelId)
        {
            EducationLevel educationLevel = await unitOfWork.EducationLevel.FindById(educationLevelId);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(educationLevel);
            return returnEvent;
        }

        public async Task<GenericNameModel> AddEducationLevelAsync(string educationLevelName)
        {
            if (educationLevelName == null)
            {
                return null;
            }
            EducationLevel educationLevel = new EducationLevel()
            {
                Name = educationLevelName
            };
            EducationLevel educationEntity = await unitOfWork.EducationLevel.Create(educationLevel);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(educationEntity);
            return returnEvent;
        }
    }
}
