using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Cosmetic.Migrations
{
    /// <inheritdoc />
    public partial class BuildConstructors : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_AddressShipping_CustomerId",
                table: "AddressShipping");

            migrationBuilder.CreateIndex(
                name: "IX_AddressShipping_CustomerId",
                table: "AddressShipping",
                column: "CustomerId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_AddressShipping_CustomerId",
                table: "AddressShipping");

            migrationBuilder.CreateIndex(
                name: "IX_AddressShipping_CustomerId",
                table: "AddressShipping",
                column: "CustomerId",
                unique: true);
        }
    }
}
