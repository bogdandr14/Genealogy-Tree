using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class removedRelationship : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Marriages_Relationships_CoupleId",
                table: "Marriages");

            migrationBuilder.DropForeignKey(
                name: "FK_Occupations_Users_UserId",
                table: "Occupations");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Genders_GenderId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Relationships_ParentsId",
                table: "Persons");

            migrationBuilder.DropTable(
                name: "Relationships");

            migrationBuilder.DropIndex(
                name: "IX_Persons_ParentsId",
                table: "Persons");

            migrationBuilder.RenameColumn(
                name: "Password",
                table: "Users",
                newName: "PasswordSalt");

            migrationBuilder.RenameColumn(
                name: "ParentsId",
                table: "Persons",
                newName: "SecondParentId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Occupations",
                newName: "PersonId");

            migrationBuilder.RenameIndex(
                name: "IX_Occupations_UserId",
                table: "Occupations",
                newName: "IX_Occupations_PersonId");

            migrationBuilder.RenameColumn(
                name: "CoupleId",
                table: "Marriages",
                newName: "SecondPersonId");

            migrationBuilder.RenameIndex(
                name: "IX_Marriages_CoupleId",
                table: "Marriages",
                newName: "IX_Marriages_SecondPersonId");

            migrationBuilder.AddColumn<string>(
                name: "PasswordHash",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "GenderId",
                table: "Persons",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<DateTime>(
                name: "BirthDate",
                table: "Persons",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<int>(
                name: "FirstParentId",
                table: "Persons",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "FirstPersonId",
                table: "Marriages",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Persons_FirstParentId",
                table: "Persons",
                column: "FirstParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Persons_SecondParentId",
                table: "Persons",
                column: "SecondParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Marriages_FirstPersonId",
                table: "Marriages",
                column: "FirstPersonId");

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_Persons_FirstPersonId",
                table: "Marriages",
                column: "FirstPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_Persons_SecondPersonId",
                table: "Marriages",
                column: "SecondPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);

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
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
                name: "FK_Persons_Persons_FirstParentId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Persons_SecondParentId",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Persons_FirstParentId",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Persons_SecondParentId",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Marriages_FirstPersonId",
                table: "Marriages");

            migrationBuilder.DropColumn(
                name: "PasswordHash",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "FirstParentId",
                table: "Persons");

            migrationBuilder.DropColumn(
                name: "FirstPersonId",
                table: "Marriages");

            migrationBuilder.RenameColumn(
                name: "PasswordSalt",
                table: "Users",
                newName: "Password");

            migrationBuilder.RenameColumn(
                name: "SecondParentId",
                table: "Persons",
                newName: "ParentsId");

            migrationBuilder.RenameColumn(
                name: "PersonId",
                table: "Occupations",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Occupations_PersonId",
                table: "Occupations",
                newName: "IX_Occupations_UserId");

            migrationBuilder.RenameColumn(
                name: "SecondPersonId",
                table: "Marriages",
                newName: "CoupleId");

            migrationBuilder.RenameIndex(
                name: "IX_Marriages_SecondPersonId",
                table: "Marriages",
                newName: "IX_Marriages_CoupleId");

            migrationBuilder.AlterColumn<int>(
                name: "GenderId",
                table: "Persons",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "BirthDate",
                table: "Persons",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.CreateTable(
                name: "Relationships",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FirstPersonId = table.Column<int>(type: "int", nullable: true),
                    SecondPersonId = table.Column<int>(type: "int", nullable: true),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: true)
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

            migrationBuilder.CreateIndex(
                name: "IX_Persons_ParentsId",
                table: "Persons",
                column: "ParentsId",
                unique: true,
                filter: "[ParentsId] IS NOT NULL");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Marriages_Relationships_CoupleId",
                table: "Marriages",
                column: "CoupleId",
                principalTable: "Relationships",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Occupations_Users_UserId",
                table: "Occupations",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Genders_GenderId",
                table: "Persons",
                column: "GenderId",
                principalTable: "Genders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Relationships_ParentsId",
                table: "Persons",
                column: "ParentsId",
                principalTable: "Relationships",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
