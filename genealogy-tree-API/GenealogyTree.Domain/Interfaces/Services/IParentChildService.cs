using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IParentChildService
    {
        Task<List<RelativeModel>> GetAllParentsForPerson(int childId);
        Task<List<RelativeModel>> GetAllChildrenForPerson(int parentId);
        Task<List<RelativeModel>> GetAllAncestors(int personId);
        Task<List<RelativeModel>> GetAllDescendants(int personId);
        Task<List<RelativeModel>> GetAllRelatedPeople(int personId);
        Task<List<RelativeModel>> GetRelatedByAncestors(int personId);
        Task<List<RelativeModel>> GetRelatedByDescendants(int personId);
        Task<List<GenericPersonModel>> GetChildrenOptions(int personId);
        Task<List<GenericPersonModel>> GetParentSpouceOptions(int personId);
        Task<List<GenericPersonModel>> GetUnrelatedPeople(int personId);
        Task<List<GenericPersonModel>> GetNotRelatedByAncestors(int personId);
        Task<List<GenericPersonModel>> GetNotRelatedByDescendants(int personId);
        Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId);
        Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild);
        Task<ParentChildDetailsModel> UpdateParentChildAsync(ParentChildCreateUpdateModel parentChild);
        Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId);
    }
}
