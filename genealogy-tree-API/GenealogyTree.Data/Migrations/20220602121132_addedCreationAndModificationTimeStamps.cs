using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class addedCreationAndModificationTimeStamps : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastSyncCheck",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "LastVerified",
                table: "Position");

            migrationBuilder.RenameColumn(
                name: "LastUpdate",
                table: "People",
                newName: "CreatedOn");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastSyncCheck",
                table: "Relatives",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedOn",
                table: "Position",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedOn",
                table: "People",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedOn",
                table: "ParentsChildren",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedOn",
                table: "ParentsChildren",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedOn",
                table: "Marriages",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedOn",
                table: "Marriages",
                type: "datetime2",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastSyncCheck",
                table: "Relatives");

            migrationBuilder.DropColumn(
                name: "UpdatedOn",
                table: "Position");

            migrationBuilder.DropColumn(
                name: "ModifiedOn",
                table: "People");

            migrationBuilder.DropColumn(
                name: "CreatedOn",
                table: "ParentsChildren");

            migrationBuilder.DropColumn(
                name: "ModifiedOn",
                table: "ParentsChildren");

            migrationBuilder.DropColumn(
                name: "CreatedOn",
                table: "Marriages");

            migrationBuilder.DropColumn(
                name: "ModifiedOn",
                table: "Marriages");

            migrationBuilder.RenameColumn(
                name: "CreatedOn",
                table: "People",
                newName: "LastUpdate");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastSyncCheck",
                table: "Users",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "LastVerified",
                table: "Position",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }
    }
}
