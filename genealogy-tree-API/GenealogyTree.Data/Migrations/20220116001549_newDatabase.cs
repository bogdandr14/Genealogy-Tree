using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class newDatabase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EducationLevels",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EducationLevels", x => x.Id);
                });

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
                name: "Nationalities",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Nationalities", x => x.Id);
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
                name: "Trees",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastUpdate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Trees", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "People",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeathDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastUpdate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TreeId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    GenderId = table.Column<int>(type: "int", nullable: true),
                    BirthPlaceId = table.Column<int>(type: "int", nullable: true),
                    LivingPlaceId = table.Column<int>(type: "int", nullable: true),
                    NationalityId = table.Column<int>(type: "int", nullable: true),
                    ReligionId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_People", x => x.Id);
                    table.ForeignKey(
                        name: "FK_People_Genders_GenderId",
                        column: x => x.GenderId,
                        principalTable: "Genders",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_People_Locations_BirthPlaceId",
                        column: x => x.BirthPlaceId,
                        principalTable: "Locations",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_People_Locations_LivingPlaceId",
                        column: x => x.LivingPlaceId,
                        principalTable: "Locations",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_People_Nationalities_NationalityId",
                        column: x => x.NationalityId,
                        principalTable: "Nationalities",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_People_Religions_ReligionId",
                        column: x => x.ReligionId,
                        principalTable: "Religions",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_People_Trees_TreeId",
                        column: x => x.TreeId,
                        principalTable: "Trees",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Marriages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FirstPersonId = table.Column<int>(type: "int", nullable: false),
                    SecondPersonId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Marriages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Marriages_People_FirstPersonId",
                        column: x => x.FirstPersonId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Marriages_People_SecondPersonId",
                        column: x => x.SecondPersonId,
                        principalTable: "People",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "ParentsChildren",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BloodRelatives = table.Column<bool>(type: "bit", nullable: false),
                    ParentId = table.Column<int>(type: "int", nullable: false),
                    ChildId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ParentsChildren", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ParentsChildren_People_ChildId",
                        column: x => x.ChildId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_ParentsChildren_People_ParentId",
                        column: x => x.ParentId,
                        principalTable: "People",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PasswordSalt = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    About = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NotifyBirthdays = table.Column<bool>(type: "bit", nullable: false),
                    NotifyUpdates = table.Column<bool>(type: "bit", nullable: false),
                    SharePersonalInfo = table.Column<bool>(type: "bit", nullable: false),
                    ThemePreference = table.Column<bool>(type: "bit", nullable: false),
                    LanguagePreference = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastSyncCheck = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PersonId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_People_PersonId",
                        column: x => x.PersonId,
                        principalTable: "People",
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
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EducationLevelId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Educations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Educations_EducationLevels_EducationLevelId",
                        column: x => x.EducationLevelId,
                        principalTable: "EducationLevels",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Educations_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id");
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
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Occupations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Occupations_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "SyncRequests",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ReceiverResponded = table.Column<bool>(type: "bit", nullable: false),
                    Response = table.Column<bool>(type: "bit", nullable: false),
                    SenderId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ReceiverId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ReceiverReferenceInSenderTreeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SyncRequests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SyncRequests_People_ReceiverReferenceInSenderTreeId",
                        column: x => x.ReceiverReferenceInSenderTreeId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_SyncRequests_Users_ReceiverId",
                        column: x => x.ReceiverId,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_SyncRequests_Users_SenderId",
                        column: x => x.SenderId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Syncs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PrimaryUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    SyncedUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    SyncedPersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false),
                    SynchedUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Syncs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Syncs_People_SyncedPersonInPrimaryTreeId",
                        column: x => x.SyncedPersonInPrimaryTreeId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Syncs_Users_PrimaryUserId",
                        column: x => x.PrimaryUserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Syncs_Users_SyncedUserId",
                        column: x => x.SyncedUserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Educations_EducationLevelId",
                table: "Educations",
                column: "EducationLevelId");

            migrationBuilder.CreateIndex(
                name: "IX_Educations_UserId",
                table: "Educations",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Marriages_FirstPersonId",
                table: "Marriages",
                column: "FirstPersonId");

            migrationBuilder.CreateIndex(
                name: "IX_Marriages_SecondPersonId",
                table: "Marriages",
                column: "SecondPersonId");

            migrationBuilder.CreateIndex(
                name: "IX_Occupations_UserId",
                table: "Occupations",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ParentsChildren_ChildId",
                table: "ParentsChildren",
                column: "ChildId");

            migrationBuilder.CreateIndex(
                name: "IX_ParentsChildren_ParentId",
                table: "ParentsChildren",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_People_BirthPlaceId",
                table: "People",
                column: "BirthPlaceId");

            migrationBuilder.CreateIndex(
                name: "IX_People_GenderId",
                table: "People",
                column: "GenderId");

            migrationBuilder.CreateIndex(
                name: "IX_People_LivingPlaceId",
                table: "People",
                column: "LivingPlaceId");

            migrationBuilder.CreateIndex(
                name: "IX_People_NationalityId",
                table: "People",
                column: "NationalityId");

            migrationBuilder.CreateIndex(
                name: "IX_People_ReligionId",
                table: "People",
                column: "ReligionId");

            migrationBuilder.CreateIndex(
                name: "IX_People_TreeId",
                table: "People",
                column: "TreeId");

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
                name: "IX_Syncs_PrimaryUserId",
                table: "Syncs",
                column: "PrimaryUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Syncs_SyncedPersonInPrimaryTreeId",
                table: "Syncs",
                column: "SyncedPersonInPrimaryTreeId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Syncs_SyncedUserId",
                table: "Syncs",
                column: "SyncedUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_PersonId",
                table: "Users",
                column: "PersonId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Educations");

            migrationBuilder.DropTable(
                name: "Marriages");

            migrationBuilder.DropTable(
                name: "Occupations");

            migrationBuilder.DropTable(
                name: "ParentsChildren");

            migrationBuilder.DropTable(
                name: "SyncRequests");

            migrationBuilder.DropTable(
                name: "Syncs");

            migrationBuilder.DropTable(
                name: "EducationLevels");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "People");

            migrationBuilder.DropTable(
                name: "Genders");

            migrationBuilder.DropTable(
                name: "Locations");

            migrationBuilder.DropTable(
                name: "Nationalities");

            migrationBuilder.DropTable(
                name: "Religions");

            migrationBuilder.DropTable(
                name: "Trees");
        }
    }
}
