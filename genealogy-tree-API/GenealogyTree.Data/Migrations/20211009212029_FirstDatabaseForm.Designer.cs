﻿// <auto-generated />
using System;
using GenealogyTree.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace GenealogyTree.Data.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20211009212029_FirstDatabaseForm")]
    partial class FirstDatabaseForm
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.10")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Education", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("EducationInstituteName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("EducationLevel")
                        .HasColumnType("int");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Educations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Gender", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Genders");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Location", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("City")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Country")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("State")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Locations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Marriage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CoupleId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("DateEnded")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DateStarted")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("CoupleId");

                    b.ToTable("Marriages");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Occupation", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime?>("EndDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("OccupationName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("StartDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.Property<string>("WorkingPlaceName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Occupations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Person", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("About")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("DateOfBirth")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DateOfDeath")
                        .HasColumnType("datetime2");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("GenderId")
                        .HasColumnType("int");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("LastUpdate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ParentsId")
                        .HasColumnType("int");

                    b.Property<int?>("PlaceOfBirthId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("GenderId");

                    b.HasIndex("ParentsId")
                        .IsUnique()
                        .HasFilter("[ParentsId] IS NOT NULL");

                    b.HasIndex("PlaceOfBirthId");

                    b.ToTable("Persons");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Relationship", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime?>("EndDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("FirstPersonId")
                        .HasColumnType("int");

                    b.Property<int?>("SecondPersonId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("StartDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("FirstPersonId")
                        .IsUnique()
                        .HasFilter("[FirstPersonId] IS NOT NULL");

                    b.HasIndex("SecondPersonId")
                        .IsUnique()
                        .HasFilter("[SecondPersonId] IS NOT NULL");

                    b.ToTable("Relationships");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Religion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Religions");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.SyncRequest", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ReceiverId")
                        .HasColumnType("int");

                    b.Property<int>("ReceiverReferenceInSenderTreeId")
                        .HasColumnType("int");

                    b.Property<bool>("ReceiverResponded")
                        .HasColumnType("bit");

                    b.Property<bool>("Response")
                        .HasColumnType("bit");

                    b.Property<int>("SenderId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ReceiverId");

                    b.HasIndex("ReceiverReferenceInSenderTreeId");

                    b.HasIndex("SenderId");

                    b.ToTable("SyncRequests");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.SynchronizedUsers", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("PrimaryUserId")
                        .HasColumnType("int");

                    b.Property<int>("SynchedPersonInPrimaryTreeId")
                        .HasColumnType("int");

                    b.Property<int>("SynchedUserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("PrimaryUserId");

                    b.HasIndex("SynchedPersonInPrimaryTreeId");

                    b.HasIndex("SynchedUserId");

                    b.ToTable("SynchronizedUsers");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("LastSyncCheck")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("LastTreeUpdate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Nationality")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PersonId")
                        .HasColumnType("int");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PlaceOfLivingId")
                        .HasColumnType("int");

                    b.Property<int>("ReligionId")
                        .HasColumnType("int");

                    b.Property<bool>("SharePersonalInfo")
                        .HasColumnType("bit");

                    b.Property<string>("Username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("PersonId");

                    b.HasIndex("PlaceOfLivingId");

                    b.HasIndex("ReligionId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Education", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Marriage", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Relationship", "Couple")
                        .WithMany()
                        .HasForeignKey("CoupleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Couple");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Occupation", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Person", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Gender", "Gender")
                        .WithMany()
                        .HasForeignKey("GenderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Relationship", "Parents")
                        .WithOne()
                        .HasForeignKey("GenealogyTree.Domain.Entities.Person", "ParentsId");

                    b.HasOne("GenealogyTree.Domain.Entities.Location", "PlaceOfBirth")
                        .WithMany()
                        .HasForeignKey("PlaceOfBirthId");

                    b.Navigation("Gender");

                    b.Navigation("Parents");

                    b.Navigation("PlaceOfBirth");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Relationship", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Person", "FirstPerson")
                        .WithOne()
                        .HasForeignKey("GenealogyTree.Domain.Entities.Relationship", "FirstPersonId");

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "SecondPerson")
                        .WithOne()
                        .HasForeignKey("GenealogyTree.Domain.Entities.Relationship", "SecondPersonId");

                    b.Navigation("FirstPerson");

                    b.Navigation("SecondPerson");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.SyncRequest", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "Receiver")
                        .WithMany()
                        .HasForeignKey("ReceiverId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "ReceiverReferenceInSenderTree")
                        .WithMany()
                        .HasForeignKey("ReceiverReferenceInSenderTreeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.User", "Sender")
                        .WithMany()
                        .HasForeignKey("SenderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Receiver");

                    b.Navigation("ReceiverReferenceInSenderTree");

                    b.Navigation("Sender");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.SynchronizedUsers", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "PrimaryUser")
                        .WithMany()
                        .HasForeignKey("PrimaryUserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "SynchedPersonInPrimaryTree")
                        .WithMany()
                        .HasForeignKey("SynchedPersonInPrimaryTreeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.User", "SynchedUser")
                        .WithMany()
                        .HasForeignKey("SynchedUserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("PrimaryUser");

                    b.Navigation("SynchedPersonInPrimaryTree");

                    b.Navigation("SynchedUser");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.User", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Location", "PlaceOfLiving")
                        .WithMany()
                        .HasForeignKey("PlaceOfLivingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Religion", "Religion")
                        .WithMany()
                        .HasForeignKey("ReligionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Person");

                    b.Navigation("PlaceOfLiving");

                    b.Navigation("Religion");
                });
#pragma warning restore 612, 618
        }
    }
}
