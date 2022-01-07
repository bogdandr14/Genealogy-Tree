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
            //One to many User - Educations
            modelBuilder.Entity<User>()
                .HasMany<Education>(u => u.Educations)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            //One to many User - Occupations
            modelBuilder.Entity<User>()
                .HasMany<Occupation>(u => u.Occupations)
                .WithOne(o => o.User)
                .HasForeignKey(o => o.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            //One to many Gender - People
            modelBuilder.Entity<Gender>()
               .HasMany<Person>(g => g.People)
               .WithOne(p => p.Gender)
               .HasForeignKey(p => p.GenderId)
               .OnDelete(DeleteBehavior.SetNull);

            //One to one Person - Place of birth
            modelBuilder.Entity<Person>()
                .HasOne<Location>(m => m.PlaceOfBirth)
                .WithOne()
                .HasForeignKey<Person>(m => m.PlaceOfBirthId)
                .OnDelete(DeleteBehavior.SetNull);
            //One to one Person - Place of living
            modelBuilder.Entity<Person>()
                .HasOne<Location>(m => m.PlaceOfLiving)
                .WithOne()
                .HasForeignKey<Person>(m => m.PlaceOfLivingId)
                .OnDelete(DeleteBehavior.SetNull);

            //Many to one Marriages - Person
            modelBuilder.Entity<Marriage>()
                .HasOne<Person>(m => m.FirstPerson)
                .WithMany(p => p.Marriages)
                .HasForeignKey(m => m.FirstPersonId)
                .OnDelete(DeleteBehavior.SetNull);
            modelBuilder.Entity<Marriage>()
                .HasOne<Person>(m => m.SecondPerson)
                .WithMany(p => p.Marriages)
                .HasForeignKey(m => m.SecondPersonId)
                .OnDelete(DeleteBehavior.SetNull);

            //One to many Religion - People
            modelBuilder.Entity<Religion>()
               .HasMany<Person>(g => g.People)
               .WithOne(p => p.Religion)
               .HasForeignKey(p => p.ReligionId)
               .OnDelete(DeleteBehavior.SetNull);

            /*  modelBuilder.Entity<Person>()
                  .HasMany<Location>(u => u.PlaceOfLiving && u.PlaceOfBirth)
                  .WithOne(l => l.Person)
                  .HasForeignKey(e => e.UserId)
                  .OnDelete(DeleteBehavior.Cascade);*/

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
