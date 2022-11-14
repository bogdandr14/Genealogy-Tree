using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces
{
    /// <summary>
    /// Class <c>IGenealogyTreeDbContext</c> can be used for saving the changes in the database.
    /// </summary>
    public interface IGenealogyTreeDbContext
    {
        public Task SaveChangesAsync();
    }
}
