using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces
{
    public interface IGenealogyTreeDbContext
    {
        public Task SaveChangesAsync();
    }
}
