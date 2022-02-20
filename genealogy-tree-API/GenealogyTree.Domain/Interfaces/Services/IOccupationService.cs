using GenealogyTree.Domain.DTO;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IOccupationService
    {
        List<OccupationModel> GetAllOccupationsForUser(Guid userId);
        Task<OccupationModel> GetOccupationAsync(int occupationId);
        Task<OccupationModel> AddOccupationAsync(OccupationModel occupation);
        Task<OccupationModel> UpdateOccupationAsync(OccupationModel occupation);
        Task<OccupationModel> DeleteOccupationAsync(int occupationId);
    }
}
