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
    public class ReligionService : BaseService, IReligionService
    {
        private readonly IMapper _mapper;
        public ReligionService(IUnitOfWork repositoryWrapper, IMapper mapper) : base(repositoryWrapper)
        {
            _mapper = mapper;
        }

        public async Task<List<GenericNameModel>> GetAllReligionsAsync()
        {
            List<Religion> religions = await Task.Run(() => unitOfWork.Religion.GetAll().OrderBy(x => x.Name).ToList());
            List<GenericNameModel> returnEvent = _mapper.Map<List<GenericNameModel>>(religions);
            return returnEvent;
        }

        public async Task<GenericNameModel> AddReligionAsync(string religionName)
        {
            if (religionName == null)
            {
                return null;
            }
            Religion religion = new Religion()
            {
                Name = religionName
            };
            Religion religionEntity = await unitOfWork.Religion.Create(religion);
            GenericNameModel returnEvent = _mapper.Map<GenericNameModel>(religionEntity);
            return returnEvent;
        }
    }
}
