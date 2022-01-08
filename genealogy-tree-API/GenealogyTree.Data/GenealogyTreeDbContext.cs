﻿using GenealogyTree.Domain.Entities;
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
        public virtual DbSet<Gender> Genders { get; set; }        
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Marriage> Marriages { get; set; }
        public virtual DbSet<Nationality> Nationalities { get; set; }
        public virtual DbSet<Occupation> Occupations { get; set; }
        public virtual DbSet<ParentChild> ParentsChildren { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Religion> Religions { get; set; } 
        public virtual DbSet<Sync> Syncs { get; set; }
        public virtual DbSet<SyncRequest> SyncRequests { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            //One to many Education level - Educations
            modelBuilder.Entity<EducationLevel>()
               .HasMany<Education>(el => el.Educations)
               .WithOne(e => e.EducationLevel)
               .HasForeignKey(e => e.EducationLevelId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Gender - People
            modelBuilder.Entity<Gender>()
               .HasMany<Person>(g => g.People)
               .WithOne(p => p.Gender)
               .HasForeignKey(p => p.GenderId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Birth place - People
            modelBuilder.Entity<Location>()
                .HasMany<Person>(l=> l.PeopleBornHere)
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

            //One to one Person - Synced user's reference in primary tree
            modelBuilder.Entity<Person>()
               .HasOne<Sync>(p => p.SyncedUserToPerson)
               .WithOne(su => su.SyncedPersonInPrimaryTree)
               .HasForeignKey<Sync>(su => su.SyncedPersonInPrimaryTreeId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Person - Possible receivers reference in sender tree
            modelBuilder.Entity<Person>()
               .HasMany<SyncRequest>(p => p.SenderSyncRequestsForPerson)
               .WithOne(sr => sr.ReceiverReferenceInSenderTree)
               .HasForeignKey(sr => sr.ReceiverReferenceInSenderTreeId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many Religion - People
            modelBuilder.Entity<Religion>()
               .HasMany<Person>(g => g.People)
               .WithOne(p => p.Religion)
               .HasForeignKey(p => p.ReligionId)
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
               .HasMany<Sync>(u => u.SyncedToUsers)
               .WithOne(p => p.PrimaryUser)
               .HasForeignKey(p => p.PrimaryUserId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - Other users synchronizations to this user
            modelBuilder.Entity<User>()
               .HasMany<Sync>(u => u.SyncedByUsers)
               .WithOne(p => p.SyncedUser)
               .HasForeignKey(p => p.SyncedUserId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - SentRequests
            modelBuilder.Entity<User>()
               .HasMany<SyncRequest>(u => u.SentRequests)
               .WithOne(p => p.Sender)
               .HasForeignKey(p => p.SenderId)
               .OnDelete(DeleteBehavior.NoAction);

            //One to many User - SentRequests
            modelBuilder.Entity<User>()
               .HasMany<SyncRequest>(u => u.ReceivedRequests)
               .WithOne(p => p.Receiver)
               .HasForeignKey(p => p.ReceiverId)
               .OnDelete(DeleteBehavior.NoAction);
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
