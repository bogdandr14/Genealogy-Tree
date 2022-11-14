using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.DTO.Generic;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IEducationService
    {

        /// <summary>
        /// Retrieves all educations a user currently has.
        /// </summary>
        /// <param name="userId"> The Guid of the user for which the educations should be returned.</param>
        /// <returns>
        /// Returns a list of <see cref="EducationModel"/> object, which represents the educations of the requested user.
        /// </returns>
        List<EducationModel> GetAllEducationsForUser(Guid userId);

        /// <summary>
        /// Retrieves a specific education.
        /// </summary>
        /// <param name="educationId"> The Id of the education that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="EducationModel"/> object for the requested education Id.
        /// </returns>
        Task<EducationModel> GetEducationAsync(int educationId);

        /// <summary>
        /// Adds an education for the authenticated user.
        /// </summary>
        /// <param name="education"> Is the <see cref="EducationModel"/> object which contains all the information 
        /// for the education that should be created.</param>
        /// <returns>
        /// Returns the <see cref="EducationModel"/> object for the created education.
        /// </returns>
        Task<EducationModel> AddEducationAsync(EducationModel education);

        /// <summary>
        /// Updates an existing education for the authenticated user.
        /// </summary>
        /// <param name="education"> Is the <see cref="EducationModel"/> object which contains the information 
        /// for the education that should be updated.</param>
        /// <returns>
        /// Returns the <see cref="EducationModel"/> object for the updated education.
        /// </returns>
        Task<EducationModel> UpdateEducationAsync(EducationModel education);

        /// <summary>
        /// Deletes an existing education for the authenticated user.
        /// </summary>
        /// <param name="educationId"> The Id for the education that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="EducationModel"/> object that was removed.
        /// </returns>
        Task<EducationModel> DeleteEducationAsync(int educationId);

        /// <summary>
        /// Retrieves all education levels that can be used when creating an education or visualising it.
        /// </summary>
        /// <returns>
        /// Returns a list of <see cref="GenericNameModel"/> object, which contains the Id and Name of 
        /// the education levels.
        /// </returns>
        Task<List<GenericNameModel>> GetAllEducationLevelsAsync();

        /// <summary>
        /// Adds an education level that can be used by any user.
        /// This action should be executed only by an Admin.
        /// </summary>
        /// <param name="educationLevelName"> The name of the new education level which must be created.</param>
        /// <returns>
        /// Returns a <see cref="GenericNameModel"/> object, which contains the Id and Name of the new 
        /// education level.
        /// </returns>
        Task<GenericNameModel> AddEducationLevelAsync(string educationLevelName);
    }
}
