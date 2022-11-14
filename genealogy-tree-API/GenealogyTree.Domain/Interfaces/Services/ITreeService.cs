using System;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces.Services
{
    public interface ITreeService
    {
        /// <summary>
        /// Retrieves a the tree information for the specified user.
        /// </summary>
        /// <param name="userId"> The Guid of the user for which should be returned the tree 
        /// information.</param>
        Task GetTreeForUser(Guid userId, int? rootPersonId);
    }
}
