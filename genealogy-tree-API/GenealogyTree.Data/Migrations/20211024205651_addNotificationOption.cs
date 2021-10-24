using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class addNotificationOption : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_Locations_PlaceOfLivingId",
                table: "Users");

            migrationBuilder.DropForeignKey(
                name: "FK_Users_Religions_ReligionId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_PlaceOfLivingId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_ReligionId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PlaceOfLivingId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "ReligionId",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "Nationality",
                table: "Users",
                newName: "About");

            migrationBuilder.RenameColumn(
                name: "DateOfDeath",
                table: "Persons",
                newName: "DeathDate");

            migrationBuilder.RenameColumn(
                name: "DateOfBirth",
                table: "Persons",
                newName: "BirthDate");

            migrationBuilder.RenameColumn(
                name: "About",
                table: "Persons",
                newName: "Nationality");

            migrationBuilder.AddColumn<bool>(
                name: "NotifyBirthdays",
                table: "Users",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "NotifyUpdates",
                table: "Users",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "PlaceOfLivingId",
                table: "Persons",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ReligionId",
                table: "Persons",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Persons_PlaceOfLivingId",
                table: "Persons",
                column: "PlaceOfLivingId");

            migrationBuilder.CreateIndex(
                name: "IX_Persons_ReligionId",
                table: "Persons",
                column: "ReligionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Locations_PlaceOfLivingId",
                table: "Persons",
                column: "PlaceOfLivingId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Persons_Religions_ReligionId",
                table: "Persons",
                column: "ReligionId",
                principalTable: "Religions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Locations_PlaceOfLivingId",
                table: "Persons");

            migrationBuilder.DropForeignKey(
                name: "FK_Persons_Religions_ReligionId",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Persons_PlaceOfLivingId",
                table: "Persons");

            migrationBuilder.DropIndex(
                name: "IX_Persons_ReligionId",
                table: "Persons");

            migrationBuilder.DropColumn(
                name: "NotifyBirthdays",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "NotifyUpdates",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PlaceOfLivingId",
                table: "Persons");

            migrationBuilder.DropColumn(
                name: "ReligionId",
                table: "Persons");

            migrationBuilder.RenameColumn(
                name: "About",
                table: "Users",
                newName: "Nationality");

            migrationBuilder.RenameColumn(
                name: "Nationality",
                table: "Persons",
                newName: "About");

            migrationBuilder.RenameColumn(
                name: "DeathDate",
                table: "Persons",
                newName: "DateOfDeath");

            migrationBuilder.RenameColumn(
                name: "BirthDate",
                table: "Persons",
                newName: "DateOfBirth");

            migrationBuilder.AddColumn<int>(
                name: "PlaceOfLivingId",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "ReligionId",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Users_PlaceOfLivingId",
                table: "Users",
                column: "PlaceOfLivingId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_ReligionId",
                table: "Users",
                column: "ReligionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Locations_PlaceOfLivingId",
                table: "Users",
                column: "PlaceOfLivingId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Religions_ReligionId",
                table: "Users",
                column: "ReligionId",
                principalTable: "Religions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
