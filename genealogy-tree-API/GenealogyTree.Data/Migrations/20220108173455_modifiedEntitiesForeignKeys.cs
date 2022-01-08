using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class modifiedEntitiesForeignKeys : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Educations_Users_UserId",
                table: "Educations");

            migrationBuilder.DropForeignKey(
                name: "FK_Marriages_Persons_FirstPersonId",
                table: "Marriages");

            migrationBuilder.DropForeignKey(
                name: "FK_Marriages_Persons_SecondPersonId",
                table: "Marriages");

            migrationBuilder.DropForeignKey(
                name: "FK_Occupations_Persons_PersonId",
                table: "Occupations");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Genders_GenderId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Locations_PlaceOfBirthId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Locations_PlaceOfLivingId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Persons_FirstParentId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Persons_SecondParentId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Religions_ReligionId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_Persons_ReceiverReferenceInSenderTreeId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_Users_ReceiverId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_Users_SenderId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_Users_Persons_PersonId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "SynchronizedUsers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Persons",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Persons_FirstParentId",
                table: "Persons");

            migrationBuilder.DropColumn(
                name: "EducationLevel",
                table: "Educations");

            migrationBuilder.DropColumn(
                name: "FirstParentId",
                table: "Persons");

            migrationBuilder.DropColumn(
                name: "Nationality",
                table: "Persons");

            migrationBuilder.RenameTable(
                name: "Persons",
                newName: "People");

            migrationBuilder.RenameColumn(
                name: "PersonId",
                table: "Occupations",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Occupations_PersonId",
                table: "Occupations",
                newName: "IX_Occupations_UserId");

            migrationBuilder.RenameColumn(
                name: "DateStarted",
                table: "Marriages",
                newName: "StartDate");

            migrationBuilder.RenameColumn(
                name: "DateEnded",
                table: "Marriages",
                newName: "EndDate");

            migrationBuilder.RenameColumn(
                name: "SecondParentId",
                table: "People",
                newName: "NationalityId");

            migrationBuilder.RenameColumn(
                name: "PlaceOfLivingId",
                table: "People",
                newName: "LivingPlaceId");

            migrationBuilder.RenameColumn(
                name: "PlaceOfBirthId",
                table: "People",
                newName: "BirthPlaceId");

            migrationBuilder.RenameIndex(
                name: "IX_Persons_SecondParentId",
                table: "People",
                newName: "IX_People_NationalityId");

            migrationBuilder.RenameIndex(
                name: "IX_Persons_ReligionId",
                table: "People",
                newName: "IX_People_ReligionId");

            migrationBuilder.RenameIndex(
                name: "IX_Persons_PlaceOfLivingId",
                table: "People",
                newName: "IX_People_LivingPlaceId");

            migrationBuilder.RenameIndex(
                name: "IX_Persons_PlaceOfBirthId",
                table: "People",
                newName: "IX_People_BirthPlaceId");

            migrationBuilder.RenameIndex(
                name: "IX_Persons_GenderId",
                table: "People",
                newName: "IX_People_GenderId");

            migrationBuilder.AddColumn<int>(
                name: "EducationLevelId",
                table: "Educations",
                type: "int",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_People",
                table: "People",
                column: "Id");

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
                name: "Syncs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PrimaryUserId = table.Column<int>(type: "int", nullable: false),
                    SyncedUserId = table.Column<int>(type: "int", nullable: false),
                    SyncedPersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false),
                    SynchedUserId = table.Column<int>(type: "int", nullable: true)
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
                name: "IX_ParentsChildren_ChildId",
                table: "ParentsChildren",
                column: "ChildId");

            migrationBuilder.CreateIndex(
                name: "IX_ParentsChildren_ParentId",
                table: "ParentsChildren",
                column: "ParentId");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Educations_EducationLevels_EducationLevelId",
                table: "Educations",
                column: "EducationLevelId",
                principalTable: "EducationLevels",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Educations_Users_UserId",
                table: "Educations",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_People_FirstPersonId",
                table: "Marriages",
                column: "FirstPersonId",
                principalTable: "People",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_People_SecondPersonId",
                table: "Marriages",
                column: "SecondPersonId",
                principalTable: "People",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Occupations_Users_UserId",
                table: "Occupations",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_People_Genders_GenderId",
                table: "People",
                column: "GenderId",
                principalTable: "Genders",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_People_Locations_BirthPlaceId",
                table: "People",
                column: "BirthPlaceId",
                principalTable: "Locations",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_People_Locations_LivingPlaceId",
                table: "People",
                column: "LivingPlaceId",
                principalTable: "Locations",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_People_Nationalities_NationalityId",
                table: "People",
                column: "NationalityId",
                principalTable: "Nationalities",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_People_Religions_ReligionId",
                table: "People",
                column: "ReligionId",
                principalTable: "Religions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_People_ReceiverReferenceInSenderTreeId",
                table: "SyncRequests",
                column: "ReceiverReferenceInSenderTreeId",
                principalTable: "People",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_Users_ReceiverId",
                table: "SyncRequests",
                column: "ReceiverId",
                principalTable: "Users",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_Users_SenderId",
                table: "SyncRequests",
                column: "SenderId",
                principalTable: "Users",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_People_PersonId",
                table: "Users",
                column: "PersonId",
                principalTable: "People",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Educations_EducationLevels_EducationLevelId",
                table: "Educations");

            migrationBuilder.DropForeignKey(
                name: "FK_Educations_Users_UserId",
                table: "Educations");

            migrationBuilder.DropForeignKey(
                name: "FK_Marriages_People_FirstPersonId",
                table: "Marriages");

            migrationBuilder.DropForeignKey(
                name: "FK_Marriages_People_SecondPersonId",
                table: "Marriages");

            migrationBuilder.DropForeignKey(
                name: "FK_Occupations_Users_UserId",
                table: "Occupations");

            migrationBuilder.DropForeignKey(
                name: "FK_People_Genders_GenderId",
                table: "People");

            migrationBuilder.DropForeignKey(
                name: "FK_People_Locations_BirthPlaceId",
                table: "People");

            migrationBuilder.DropForeignKey(
                name: "FK_People_Locations_LivingPlaceId",
                table: "People");

            migrationBuilder.DropForeignKey(
                name: "FK_People_Nationalities_NationalityId",
                table: "People");

            migrationBuilder.DropForeignKey(
                name: "FK_People_Religions_ReligionId",
                table: "People");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_People_ReceiverReferenceInSenderTreeId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_Users_ReceiverId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_SyncRequests_Users_SenderId",
                table: "SyncRequests");

            migrationBuilder.DropForeignKey(
                name: "FK_Users_People_PersonId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "EducationLevels");

            migrationBuilder.DropTable(
                name: "Nationalities");

            migrationBuilder.DropTable(
                name: "ParentsChildren");

            migrationBuilder.DropTable(
                name: "Syncs");

            migrationBuilder.DropIndex(
                name: "IX_Educations_EducationLevelId",
                table: "Educations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_People",
                table: "People");

            migrationBuilder.DropColumn(
                name: "EducationLevelId",
                table: "Educations");

            migrationBuilder.RenameTable(
                name: "People",
                newName: "Persons");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Occupations",
                newName: "PersonId");

            migrationBuilder.RenameIndex(
                name: "IX_Occupations_UserId",
                table: "Occupations",
                newName: "IX_Occupations_PersonId");

            migrationBuilder.RenameColumn(
                name: "StartDate",
                table: "Marriages",
                newName: "DateStarted");

            migrationBuilder.RenameColumn(
                name: "EndDate",
                table: "Marriages",
                newName: "DateEnded");

            migrationBuilder.RenameColumn(
                name: "NationalityId",
                table: "Persons",
                newName: "SecondParentId");

            migrationBuilder.RenameColumn(
                name: "LivingPlaceId",
                table: "Persons",
                newName: "PlaceOfLivingId");

            migrationBuilder.RenameColumn(
                name: "BirthPlaceId",
                table: "Persons",
                newName: "PlaceOfBirthId");

            migrationBuilder.RenameIndex(
                name: "IX_People_ReligionId",
                table: "Persons",
                newName: "IX_Persons_ReligionId");

            migrationBuilder.RenameIndex(
                name: "IX_People_NationalityId",
                table: "Persons",
                newName: "IX_Persons_SecondParentId");

            migrationBuilder.RenameIndex(
                name: "IX_People_LivingPlaceId",
                table: "Persons",
                newName: "IX_Persons_PlaceOfLivingId");

            migrationBuilder.RenameIndex(
                name: "IX_People_GenderId",
                table: "Persons",
                newName: "IX_Persons_GenderId");

            migrationBuilder.RenameIndex(
                name: "IX_People_BirthPlaceId",
                table: "Persons",
                newName: "IX_Persons_PlaceOfBirthId");

            migrationBuilder.AddColumn<int>(
                name: "EducationLevel",
                table: "Educations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "FirstParentId",
                table: "Persons",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Nationality",
                table: "Persons",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Persons",
                table: "Persons",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "SynchronizedUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PrimaryUserId = table.Column<int>(type: "int", nullable: false),
                    SynchedPersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false),
                    SynchedUserId = table.Column<int>(type: "int", nullable: false)
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
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SynchronizedUsers_Users_SynchedUserId",
                        column: x => x.SynchedUserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Persons_FirstParentId",
                table: "Persons",
                column: "FirstParentId");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Educations_Users_UserId",
                table: "Educations",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_Persons_FirstPersonId",
                table: "Marriages",
                column: "FirstPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_Persons_SecondPersonId",
                table: "Marriages",
                column: "SecondPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Occupations_Persons_PersonId",
                table: "Occupations",
                column: "PersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Genders_GenderId",
                table: "Persons",
                column: "GenderId",
                principalTable: "Genders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Locations_PlaceOfBirthId",
                table: "Persons",
                column: "PlaceOfBirthId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Locations_PlaceOfLivingId",
                table: "Persons",
                column: "PlaceOfLivingId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Persons_FirstParentId",
                table: "Persons",
                column: "FirstParentId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Persons_SecondParentId",
                table: "Persons",
                column: "SecondParentId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Religions_ReligionId",
                table: "Persons",
                column: "ReligionId",
                principalTable: "Religions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_Persons_ReceiverReferenceInSenderTreeId",
                table: "SyncRequests",
                column: "ReceiverReferenceInSenderTreeId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_Users_ReceiverId",
                table: "SyncRequests",
                column: "ReceiverId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SyncRequests_Users_SenderId",
                table: "SyncRequests",
                column: "SenderId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Persons_PersonId",
                table: "Users",
                column: "PersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
