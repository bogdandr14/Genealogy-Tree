using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class updatedPreferences : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LanguagePreference",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "ThemePreference",
                table: "Users",
                newName: "ShareLocation");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ShareLocation",
                table: "Users",
                newName: "ThemePreference");

            migrationBuilder.AddColumn<string>(
                name: "LanguagePreference",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
