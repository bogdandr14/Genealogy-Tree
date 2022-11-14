using GenealogyTree.Domain.DTO.Marriage;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IMarriageService
    {
        /// <summary>
        /// Retrieves all marriages for a specific person.
        /// </summary>
        /// <param name="personId"> The Id of the person for which all marriages should
        /// be returned.</param>
        /// <returns>
        /// Returns a list of <see cref="MarriedPersonModel"/> object, which contains information
        /// about the marriages of the person.
        /// </returns>
        Task<List<MarriedPersonModel>> GetAllMarriagesForPerson(int personId);

        /// <summary>
        /// Retrieves a specific marriage.
        /// </summary>
        /// <param name="marriageId"> The Id of the marriage that should be retrieved.</param>
        /// <returns>
        /// Returns an <see cref="MarriageDetailsModel"/> object for the requested marriage Id.
        /// </returns>
        Task<MarriageDetailsModel> GetMarriageAsync(int marriageId);

        /// <summary>
        /// Adds a maggiage between 2 people from the same genealogy tree.
        /// </summary>
        /// <param name="education"> Is the <see cref="MarriageDetailsModel"/> object which 
        /// contains all the information for the marriage that should be created.</param>
        /// <returns>
        /// Returns the <see cref="MarriageDetailsModel"/> object for the created marriage.
        /// </returns>
        Task<MarriageDetailsModel> AddMarriageAsync(MarriageCreateUpdateModel marriage);

        /// <summary>
        /// Updates an existing marriage between 2 people from the same genealogy tree.
        /// </summary>
        /// <param name="marriage"> Is the <see cref="MarriageCreateUpdateModel"/> object which
        /// contains the information for the marriage that should be updated.</param>
        /// <returns>
        /// Returns the <see cref="MarriageCreateUpdateModel"/> object for the updated marriage.
        /// </returns>
        Task<MarriageDetailsModel> UpdateMarriageAsync(MarriageCreateUpdateModel marriage);

        /// <summary>
        /// Deletes an existing marriage from betweeen 2 people inside the same genealogy tree.
        /// </summary>
        /// <param name="marriageId"> The Id for the marriage that should be removed.</param>
        /// <returns>
        /// Returns the <see cref="MarriageDetailsModel"/> object that was removed.
        /// </returns>
        Task<MarriageDetailsModel> DeleteMarriageAsync(int marriageId);
    }
}
