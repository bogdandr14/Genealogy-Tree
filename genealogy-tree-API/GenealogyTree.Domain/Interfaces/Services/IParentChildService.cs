using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IParentChildService
    {
        Task<List<ParentChildModel>> GetAllParentsForPerson(int childId);
        Task<List<ParentChildModel>> GetAllChildrenForPerson(int parentId);
        Task<List<ParentChildModel>> GetAllAncestors(int personId);
        Task<List<ParentChildModel>> GetAllDescendants(int personId);
        Task<List<ParentChildModel>> GetAllRelatedPeople(int personId);
        Task<List<ParentChildModel>> GetRelatedByAncestors(int personId);
        Task<List<ParentChildModel>> GetRelatedByDescendants(int personId);
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
