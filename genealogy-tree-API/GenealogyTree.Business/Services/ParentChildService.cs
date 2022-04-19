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
        private readonly IMarriageService _marriageService;
        public ParentChildService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService, IMarriageService marriageService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
            _marriageService = marriageService;
        }

        public async Task<List<ParentChildModel>> GetAllParentsForPerson(int childId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ChildId == childId).Include(pc => pc.Parent).ToList();
            List<ParentModel> parentRelatives = _mapper.Map<List<ParentModel>>(parentChildren);
            List<ParentChildModel> parents = _mapper.Map<List<ParentChildModel>>(parentRelatives);
            return parents;
        }

        public async Task<List<ParentChildModel>> GetAllChildrenForPerson(int parentId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).Include(pc => pc.Child).ToList();
            List<ChildModel> childRelatives = _mapper.Map<List<ChildModel>>(parentChildren);
            List<ParentChildModel> children = _mapper.Map<List<ParentChildModel>>(childRelatives);
            return children;
        }

        public async Task<List<ParentChildModel>> GetAllAncestors(int personId)
        {
            List<ParentChildModel> foundParents = await GetAllParentsForPerson(personId);
            List<ParentChildModel> ancestors = new List<ParentChildModel>();
            while (foundParents.Any())
            {
                ancestors.AddRange(foundParents);
                List<ParentChildModel> searchParents = new List<ParentChildModel>();
                searchParents.AddRange(foundParents);
                foundParents.Clear();
                foreach (ParentChildModel parent in searchParents)
                {
                    foundParents.AddRange(await GetAllParentsForPerson(parent.PersonId));
                }
            }
            return ancestors;
        }

        public async Task<List<ParentChildModel>> GetAllDescendants(int personId)
        {
            List<ParentChildModel> foundChildren = await GetAllChildrenForPerson(personId);
            List<ParentChildModel> descendants = new List<ParentChildModel>();
            while (foundChildren.Any())
            {
                descendants.AddRange(foundChildren);
                List<ParentChildModel> searchChildren = new List<ParentChildModel>();
                searchChildren.AddRange(foundChildren);
                foundChildren.Clear();
                foreach (ParentChildModel child in searchChildren)
                {
                    foundChildren.AddRange(await GetAllChildrenForPerson(child.PersonId));
                }
            }
            return descendants;
        }

        public async Task<List<ParentChildModel>> GetAllRelatedPeople(int personId)
        {
            List<ParentChildModel> foundRelatives = new List<ParentChildModel>();
            foundRelatives.AddRange(await GetAllParentsForPerson(personId));
            foundRelatives.AddRange(await GetAllChildrenForPerson(personId));
            List<ParentChildModel> relatedPeople = new List<ParentChildModel>();
            while (foundRelatives.Any())
            {
                relatedPeople.AddRange(foundRelatives);
                List<ParentChildModel> searchRelatives = new List<ParentChildModel>();
                searchRelatives.AddRange(foundRelatives);
                foundRelatives.Clear();
                foreach (ParentChildModel relative in searchRelatives)
                {
                    foundRelatives.AddRange(await GetAllParentsForPerson(relative.PersonId));
                    foundRelatives.AddRange(await GetAllChildrenForPerson(relative.PersonId));
                }
                foundRelatives = foundRelatives.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
                foundRelatives.RemoveAll(relative => relatedPeople.Exists(person => person.PersonId == relative.PersonId));
            }
            return relatedPeople;
        }

        public async Task<List<ParentChildModel>> GetRelatedByAncestors(int personId)
        {
            List<ParentChildModel> allAncestors = await GetAllAncestors(personId);
            List<ParentChildModel> relatedByAncestors = new List<ParentChildModel>();
            relatedByAncestors.AddRange(allAncestors);
            foreach (var ancestor in allAncestors)
            {
                relatedByAncestors.AddRange(await GetAllDescendants(ancestor.PersonId));
            }
            relatedByAncestors.AddRange(await GetAllDescendants(personId));
            relatedByAncestors = relatedByAncestors.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
            return relatedByAncestors;
        }

        public async Task<List<ParentChildModel>> GetRelatedByDescendants(int personId)
        {
            List<ParentChildModel> allDescendants = await GetAllDescendants(personId);
            List<ParentChildModel> relatedByDescendants = new List<ParentChildModel>();
            relatedByDescendants.AddRange(allDescendants);
            foreach (var descendant in allDescendants)
            {
                relatedByDescendants.AddRange(await GetAllAncestors(descendant.PersonId));
            }
            relatedByDescendants.AddRange(await GetAllAncestors(personId));
            relatedByDescendants = relatedByDescendants.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
            return relatedByDescendants;
        }

        public async Task<List<GenericPersonModel>> GetChildrenOptions(int personId)
        {
            List<GenericPersonModel> notRelatedByDescendants = await GetNotRelatedByDescendants(personId);
            List<int> peopleWithoutParent = await GetPeopleWithoutParent(personId);
            List<int> spouces = (await _marriageService.GetAllMarriagesForPerson(personId)).Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList();
            return notRelatedByDescendants.Where((person) => 
                                        peopleWithoutParent.Exists((personId) => person.PersonId == personId) && 
                                        !spouces.Exists((spouceId) => person.PersonId == spouceId)).ToList();
        }

        public async Task<List<GenericPersonModel>> GetParentSpouceOptions(int personId)
        {
            List<GenericPersonModel> notRelatedByAncestors = await GetNotRelatedByAncestors(personId);
            List<int> spouces = (await _marriageService.GetAllMarriagesForPerson(personId)).Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList();
            return notRelatedByAncestors.Where((person) => !spouces.Exists((spouceId) => person.PersonId == spouceId)).ToList();
        }

        public async Task<List<GenericPersonModel>> GetUnrelatedPeople(int personId)
        {
            List<int> relatedPeopleIds = (await GetAllRelatedPeople(personId)).Select((relative) => relative.PersonId).ToList();
            List<int> marriedPeopleIds = (await _marriageService.GetAllMarriagesForPerson(personId)).Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList();
            foreach (var marriedPersonId in marriedPeopleIds)
            {
                List<int> relatedToMarriedPersonIds = (await GetAllRelatedPeople(marriedPersonId)).Select((person) => person.PersonId).ToList();
                relatedPeopleIds.AddRange(relatedToMarriedPersonIds);
            }
            relatedPeopleIds.AddRange(marriedPeopleIds);
            return await GetExcludedPeople(relatedPeopleIds, personId);
        }

        public async Task<List<GenericPersonModel>> GetNotRelatedByAncestors(int personId)
        {
            List<int> bloodRelatedPeopleIds = (await GetRelatedByAncestors(personId)).Select((bloodRelatedPerson) => bloodRelatedPerson.PersonId).ToList();
            return await GetExcludedPeople(bloodRelatedPeopleIds, personId);
        }

        public async Task<List<GenericPersonModel>> GetNotRelatedByDescendants(int personId)
        {
            List<int> relatedByDescendantsIds = (await GetRelatedByDescendants(personId)).Select((relatedPerson) => relatedPerson.PersonId).ToList();
            return await GetExcludedPeople(relatedByDescendantsIds, personId);
        }

        private async Task<List<int>> GetPeopleWithoutParent(int personId)
        {
            Person personToCheck = await unitOfWork.Person.FindById(personId);
            List<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == personToCheck.TreeId).ToList();
            List<int> childrenWithoutParent = unitOfWork.Person.Filter((person) => !person.Parents.Any((parent) => parent.Parent.Gender == personToCheck.Gender)).Include(p => p.Parents).Select((person) => person.Id).ToList();
            return childrenWithoutParent;
        }

        private async Task<List<GenericPersonModel>> GetExcludedPeople(List<int> includedPeopleIds, int personId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            List<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person.TreeId).ToList();
            List<Person> excludedPeople = peopleInTree.Where(person => !includedPeopleIds.Exists(includedPersonId => includedPersonId == person.Id)).ToList();
            excludedPeople.RemoveAll(relative => person.Id == relative.Id);
            return await MapToGenericPersonModel(excludedPeople);
        }

        private async Task<List<GenericPersonModel>> MapToGenericPersonModel(List<Person> people)
        {
            List<GenericPersonModel> returnEvent = new List<GenericPersonModel>();
            foreach (var person in people)
            {
                GenericPersonModel returnPerson = _mapper.Map<GenericPersonModel>(person);
                returnPerson.ImageFile = await _fileManagementService.GetFile(person.Image);
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
