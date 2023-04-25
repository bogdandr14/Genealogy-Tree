using AutoMapper;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Marriage;
using GenealogyTree.Domain.DTO.ParentChild;
using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using GenealogyTree.Domain.Interfaces.Services;
using Microsoft.EntityFrameworkCore;
using System;
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
        private readonly IImageService _imageService;
        private readonly ICachingService _cachingService;

        private readonly string _personParentsKey = "person_parents_{0}";
        private readonly string _personChildrenKey = "person_children_{0}";
/*        private readonly string _personAllRelatedKey = "person_all_related_{0}";
        private readonly string _personChildrenOptionsKey = "person_children_options_{0}";
        private readonly string _personSpouceOptionsKey = "person_spouce_options_{0}";*/
        private readonly string _personTreeKey = "person_tree_key_{0}";
        private readonly string _parentChildKey = "parent_child_key_{0}";

        public ParentChildService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService, IMarriageService marriageService, IImageService imageService, ICachingService cachingService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
            _marriageService = marriageService;
            _imageService = imageService;
            _cachingService = cachingService;
        }

        public async Task<List<ParentChildModel>> GetAllParentsForPerson(int childId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_personParentsKey, childId)))
            {
                return _cachingService.GetObject<List<ParentChildModel>>(CacheKey(_personParentsKey, childId));
            }

            List<ParentChild> parentChildren = await Task.Run(() => unitOfWork.ParentChild.Filter(x => x.ChildId == childId).Include(pc => pc.Parent).ToList());
            List<ParentModel> parentRelatives = _mapper.Map<List<ParentModel>>(parentChildren);
            List<ParentChildModel> parents = _mapper.Map<List<ParentChildModel>>(parentRelatives);
            _cachingService.SetObject(CacheKey(_personParentsKey, childId), parents);

            return parents;
        }

        public async Task<List<ParentChildModel>> GetAllChildrenForPerson(int parentId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_personChildrenKey, parentId)))
            {
                return _cachingService.GetObject<List<ParentChildModel>>(CacheKey(_personChildrenKey, parentId));
            }

            List<ParentChild> parentChildren = await Task.Run(() => unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).Include(pc => pc.Child).ToList());
            List<ChildModel> childRelatives = _mapper.Map<List<ChildModel>>(parentChildren);
            List<ParentChildModel> children = _mapper.Map<List<ParentChildModel>>(childRelatives);
            _cachingService.SetObject(CacheKey(_personChildrenKey, parentId), children);

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
            //if (_cachingService.IsObjectCached(CacheKey(_personAllRelatedKey, personId)))
            //{
            //    return _cachingService.GetObject<List<ParentChildModel>>(CacheKey(_personAllRelatedKey, personId));
            //}

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

                foreach (int relativeId in searchRelatives.Select(relative => relative.PersonId))
                {
                    foundRelatives.AddRange(await GetAllParentsForPerson(relativeId));
                    foundRelatives.AddRange(await GetAllChildrenForPerson(relativeId));
                }

                foundRelatives = foundRelatives.GroupBy(relative => relative.PersonId).Select(relative => relative.First()).ToList();
                foundRelatives.RemoveAll(relative => relatedPeople.Exists(person => person.PersonId == relative.PersonId));
            }
            //_cachingService.SetObject(CacheKey(_personAllRelatedKey, personId), relatedPeople);

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
            //if (_cachingService.IsObjectCached(CacheKey(_personChildrenOptionsKey, personId)))
            //{
            //    return _cachingService.GetObject<List<GenericPersonModel>>(CacheKey(_personChildrenOptionsKey, personId));
            //}

            List<GenericPersonModel> notRelatedByDescendants = await GetNotRelatedByDescendants(personId);
            List<GenericPersonModel> notRelatedByAncestors = await GetNotRelatedByAncestors(personId);
            List<GenericPersonModel> notRelated = notRelatedByDescendants.Where(notRelated => notRelatedByAncestors.Any(x => x.PersonId == notRelated.PersonId)).ToList();

            List<int> peopleWithoutParent = await GetPeopleWithoutParent(personId);
            List<int> spouces = (await _marriageService.GetAllMarriagesForPerson(personId)).Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList();

            List<GenericPersonModel> returnEvent = notRelated.Where((person) =>
                                        peopleWithoutParent.Exists((personId) => person.PersonId == personId) &&
                                        !spouces.Exists((spouceId) => person.PersonId == spouceId)).ToList();
            //_cachingService.SetObject(CacheKey(_personChildrenOptionsKey, personId), returnEvent);

            return await AddImagesGenericPersonModel(returnEvent);
        }

        public async Task<List<GenericPersonModel>> GetParentSpouceOptions(int personId)
        {
            //if (_cachingService.IsObjectCached(CacheKey(_personSpouceOptionsKey, personId)))
            //{
            //    return _cachingService.GetObject<List<GenericPersonModel>>(CacheKey(_personSpouceOptionsKey, personId));
            //}
            List<GenericPersonModel> notRelatedByAncestors = await GetNotRelatedByAncestors(personId);
            List<int> spouces = (await _marriageService.GetAllMarriagesForPerson(personId)).Where(marriage => marriage.MarriageEnded == null)
                                    .Select((marriage) => marriage.PersonMarriedTo.PersonId).ToList();

            List<GenericPersonModel> returnEvent = notRelatedByAncestors.Where((person) => !spouces.Exists((spouceId) => person.PersonId == spouceId)).ToList();
            //_cachingService.SetObject(CacheKey(_personSpouceOptionsKey, personId), returnEvent);

            return await AddImagesGenericPersonModel(returnEvent);
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
            List<int> childrenWithoutParent = unitOfWork.Person.Filter((person) => !person.Parents.Any((parent) => parent.Parent.Gender == personToCheck.Gender)).Include(p => p.Parents).Select((person) => person.Id).ToList();

            return childrenWithoutParent;
        }

        private async Task<List<GenericPersonModel>> GetExcludedPeople(List<int> includedPeopleIds, int personId)
        {
            Person person = await unitOfWork.Person.FindById(personId);
            List<GenericPersonModel> peopleInTreeConverted;

            if (_cachingService.IsObjectCached(CacheKey(_personTreeKey, person.TreeId)))
            {
                peopleInTreeConverted = _cachingService.GetObject<List<GenericPersonModel>>(CacheKey(_personTreeKey, person.TreeId));
            }
            else
            {
                List<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person.TreeId).ToList();
                peopleInTreeConverted = _mapper.Map<List<GenericPersonModel>>(peopleInTree);
                _cachingService.SetObject(CacheKey(_personTreeKey, person.TreeId), peopleInTreeConverted);
            }

            List<GenericPersonModel> excludedPeople = peopleInTreeConverted.Where(person => !includedPeopleIds.Exists(includedPersonId => includedPersonId == person.PersonId)).ToList();
            excludedPeople.RemoveAll(relative => person.Id == relative.PersonId);

            return excludedPeople;
        }

        private async Task<List<GenericPersonModel>> AddImagesGenericPersonModel(List<GenericPersonModel> people)
        {
            List<GenericPersonModel> returnEvent = new List<GenericPersonModel>();

            foreach (var person in people)
            {
                person.ImageFile = await _fileManagementService.GetFile(await _imageService.GetImageAsync(person.ImageId));
                returnEvent.Add(person);
            }

            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId)
        {
            if (_cachingService.IsObjectCached(CacheKey(_parentChildKey, parentChildId)))
            {
                return _cachingService.GetObject<ParentChildDetailsModel>(CacheKey(_parentChildKey, parentChildId));
            }

            ParentChild parentChild = await unitOfWork.ParentChild.FindById(parentChildId);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChild);
            _cachingService.SetObject(CacheKey(_parentChildKey, parentChildId), returnEvent);

            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild)
        {
            if (parentChild == null)
            {
                return null;
            }

            ParentChild parentChildEntity = _mapper.Map<ParentChild>(parentChild);
            parentChildEntity.CreatedOn = DateTime.UtcNow;
            parentChildEntity = await unitOfWork.ParentChild.Create(parentChildEntity);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChildEntity);
            _cachingService.Remove(CacheKey(_personParentsKey,parentChild.ChildId));
            _cachingService.Remove(CacheKey(_personChildrenKey, parentChild.ParentId));
            _cachingService.SetObject(CacheKey(_parentChildKey, parentChildEntity.Id), returnEvent);

            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> UpdateParentChildAsync(ParentChildCreateUpdateModel parentChild)
        {
            if (parentChild == null)
            {
                return null;
            }

            ParentChild parentChildInDb = await unitOfWork.ParentChild.FindById(parentChild.RelativeId);

            if (parentChildInDb == null)
            {
                return null;
            }

            parentChildInDb.ChildId = parentChild.ChildId;
            parentChildInDb.ParentId = parentChild.ParentId;
            parentChildInDb.BloodRelatives = parentChild.BloodRelatives;
            parentChildInDb.ModifiedOn = DateTime.UtcNow;

            ParentChild parentChildEntity = await unitOfWork.ParentChild.Update(parentChildInDb);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChildEntity);
            _cachingService.Remove(CacheKey(_personParentsKey, parentChild.ChildId));
            _cachingService.Remove(CacheKey(_personChildrenKey, parentChild.ParentId));
            _cachingService.SetObject(CacheKey(_parentChildKey, parentChildEntity.Id), returnEvent);

            return returnEvent;
        }

        public async Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId)
        {
            ParentChild parentChildEntity = await unitOfWork.ParentChild.Delete(parentChildId);
            ParentChildDetailsModel returnEvent = _mapper.Map<ParentChildDetailsModel>(parentChildEntity);
            _cachingService.Remove(CacheKey(_personParentsKey, parentChildEntity.ChildId));
            _cachingService.Remove(CacheKey(_personChildrenKey, parentChildEntity.ParentId));
            _cachingService.Remove(CacheKey(_parentChildKey, parentChildEntity.Id));

            return returnEvent;
        }
    }
}
