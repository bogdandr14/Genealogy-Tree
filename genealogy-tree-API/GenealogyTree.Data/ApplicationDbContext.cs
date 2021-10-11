using GenealogyTree.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace GenealogyTree.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Person>()
                        .HasOne(e => e.Parents)
                        .WithOne();
            modelBuilder.Entity<Relationship>()
                        .HasOne(e => e.FirstPerson)
                        .WithOne();
            modelBuilder.Entity<Relationship>()
                        .HasOne(e => e.SecondPerson)
                        .WithOne();
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<Religion> Religions { get; set; }
        public DbSet<Education> Educations { get; set; }
        public DbSet<Occupation> Occupations { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Relationship> Relationships { get; set; }
        public DbSet<Marriage> Marriages { get; set; }
        public DbSet<SyncRequest> SyncRequests { get; set; }
        public DbSet<SynchedUsers> SynchronizedUsers { get; set; }

    }
}
