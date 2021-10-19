using GenealogyTree.Domain.DTO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IOccupationService
    {
        List<OccupationModel> GetAllOccupationsForPerson(int personId);
        Task<OccupationModel> GetOccupationAsync(int occupationId);
        Task<OccupationModel> AddOccupationAsync(OccupationModel occupation);
        Task<OccupationModel> UpdateOccupationAsync(OccupationModel occupation);
        Task<OccupationModel> DeleteOccupationAsync(int occupationId);
    }
}
