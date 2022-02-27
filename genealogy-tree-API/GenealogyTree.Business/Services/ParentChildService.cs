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
        private readonly IFileManagementService _fileManagementService;
        public ParentChildService(IUnitOfWork unitOfWork, IMapper mapper, IFileManagementService fileManagementService) : base(unitOfWork)
        {
            _mapper = mapper;
            _fileManagementService = fileManagementService;
        }

        public async Task<List<RelativeModel>> GetAllParentsForPerson(int childId)
        {
            List<RelativeModel> parentRelatives = unitOfWork.ParentChild.Filter(x => x.ChildId == childId).Select(parentChild => convertParentToRelative(parentChild)).ToList();

            return parentRelatives;
        }

        private RelativeModel convertParentToRelative(ParentChild parentChild)
        {
            return new RelativeModel
            {
                BirthDate = parentChild.Parent.BirthDate,
                DeathDate = parentChild.Parent.DeathDate,
                FirstName = parentChild.Parent.FirstName,
                LastName = parentChild.Parent.LastName,
                PersonId = parentChild.Parent.Id,
                TreeId = parentChild.Parent.TreeId,
                UserId = parentChild.Parent.SyncedUserToPerson.SyncedUserId,
                ImageId = parentChild.Parent.ImageId,
                RelativeId = parentChild.Id,
                isBloodRelative = parentChild.BloodRelatives,
            };
        }

        public async Task<List<RelativeModel>> GetAllChildrenForPerson(int parentId)
        {
            List<RelativeModel> childrenRelatives = unitOfWork.ParentChild.Filter(x => x.ParentId == parentId).Select(parentChild => convertChildToRelative(parentChild)).ToList();
            return childrenRelatives;
        }

        private RelativeModel convertChildToRelative(ParentChild parentChild)
        {
            return new RelativeModel
            {
                BirthDate = parentChild.Child.BirthDate,
                DeathDate = parentChild.Child.DeathDate,
                FirstName = parentChild.Child.FirstName,
                LastName = parentChild.Child.LastName,
                PersonId = parentChild.Child.Id,
                TreeId = parentChild.Child.TreeId,
                UserId = parentChild.Child.SyncedUserToPerson.SyncedUserId,
                ImageId = parentChild.Child.ImageId,
                RelativeId = parentChild.Id,
                isBloodRelative = parentChild.BloodRelatives,
            };
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
            List<RelativeModel> relatedPeole = await GetRelatedPeople(personId);
            Person person = await unitOfWork.Person.FindById(personId);
            IQueryable<Person> peopleInTree = unitOfWork.Person.Filter(x => x.TreeId == person.TreeId);
            List<Person> people = peopleInTree.Where(x => !relatedPeole.Exists(y => y.PersonId == x.Id)).ToList();
            List<GenericPersonModel> returnEvent = _mapper.Map<List<GenericPersonModel>>(people);
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
