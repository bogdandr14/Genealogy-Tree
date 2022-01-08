using AutoMapper;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ParentChildService : BaseService, IParentChildService
    {
        private readonly IMapper _mapper;
        public ParentChildService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _mapper = mapper;
        }

        public async Task<List<ParentModel>> GetAllParentsForPerson(int childId)
        {
            List<ParentChild> parentsChildren = unitOfWork.ParentChild.Filter(x => x.ChildId == childId).ToList();
            List<ParentModel> returnEvent = _mapper.Map<List<ParentModel>>(parentsChildren);
            return returnEvent;
        }

        public async Task<List<ChildModel>> GetAllChildrenForPerson(int parentId)
        {
            List<ParentChild> parentsChildren = unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).ToList();
            List<ChildModel> returnEvent = _mapper.Map<List<ChildModel>>(parentsChildren);
            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId)
        {
            ParentChild parentChild = await unitOfWork.ParentChild.FindById(parentChildId);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChild);
            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild)
        {
            if (parentChild == null)
            {
                return null;
            }
            ParentChild parentChildEntity = _mapper.Map<ParentChild>(parentChild);
            parentChildEntity = await unitOfWork.ParentChild.Create(parentChildEntity);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChildEntity);
            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> UpdateParentChildAsync(ParentChildCreateUpdateModel parentChild)
        {
            if (parentChild == null)
            {
                return null;
            }
            ParentChild parentChildEntity = _mapper.Map<ParentChild>(parentChild);
            parentChildEntity = await unitOfWork.ParentChild.Update(parentChildEntity);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChildEntity);
            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId)
        {
            ParentChild educationEntity = await unitOfWork.ParentChild.Delete(parentChildId);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(educationEntity);
            return returnEvent;
        }
    }
}
