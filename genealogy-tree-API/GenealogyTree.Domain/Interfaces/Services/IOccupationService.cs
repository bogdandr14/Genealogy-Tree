using GenealogyTree.Domain.DTO;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IOccupationService
    {

        /// <summary>
        /// Retrieves all occupations a user currently has.
        /// </summary>
        /// <param name="userId"> The Guid of the user for which the occupations should be returned.</param>
        /// <returns>
        /// Returns a list of <see cref="OccupationModel"/> object, which represents the occupation 
        /// of the requested user.
        /// </returns>
        List<OccupationModel> GetAllOccupationsForUser(Guid userId);

        /// <summary>
        /// Adds an occupation for the authenticated user.
        /// </summary>
        /// <param name="occupation"> Is the <see cref="OccupationModel"/> object which contains all
        /// the information for the occupation that should be created.</param>
        /// <returns>
        /// Returns the <see cref="OccupationModel"/> object for the created occupation.
        /// </returns>
        Task<OccupationModel> AddOccupationAsync(OccupationModel occupation);

        /// <summary>
        /// Updates an existing occupation for the authenticated user.
        /// </summary>
        /// <param name="occupation"> Is the <see cref="OccupationModel"/> object which contains the 
        /// information for the occupation that should be updated.</param>
        /// <returns>
        /// Returns the <see cref="OccupationModel"/> object for the updated occupation.
        /// </returns>
        Task<OccupationModel> UpdateOccupationAsync(OccupationModel occupation);

        /// <summary>
        /// Deletes an existing occupation for the authenticated user.
        /// </summary>
        /// <param name="occupationId"> The Id for the occupation that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="OccupationModel"/> object that was removed.
        /// </returns>
        Task<OccupationModel> DeleteOccupationAsync(int occupationId);
    }
}
