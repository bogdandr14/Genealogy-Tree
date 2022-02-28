using AutoMapper;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Services
{
    public class ParentChildService : BaseService, IParentChildService
    {
        private readonly IMapper _mapper;
        private readonly IFileManagementService _fileManagementService;
        public ParentChildService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<List<RelativeModel>> GetAllParentsForPerson(int childId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ChildId == childId).Include(pc => pc.Parent).ToList();
            List<ParentModel> parentRelatives = _mapper.Map<List<ParentModel>>(parentChildren);
            List<RelativeModel> relatives = _mapper.Map<List<RelativeModel>>(parentRelatives);
            return relatives;
        }

        public async Task<List<RelativeModel>> GetAllChildrenForPerson(int parentId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).Include(pc=> pc.Child).ToList();
            List<ChildModel> childRelatives = _mapper.Map<List<ChildModel>>(parentChildren);
            List<RelativeModel> relatives = _mapper.Map<List<RelativeModel>>(childRelatives);
            return relatives;
        }

        public async Task<List<RelativeModel>> GetAllAncestors(int personId)
        {
            List<RelativeModel> foundParents = await GetAllParentsForPerson(personId);
            List<RelativeModel> returnEvent = new List<RelativeModel>();
            while (foundParents.Any())
            {
                returnEvent.AddRange(foundParents);
                List<RelativeModel> searchParents = foundParents;
                foundParents.Clear();
                foreach (RelativeModel parent in searchParents)
                {
                    foundParents.AddRange(await GetAllParentsForPerson(parent.PersonId));
                }
            }
            return returnEvent;
        }

        public async Task<List<RelativeModel>> GetAllDescendants(int personId)
        {
            List<RelativeModel> foundChildren = await GetAllChildrenForPerson(personId);
            List<RelativeModel> returnEvent = new List<RelativeModel>();
            while (foundChildren.Any())
            {
                returnEvent.AddRange(foundChildren);
                List<RelativeModel> searchChildren = foundChildren;
                foundChildren.Clear();
                foreach (RelativeModel child in searchChildren)
                {
                    foundChildren.AddRange(await GetAllChildrenForPerson(child.PersonId));
                }
            }
            return returnEvent;
        }

        public async Task<List<RelativeModel>> GetRelatedPeople(int personId)
        {
            List<RelativeModel> foundRelatives = new List<RelativeModel>();
            foundRelatives.AddRange(await GetAllParentsForPerson(personId));
            foundRelatives.AddRange(await GetAllChildrenForPerson(personId));
            List<RelativeModel> relatives = new List<RelativeModel>();
            while (foundRelatives.Any())
            {
                relatives.AddRange(foundRelatives);
                List<RelativeModel> searchRelatives = foundRelatives;
                foundRelatives.Clear();
                foreach (RelativeModel relative in searchRelatives)
                {
                    foundRelatives.AddRange(await GetAllParentsForPerson(relative.PersonId));
                    foundRelatives.AddRange(await GetAllChildrenForPerson(relative.PersonId));
                }
                foundRelatives = foundRelatives.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
                foundRelatives.RemoveAll(relative => relatives.Exists(person => person.PersonId == relative.PersonId));
            }
            return relatives;
        }

        public async Task<List<GenericPersonModel>> GetUnrelatedPeople(int personId)
        {
            List<RelativeModel> relatedPeople = await GetRelatedPeople(personId);
            Person person = await unitOfWork.Person.FindById(personId);
            List<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person.TreeId).ToList();
            List<Person> unrelatedPeople = peopleInTree.Where(x => !relatedPeople.Exists(y => y.PersonId == x.Id)).ToList();
            unrelatedPeople.RemoveAll(relative => person.Id == relative.Id);
            List<GenericPersonModel> returnEvent = new List<GenericPersonModel>();
            foreach (var unrelatedPerson in unrelatedPeople)
            {
                GenericPersonModel returnPerson = _mapper.Map<GenericPersonModel>(unrelatedPerson);
                returnPerson.ImageFile = await _fileManagementService.GetFile(unrelatedPerson.Image);
                returnEvent.Add(returnPerson);
            }
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
