using GenealogyTree.Domain.DTO.Generic;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface IReligionService
    {

        /// <summary>
        /// Retrieves all religions that can be used when creating a person or visualising him/her.
        /// </summary>
        /// <returns>
        /// Returns a list of <see cref="GenericNameModel"/> object, which contains the Id and Name of 
        /// the religions.
        /// </returns>
        Task<List<GenericNameModel>> GetAllReligionsAsync();

        /// <summary>
        /// Adds a religion that can be used by any user.
        /// This action should be executed only by an Admin.
        /// </summary>
        /// <param name="religionName"> The name of the new religion which must be created.</param>
        /// <returns>
        /// Returns a <see cref="GenericNameModel"/> object, which contains the Id and Name of the 
        /// new religion.
        /// </returns>
        Task<GenericNameModel> AddReligionAsync(string religionName);
    }
}
