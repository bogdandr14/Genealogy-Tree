using GenealogyTree.Domain.DTO.Relative;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IParentChildService
    {
        Task<List<ParentModel>> GetAllParentsForPerson(int childId);
        Task<List<ChildModel>> GetAllChildrenForPerson(int parentId);

        Task<ParentChildDetailsModel> GetParentChildAsync(int parentChildId);
        Task<ParentChildDetailsModel> AddParentChildAsync(ParentChildCreateUpdateModel parentChild);
        Task<ParentChildDetailsModel> UpdateParentChildAsync(ParentChildCreateUpdateModel parentChild);
       
        Task<ParentChildDetailsModel> DeleteParentChildAsync(int parentChildId);
    }
}
