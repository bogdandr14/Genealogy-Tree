using GenealogyTree.Domain.DTO.Person;
using GenealogyTree.Domain.DTO.Relative;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IParentChildService
    {
        Task<List<ParentModel>> GetAllParentsForPerson(int childId);
        Task<List<ChildModel>> GetAllChildrenForPerson(int parentId);
        Task<List<ParentModel>> GetAllAncestors(int personId);
        Task<List<ChildModel>> GetAllDescendants(int personId);
        Task<List<BasePersonModel>> GetUnrelatedPeople(int personId);
        Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId);
        Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild);
        Task<ParentChildDetailsModel> UpdateParentChildAsync(int parentChildId, ParentChildCreateUpdateModel parentChild);
        Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId);
    }
}
