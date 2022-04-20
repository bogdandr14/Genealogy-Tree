using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GenealogyTree.Data.Migrations
{
    public partial class addedUserPosition : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SyncRequests");

            migrationBuilder.DropTable(
                name: "Syncs");

            migrationBuilder.AddColumn<int>(
                name: "PositionId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Position",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Latitude = table.Column<float>(type: "real", nullable: false),
                    Longitude = table.Column<float>(type: "real", nullable: false),
                    LastVerified = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Position", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Relatives",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PrimaryUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RelativeUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RelativePersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Relatives", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Relatives_People_RelativePersonInPrimaryTreeId",
                        column: x => x.RelativePersonInPrimaryTreeId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Relatives_Users_PrimaryUserId",
                        column: x => x.PrimaryUserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Relatives_Users_RelativeUserId",
                        column: x => x.RelativeUserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Requests",
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
                    table.PrimaryKey("PK_Requests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Requests_People_ReceiverReferenceInSenderTreeId",
                        column: x => x.ReceiverReferenceInSenderTreeId,
                        principalTable: "People",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Requests_Users_ReceiverId",
                        column: x => x.ReceiverId,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Requests_Users_SenderId",
                        column: x => x.SenderId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Users_PositionId",
                table: "Users",
                column: "PositionId");

            migrationBuilder.CreateIndex(
                name: "IX_Relatives_PrimaryUserId",
                table: "Relatives",
                column: "PrimaryUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Relatives_RelativePersonInPrimaryTreeId",
                table: "Relatives",
                column: "RelativePersonInPrimaryTreeId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Relatives_RelativeUserId",
                table: "Relatives",
                column: "RelativeUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Requests_ReceiverId",
                table: "Requests",
                column: "ReceiverId");

            migrationBuilder.CreateIndex(
                name: "IX_Requests_ReceiverReferenceInSenderTreeId",
                table: "Requests",
                column: "ReceiverReferenceInSenderTreeId");

            migrationBuilder.CreateIndex(
                name: "IX_Requests_SenderId",
                table: "Requests",
                column: "SenderId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Position_PositionId",
                table: "Users",
                column: "PositionId",
                principalTable: "Position",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_Position_PositionId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "Position");

            migrationBuilder.DropTable(
                name: "Relatives");

            migrationBuilder.DropTable(
                name: "Requests");

            migrationBuilder.DropIndex(
                name: "IX_Users_PositionId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PositionId",
                table: "Users");

            migrationBuilder.CreateTable(
                name: "SyncRequests",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ReceiverId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ReceiverReferenceInSenderTreeId = table.Column<int>(type: "int", nullable: false),
                    ReceiverResponded = table.Column<bool>(type: "bit", nullable: false),
                    Response = table.Column<bool>(type: "bit", nullable: false),
                    SenderId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
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
                    SyncedPersonInPrimaryTreeId = table.Column<int>(type: "int", nullable: false),
                    SyncedUserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
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
        }
    }
}
