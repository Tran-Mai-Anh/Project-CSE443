using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Cosmetic.Migrations
{
    /// <inheritdoc />
    public partial class ChangeCreatedTimeofCategorytoCreateTime : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CreatedTime",
                table: "Category",
                newName: "CreateTime");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CreateTime",
                table: "Category",
                newName: "CreatedTime");
        }
    }
}
