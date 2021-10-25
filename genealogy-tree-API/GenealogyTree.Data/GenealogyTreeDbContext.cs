using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace GenealogyTree.Data
{
    public class GenealogyTreeDbContext : DbContext, IGenealogyTreeDbContext
    {
        public GenealogyTreeDbContext(DbContextOptions<GenealogyTreeDbContext> options) : base(options)
        {
        }

        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Person> Persons { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<Religion> Religions { get; set; }
        public virtual DbSet<Education> Educations { get; set; }
        public virtual DbSet<Occupation> Occupations { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Marriage> Marriages { get; set; }
        public virtual DbSet<SyncRequest> SyncRequests { get; set; }
        public virtual DbSet<SynchedUsers> SynchronizedUsers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
        }

        public DbSet<T> DbSet<T>() where T : class
        {
            return DbSet<T>();
        }

        public async Task SaveChangesAsync()
        {
            await base.SaveChangesAsync();
        }
    }
}
