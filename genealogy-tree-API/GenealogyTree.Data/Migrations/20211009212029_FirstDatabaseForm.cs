using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class FirstDatabaseForm : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Genders",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Genders", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Locations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    State = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Country = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    City = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Locations", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Religions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Religions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Persons",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    About = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateOfDeath = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastUpdate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ParentsId = table.Column<int>(type: "int", nullable: true),
                    GenderId = table.Column<int>(type: "int", nullable: false),
                    PlaceOfBirthId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Persons", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Persons_Genders_GenderId",
                        column: x => x.GenderId,
                        principalTable: "Genders",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Persons_Locations_PlaceOfBirthId",
                        column: x => x.PlaceOfBirthId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Relationships",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FirstPersonId = table.Column<int>(type: "int", nullable: true),
                    SecondPersonId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Relationships", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Relationships_Persons_FirstPersonId",
                        column: x => x.FirstPersonId,
                        principalTable: "Persons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Relationships_Persons_SecondPersonId",
                        column: x => x.SecondPersonId,
                        principalTable: "Persons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Nationality = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SharePersonalInfo = table.Column<bool>(type: "bit", nullable: false),
                    LastTreeUpdate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LastSyncCheck = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PersonId = table.Column<int>(type: "int", nullable: false),
                    ReligionId = table.Column<int>(type: "int", nullable: false),
                    PlaceOfLivingId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_Locations_PlaceOfLivingId",
                        column: x => x.PlaceOfLivingId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Users_Persons_PersonId",
                        column: x => x.PersonId,
                        principalTable: "Persons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Users_Religions_ReligionId",
                        column: x => x.ReligionId,
                        principalTable: "Religions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Marriages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DateStarted = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateEnded = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CoupleId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Marriages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Marriages_Relationships_CoupleId",
                        column: x => x.CoupleId,
                        principalTable: "Relationships",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Educations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EducationInstituteName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EducationLevel = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Educations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Educations_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Occupations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    OccupationName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    WorkingPlaceName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Occupations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Occupations_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SynchronizedUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PrimaryUserId = table.Column<int>(type: "int", nullable: false),
                    SynchedUserId = table.Column<int>(type: "int", nullable: false),
                    SynchedPersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SynchronizedUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SynchronizedUsers_Persons_SynchedPersonInPrimaryTreeId",
                        column: x => x.SynchedPersonInPrimaryTreeId,
                        principalTable: "Persons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SynchronizedUsers_Users_PrimaryUserId",
                        column: x => x.PrimaryUserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_SynchronizedUsers_Users_SynchedUserId",
                        column: x => x.SynchedUserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateTable(
                name: "SyncRequests",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ReceiverResponded = table.Column<bool>(type: "bit", nullable: false),
                    Response = table.Column<bool>(type: "bit", nullable: false),
                    SenderId = table.Column<int>(type: "int", nullable: false),
                    ReceiverId = table.Column<int>(type: "int", nullable: false),
                    ReceiverReferenceInSenderTreeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SyncRequests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SyncRequests_Persons_ReceiverReferenceInSenderTreeId",
                        column: x => x.ReceiverReferenceInSenderTreeId,
                        principalTable: "Persons",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SyncRequests_Users_ReceiverId",
                        column: x => x.ReceiverId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_SyncRequests_Users_SenderId",
                        column: x => x.SenderId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Educations_UserId",
                table: "Educations",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Marriages_CoupleId",
                table: "Marriages",
                column: "CoupleId");

            migrationBuilder.CreateIndex(
                name: "IX_Occupations_UserId",
                table: "Occupations",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Persons_GenderId",
                table: "Persons",
                column: "GenderId");

            migrationBuilder.CreateIndex(
                name: "IX_Persons_ParentsId",
                table: "Persons",
                column: "ParentsId",
                unique: true,
                filter: "[ParentsId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Persons_PlaceOfBirthId",
                table: "Persons",
                column: "PlaceOfBirthId");

            migrationBuilder.CreateIndex(
                name: "IX_Relationships_FirstPersonId",
                table: "Relationships",
                column: "FirstPersonId",
                unique: true,
                filter: "[FirstPersonId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Relationships_SecondPersonId",
                table: "Relationships",
                column: "SecondPersonId",
                unique: true,
                filter: "[SecondPersonId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_SynchronizedUsers_PrimaryUserId",
                table: "SynchronizedUsers",
                column: "PrimaryUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SynchronizedUsers_SynchedPersonInPrimaryTreeId",
                table: "SynchronizedUsers",
                column: "SynchedPersonInPrimaryTreeId");

            migrationBuilder.CreateIndex(
                name: "IX_SynchronizedUsers_SynchedUserId",
                table: "SynchronizedUsers",
                column: "SynchedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SyncRequests_ReceiverId",
                table: "SyncRequests",
                column: "ReceiverId");

            migrationBuilder.CreateIndex(
                name: "IX_SyncRequests_ReceiverReferenceInSenderTreeId",
                table: "SyncRequests",
                column: "ReceiverReferenceInSenderTreeId");

            migrationBuilder.CreateIndex(
                name: "IX_SyncRequests_SenderId",
                table: "SyncRequests",
                column: "SenderId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_PersonId",
                table: "Users",
                column: "PersonId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_PlaceOfLivingId",
                table: "Users",
                column: "PlaceOfLivingId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_ReligionId",
                table: "Users",
                column: "ReligionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Relationships_ParentsId",
                table: "Persons",
                column: "ParentsId",
                principalTable: "Relationships",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Relationships_ParentsId",
                table: "Persons");

            migrationBuilder.DropTable(
                name: "Educations");

            migrationBuilder.DropTable(
                name: "Marriages");

            migrationBuilder.DropTable(
                name: "Occupations");

            migrationBuilder.DropTable(
                name: "SynchronizedUsers");

            migrationBuilder.DropTable(
                name: "SyncRequests");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "Religions");

            migrationBuilder.DropTable(
                name: "Relationships");

            migrationBuilder.DropTable(
                name: "Persons");

            migrationBuilder.DropTable(
                name: "Genders");

            migrationBuilder.DropTable(
                name: "Locations");
        }
    }
}
