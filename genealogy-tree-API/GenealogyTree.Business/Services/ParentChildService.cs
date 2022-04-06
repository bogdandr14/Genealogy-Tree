using AutoMapper;
using GenealogyTree.Domain.DTO.Marriage;
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

        public async Task<List<RelativeModel>> GetAllParentsForPerson(int childId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ChildId == childId).Include(pc => pc.Parent).ToList();
            List<ParentModel> parentRelatives = _mapper.Map<List<ParentModel>>(parentChildren);
            List<RelativeModel> parents = _mapper.Map<List<RelativeModel>>(parentRelatives);
            return parents;
        }

        public async Task<List<RelativeModel>> GetAllChildrenForPerson(int parentId)
        {
            List<ParentChild> parentChildren = unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).Include(pc => pc.Child).ToList();
            List<ChildModel> childRelatives = _mapper.Map<List<ChildModel>>(parentChildren);
            List<RelativeModel> children = _mapper.Map<List<RelativeModel>>(childRelatives);
            return children;
        }

        public async Task<List<RelativeModel>> GetAllAncestors(int personId)
        {
            List<RelativeModel> foundParents = await GetAllParentsForPerson(personId);
            List<RelativeModel> ancestors = new List<RelativeModel>();
            while (foundParents.Any())
            {
                ancestors.AddRange(foundParents);
                List<RelativeModel> searchParents = new List<RelativeModel>();
                searchParents.AddRange(foundParents);
                foundParents.Clear();
                foreach (RelativeModel parent in searchParents)
                {
                    foundParents.AddRange(await GetAllParentsForPerson(parent.PersonId));
                }
            }
            return ancestors;
        }

        public async Task<List<RelativeModel>> GetAllDescendants(int personId)
        {
            List<RelativeModel> foundChildren = await GetAllChildrenForPerson(personId);
            List<RelativeModel> descendants = new List<RelativeModel>();
            while (foundChildren.Any())
            {
                descendants.AddRange(foundChildren);
                List<RelativeModel> searchChildren = new List<RelativeModel>();
                searchChildren.AddRange(foundChildren);
                foundChildren.Clear();
                foreach (RelativeModel child in searchChildren)
                {
                    foundChildren.AddRange(await GetAllChildrenForPerson(child.PersonId));
                }
            }
            return descendants;
        }

        public async Task<List<RelativeModel>> GetAllRelatedPeople(int personId)
        {
            List<RelativeModel> foundRelatives = new List<RelativeModel>();
            foundRelatives.AddRange(await GetAllParentsForPerson(personId));
            foundRelatives.AddRange(await GetAllChildrenForPerson(personId));
            List<RelativeModel> relatedPeople = new List<RelativeModel>();
            while (foundRelatives.Any())
            {
                relatedPeople.AddRange(foundRelatives);
                List<RelativeModel> searchRelatives = new List<RelativeModel>();
                searchRelatives.AddRange(foundRelatives);
                foundRelatives.Clear();
                foreach (RelativeModel relative in searchRelatives)
                {
                    foundRelatives.AddRange(await GetAllParentsForPerson(relative.PersonId));
                    foundRelatives.AddRange(await GetAllChildrenForPerson(relative.PersonId));
                }
                foundRelatives = foundRelatives.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
                foundRelatives.RemoveAll(relative => relatedPeople.Exists(person => person.PersonId == relative.PersonId));
            }
            return relatedPeople;
        }

        public async Task<List<RelativeModel>> GetRelatedByAncestors(int personId)
        {
            List<RelativeModel> allAncestors = await GetAllAncestors(personId);
            List<RelativeModel> relatedByAncestors = new List<RelativeModel>();
            relatedByAncestors.AddRange(allAncestors);
            foreach (var ancestor in allAncestors)
            {
                relatedByAncestors.AddRange(await GetAllDescendants(ancestor.PersonId));
            }
            relatedByAncestors = relatedByAncestors.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
            return relatedByAncestors;
        }

        public async Task<List<RelativeModel>> GetRelatedByDescendants(int personId)
        {
            List<RelativeModel> allDescendants = await GetAllDescendants(personId);
            List<RelativeModel> relatedByDescendants = new List<RelativeModel>();
            relatedByDescendants.AddRange(allDescendants);
            foreach (var descendant in allDescendants)
            {
                relatedByDescendants.AddRange(await GetAllAncestors(descendant.PersonId));
            }
            relatedByDescendants = relatedByDescendants.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
            return relatedByDescendants;
        }

        public async Task<List<GenericPersonModel>> GetChildrenOptions(int personId)
        {
            List<RelativeModel> bloodRelatedPeople = await GetRelatedByAncestors(personId);
            List<int> notBloodRelatedRelatives = new List<int>();
            foreach (var person in bloodRelatedPeople)
            {
                List<MarriedPersonModel> personMarriages = await _marriageService.GetAllMarriagesForPerson(person.PersonId);
                notBloodRelatedRelatives.AddRange(personMarriages.Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList());
                if (person.PersonId != personId)
                {
                    foreach(var marriage in personMarriages)
                    {
                        List<RelativeModel> bloodRelatedToMarriage = await GetRelatedByAncestors(marriage.PersonMarriedTo.PersonId);
                        notBloodRelatedRelatives.AddRange(bloodRelatedToMarriage.Select((person) => person.PersonId).ToList());
                    }
                }
            }
            List<MarriedPersonModel> personMarriages1 = await _marriageService.GetAllMarriagesForPerson(personId);
            notBloodRelatedRelatives.AddRange(personMarriages1.Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList());
            notBloodRelatedRelatives = notBloodRelatedRelatives.GroupBy(x => x).Select(x => x.First()).ToList();
            Person person1 = await unitOfWork.Person.FindById(personId);
            List<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person1.TreeId).ToList();
            List<Person> childrenOptions = peopleInTree.Where(x => !bloodRelatedPeople.Exists(y => y.PersonId == x.Id) && !notBloodRelatedRelatives.Exists(z=> z== x.Id)).ToList();
            return await MapToGenericPersonModel(childrenOptions);
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
            List<int> relatedByDescendantsIds = (await GetRelatedByDescendants(personId)).Select((relatedPerson)=> relatedPerson.PersonId).ToList();
            return await GetExcludedPeople(relatedByDescendantsIds, personId);
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
