using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface INationalityService
    {

        /// <summary>
        /// Retrieves all nationalities that can be used when creating a person or visualising him/her.
        /// </summary>
        /// <returns>
        /// Returns a list of <see cref="GenericNameModel"/> object, which contains the Id and Name of 
        /// the nationalities.
        /// </returns>
        Task<List<GenericNameModel>> GetAllNationalitiesAsync();

        /// <summary>
        /// Adds a nationality that can be used by any user.
        /// This action should be executed only by an Admin.
        /// </summary>
        /// <param name="nationalityName"> The name of the new nationality which must be created.</param>
        /// <returns>
        /// Returns a <see cref="GenericNameModel"/> object, which contains the Id and Name of the 
        /// new nationality.
        /// </returns>
        Task<GenericNameModel> AddNationalityAsync(string nationalityName);
    }
}
