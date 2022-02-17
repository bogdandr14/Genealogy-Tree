using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
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

        public async Task<List<ParentModel>> GetAllAncestors(int personId)
        {
            List<ParentModel> foundParents = await GetAllParentsForPerson(personId);
            List<ParentModel> returnEvent = new List<ParentModel>();
            while (foundParents.Any())
            {
                returnEvent.AddRange(foundParents);
                List<ParentModel> searchParents = foundParents;
                foundParents.Clear();
                foreach (ParentModel parent in searchParents)
                {
                    foundParents.AddRange(await GetAllParentsForPerson(parent.Parent.PersonId));
                }
            }
            return returnEvent;
        }

        public async Task<List<ChildModel>> GetAllDescendants(int personId)
        {
            List<ChildModel> foundChildren = await GetAllChildrenForPerson(personId);
            List<ChildModel> returnEvent = new List<ChildModel>();
            while (foundChildren.Any())
            {
                returnEvent.AddRange(foundChildren);
                List<ChildModel> searchChildren = foundChildren;
                foundChildren.Clear();
                foreach (ChildModel child in searchChildren)
                {
                    foundChildren.AddRange(await GetAllChildrenForPerson(child.Child.PersonId));
                }
            }
            return returnEvent;
        }

        public async Task<List<BasePersonModel>> GetUnrelatedPeople(int personId)
        {
            List<ParentModel> ancestors = await GetAllAncestors(personId);
            List<ChildModel> descendants = await GetAllDescendants(personId);
            Person person = await unitOfWork.Person.FindById(personId);
            IQueryable<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person.TreeId);
            List<Person> people = peopleInTree.Where(x => !ancestors.Exists(y => y.Parent.PersonId == x.Id) && !descendants.Exists(y => y.Child.PersonId == x.Id)).ToList();
            List<BasePersonModel> returnEvent = _mapper.Map<List<BasePersonModel>>(people);
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

        public async Task<ParentChildDetailsModel> UpdateParentChildAsync(int parentChildId, ParentChildCreateUpdateModel parentChild)
        {
            if ((await unitOfWork.ParentChild.FindById(parentChildId)) == null)
            {
                return null;
            }
            ParentChild parentChildEntity = _mapper.Map<ParentChild>(parentChild);
            parentChildEntity.Id = parentChildId;
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
