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
    [DbContext(typeof(GenealogyTreeDbContext))]
    [Migration("20220602121132_addedCreationAndModificationTimeStamps")]
    partial class addedCreationAndModificationTimeStamps
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.11")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Education", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("EducationInstituteName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("EducationLevelId")
                        .HasColumnType("int");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UserId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("EducationLevelId");

                    b.HasIndex("UserId");

                    b.ToTable("Educations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.EducationLevel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("EducationLevels");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Image", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("FileName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MimeType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<long>("SizeInBytes")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.ToTable("Images");
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

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("EndDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("FirstPersonId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<int>("SecondPersonId")
                        .HasColumnType("int");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("FirstPersonId");

                    b.HasIndex("SecondPersonId");

                    b.ToTable("Marriages");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Nationality", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Nationalities");
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

                    b.Property<Guid>("UserId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("WorkingPlaceName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("Occupations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.ParentChild", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("BloodRelatives")
                        .HasColumnType("bit");

                    b.Property<int>("ChildId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<int>("ParentId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ChildId");

                    b.HasIndex("ParentId");

                    b.ToTable("ParentsChildren");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Person", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime?>("BirthDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("BirthPlaceId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeathDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Gender")
                        .IsRequired()
                        .HasColumnType("nvarchar(1)");

                    b.Property<int?>("ImageId")
                        .HasColumnType("int");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("LivingPlaceId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<int?>("NationalityId")
                        .HasColumnType("int");

                    b.Property<int?>("ReligionId")
                        .HasColumnType("int");

                    b.Property<Guid>("TreeId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("BirthPlaceId");

                    b.HasIndex("ImageId");

                    b.HasIndex("LivingPlaceId");

                    b.HasIndex("NationalityId");

                    b.HasIndex("ReligionId");

                    b.HasIndex("TreeId");

                    b.ToTable("People");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Position", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<float>("Latitude")
                        .HasColumnType("real");

                    b.Property<float>("Longitude")
                        .HasColumnType("real");

                    b.Property<DateTime?>("UpdatedOn")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Position");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Relative", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("LastSyncCheck")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("PrimaryUserId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("RelativePersonInPrimaryTreeId")
                        .HasColumnType("int");

                    b.Property<Guid>("RelativeUserId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("PrimaryUserId");

                    b.HasIndex("RelativePersonInPrimaryTreeId")
                        .IsUnique();

                    b.HasIndex("RelativeUserId");

                    b.ToTable("Relatives");
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

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Request", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("ReceiverId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("ReceiverReferenceInSenderTreeId")
                        .HasColumnType("int");

                    b.Property<bool>("ReceiverResponded")
                        .HasColumnType("bit");

                    b.Property<bool>("Response")
                        .HasColumnType("bit");

                    b.Property<Guid>("SenderId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("ReceiverId");

                    b.HasIndex("ReceiverReferenceInSenderTreeId");

                    b.HasIndex("SenderId");

                    b.ToTable("Requests");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Tree", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("LastUpdate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Trees");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("About")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("NotifyBirthdays")
                        .HasColumnType("bit");

                    b.Property<bool>("NotifyUpdates")
                        .HasColumnType("bit");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PasswordSalt")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PersonId")
                        .HasColumnType("int");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("PositionId")
                        .HasColumnType("int");

                    b.Property<bool>("ShareLocation")
                        .HasColumnType("bit");

                    b.Property<bool>("SharePersonalInfo")
                        .HasColumnType("bit");

                    b.Property<string>("Username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("PersonId");

                    b.HasIndex("PositionId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Education", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.EducationLevel", "EducationLevel")
                        .WithMany("Educations")
                        .HasForeignKey("EducationLevelId")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.HasOne("GenealogyTree.Domain.Entities.User", "User")
                        .WithMany("Educations")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("EducationLevel");

                    b.Navigation("User");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Marriage", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Person", "FirstPerson")
                        .WithMany("FirstPersonMarriages")
                        .HasForeignKey("FirstPersonId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "SecondPerson")
                        .WithMany("SecondPersonMarriages")
                        .HasForeignKey("SecondPersonId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("FirstPerson");

                    b.Navigation("SecondPerson");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Occupation", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "User")
                        .WithMany("Occupations")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.ParentChild", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Person", "Child")
                        .WithMany("Parents")
                        .HasForeignKey("ChildId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "Parent")
                        .WithMany("Children")
                        .HasForeignKey("ParentId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("Child");

                    b.Navigation("Parent");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Person", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Location", "BirthPlace")
                        .WithMany("PeopleBornHere")
                        .HasForeignKey("BirthPlaceId")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.HasOne("GenealogyTree.Domain.Entities.Image", "Image")
                        .WithMany("People")
                        .HasForeignKey("ImageId")
                        .OnDelete(DeleteBehavior.SetNull);

                    b.HasOne("GenealogyTree.Domain.Entities.Location", "LivingPlace")
                        .WithMany("PeopleLivingHere")
                        .HasForeignKey("LivingPlaceId")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.HasOne("GenealogyTree.Domain.Entities.Nationality", "Nationality")
                        .WithMany("People")
                        .HasForeignKey("NationalityId")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.HasOne("GenealogyTree.Domain.Entities.Religion", "Religion")
                        .WithMany("People")
                        .HasForeignKey("ReligionId")
                        .OnDelete(DeleteBehavior.NoAction);

                    b.HasOne("GenealogyTree.Domain.Entities.Tree", "Tree")
                        .WithMany("PeopleInTree")
                        .HasForeignKey("TreeId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("BirthPlace");

                    b.Navigation("Image");

                    b.Navigation("LivingPlace");

                    b.Navigation("Nationality");

                    b.Navigation("Religion");

                    b.Navigation("Tree");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Relative", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "PrimaryUser")
                        .WithMany("UserRelatives")
                        .HasForeignKey("PrimaryUserId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "RelativePersonInPrimaryTree")
                        .WithOne("RelativeForPerson")
                        .HasForeignKey("GenealogyTree.Domain.Entities.Relative", "RelativePersonInPrimaryTreeId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.User", "RelativeUser")
                        .WithMany("RelativesWithUser")
                        .HasForeignKey("RelativeUserId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("PrimaryUser");

                    b.Navigation("RelativePersonInPrimaryTree");

                    b.Navigation("RelativeUser");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Request", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.User", "Receiver")
                        .WithMany("ReceivedRequests")
                        .HasForeignKey("ReceiverId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Person", "ReceiverReferenceInSenderTree")
                        .WithMany("SenderRequestsForPerson")
                        .HasForeignKey("ReceiverReferenceInSenderTreeId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.User", "Sender")
                        .WithMany("SentRequests")
                        .HasForeignKey("SenderId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("Receiver");

                    b.Navigation("ReceiverReferenceInSenderTree");

                    b.Navigation("Sender");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.User", b =>
                {
                    b.HasOne("GenealogyTree.Domain.Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GenealogyTree.Domain.Entities.Position", "Position")
                        .WithMany()
                        .HasForeignKey("PositionId");

                    b.Navigation("Person");

                    b.Navigation("Position");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.EducationLevel", b =>
                {
                    b.Navigation("Educations");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Image", b =>
                {
                    b.Navigation("People");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Location", b =>
                {
                    b.Navigation("PeopleBornHere");

                    b.Navigation("PeopleLivingHere");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Nationality", b =>
                {
                    b.Navigation("People");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Person", b =>
                {
                    b.Navigation("Children");

                    b.Navigation("FirstPersonMarriages");

                    b.Navigation("Parents");

                    b.Navigation("RelativeForPerson");

                    b.Navigation("SecondPersonMarriages");

                    b.Navigation("SenderRequestsForPerson");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Religion", b =>
                {
                    b.Navigation("People");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.Tree", b =>
                {
                    b.Navigation("PeopleInTree");
                });

            modelBuilder.Entity("GenealogyTree.Domain.Entities.User", b =>
                {
                    b.Navigation("Educations");

                    b.Navigation("Occupations");

                    b.Navigation("ReceivedRequests");

                    b.Navigation("RelativesWithUser");

                    b.Navigation("SentRequests");

                    b.Navigation("UserRelatives");
                });
#pragma warning restore 612, 618
        }
    }
}
