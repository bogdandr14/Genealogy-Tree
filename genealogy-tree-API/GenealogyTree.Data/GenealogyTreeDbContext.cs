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

        public virtual DbSet<Education> Educations { get; set; }
        public virtual DbSet<EducationLevel> EducationLevels { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Marriage> Marriages { get; set; }
        public virtual DbSet<Nationality> Nationalities { get; set; }
        public virtual DbSet<Occupation> Occupations { get; set; }
        public virtual DbSet<ParentChild> ParentsChildren { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<Religion> Religions { get; set; }
        public virtual DbSet<Relative> Relatives { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<Tree> Trees { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            //One to many Education level - Educations
            modelBuilder.Entity<EducationLevel>()
               .HasMany<Education>(el => el.Educations)
               .WithOne(e => e.EducationLevel)
               .HasForeignKey(e => e.EducationLevelId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Image - People
            modelBuilder.Entity<Image>()
                .HasMany<Person>(i => i.People)
                .WithOne(p => p.Image)
                .HasForeignKey(p => p.ImageId)
                .OnDelete(DeleteBehavior.SetNull);

            //One to many Birth place - People
            modelBuilder.Entity<Location>()
                .HasMany<Person>(l => l.PeopleBornHere)
                .WithOne(p => p.BirthPlace)
                .HasForeignKey(p => p.BirthPlaceId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many Living place - People
            modelBuilder.Entity<Location>()
                .HasMany<Person>(l => l.PeopleLivingHere)
                .WithOne(p => p.LivingPlace)
                .HasForeignKey(p => p.LivingPlaceId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many Nationality - People
            modelBuilder.Entity<Nationality>()
               .HasMany<Person>(n => n.People)
               .WithOne(p => p.Nationality)
               .HasForeignKey(p => p.NationalityId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Marriages 1
            modelBuilder.Entity<Person>()
                .HasMany<Marriage>(p => p.FirstPersonMarriages)
                .WithOne(m => m.FirstPerson)
                .HasForeignKey(m => m.FirstPersonId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Marriages 2
            modelBuilder.Entity<Person>()
                .HasMany<Marriage>(p => p.SecondPersonMarriages)
                .WithOne(m => m.SecondPerson)
                .HasForeignKey(m => m.SecondPersonId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Parents
            modelBuilder.Entity<Person>()
                .HasMany<ParentChild>(p => p.Parents)
                .WithOne(pc => pc.Child)
                .HasForeignKey(pc => pc.ChildId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Children
            modelBuilder.Entity<Person>()
                .HasMany<ParentChild>(p => p.Children)
                .WithOne(pc => pc.Parent)
                .HasForeignKey(pc => pc.ParentId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to one Person - Relatives's reference in primary tree
            modelBuilder.Entity<Person>()
               .HasOne<Relative>(p => p.RelativeForPerson)
               .WithOne(su => su.RelativePersonInPrimaryTree)
               .HasForeignKey<Relative>(su => su.RelativePersonInPrimaryTreeId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Possible receivers reference in sender tree
            modelBuilder.Entity<Person>()
               .HasMany<Request>(p => p.SenderRequestsForPerson)
               .WithOne(sr => sr.ReceiverReferenceInSenderTree)
               .HasForeignKey(sr => sr.ReceiverReferenceInSenderTreeId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Religion - People
            modelBuilder.Entity<Religion>()
               .HasMany<Person>(g => g.People)
               .WithOne(p => p.Religion)
               .HasForeignKey(p => p.ReligionId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Tree - People
            modelBuilder.Entity<Tree>()
                .HasMany<Person>(u => u.PeopleInTree)
                .WithOne(p => p.Tree)
                .HasForeignKey(p => p.TreeId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many User - Educations
            modelBuilder.Entity<User>()
                .HasMany<Education>(u => u.Educations)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many User - Occupations
            modelBuilder.Entity<User>()
                .HasMany<Occupation>(u => u.Occupations)
                .WithOne(o => o.User)
                .HasForeignKey(o => o.UserId)
                .OnDelete(DeleteBehavior.NoAction);

            //One to many User - User synchronizations with other users
            modelBuilder.Entity<User>()
               .HasMany<Relative>(u => u.UserRelatives)
               .WithOne(p => p.PrimaryUser)
               .HasForeignKey(p => p.PrimaryUserId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - Other users synchronizations to this user
            modelBuilder.Entity<User>()
               .HasMany<Relative>(u => u.RelativesWithUser)
               .WithOne(p => p.RelativeUser)
               .HasForeignKey(p => p.RelativeUserId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - SentRequests
            modelBuilder.Entity<User>()
               .HasMany<Request>(u => u.SentRequests)
               .WithOne(p => p.Sender)
               .HasForeignKey(p => p.SenderId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - SentRequests
            modelBuilder.Entity<User>()
               .HasMany<Request>(u => u.ReceivedRequests)
               .WithOne(p => p.Receiver)
               .HasForeignKey(p => p.ReceiverId)
               .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Person>().Navigation(p => p.Image).AutoInclude();
            modelBuilder.Entity<Person>().Navigation(p => p.Nationality).AutoInclude();
            modelBuilder.Entity<Person>().Navigation(p => p.Religion).AutoInclude();
            modelBuilder.Entity<Person>().Navigation(p => p.BirthPlace).AutoInclude();
            modelBuilder.Entity<Person>().Navigation(p => p.LivingPlace).AutoInclude();

            modelBuilder.Entity<User>().Navigation(u => u.Occupations).AutoInclude();
            modelBuilder.Entity<User>().Navigation(u => u.Educations).AutoInclude();
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
