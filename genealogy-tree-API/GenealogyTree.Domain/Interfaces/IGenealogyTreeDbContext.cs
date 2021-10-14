using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace GenealogyTree.Domain.Interfaces
{
    public interface IGenealogyTreeDbContext
    {
        public DbSet<T> DbSet<T>() where T : class;
        public Task SaveChangesAsync();
    }
}
