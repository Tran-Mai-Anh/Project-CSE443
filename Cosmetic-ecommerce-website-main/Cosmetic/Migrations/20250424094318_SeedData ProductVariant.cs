using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace Cosmetic.Migrations
{
    /// <inheritdoc />
    public partial class SeedDataProductVariant : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "ProductVariant",
                columns: new[] { "Id", "InStock", "Name", "Price", "ProductId" },
                values: new object[,]
                {
                    { 1L, 120, "12ml", 56.0, 6L },
                    { 2L, 80, "18ml", 80.0, 6L },
                    { 3L, 50, "24ml", 100.0, 6L },
                    { 4L, 100, "10g", 35.0, 7L },
                    { 5L, 75, "15g", 52.0, 7L },
                    { 6L, 75, "20g", 65.0, 7L },
                    { 7L, 70, "8g", 30.0, 8L },
                    { 8L, 50, "12g", 45.0, 8L },
                    { 9L, 30, "15g", 55.0, 8L },
                    { 10L, 80, "5ml", 22.0, 9L },
                    { 11L, 70, "10ml", 35.0, 9L },
                    { 12L, 50, "15ml", 50.0, 9L },
                    { 13L, 60, "6ml", 20.0, 10L },
                    { 14L, 50, "10ml", 32.0, 10L },
                    { 15L, 40, "12ml", 40.0, 10L },
                    { 16L, 100, "3ml", 15.0, 11L },
                    { 17L, 100, "5ml", 25.0, 11L },
                    { 18L, 80, "8ml", 35.0, 11L },
                    { 19L, 110, "10ml", 53.0, 12L },
                    { 20L, 80, "15ml", 75.0, 12L },
                    { 21L, 60, "20ml", 90.0, 12L },
                    { 22L, 100, "3g", 20.0, 13L },
                    { 23L, 80, "5g", 30.0, 13L },
                    { 24L, 70, "8g", 40.0, 13L },
                    { 25L, 90, "12ml", 72.0, 14L },
                    { 26L, 80, "18ml", 95.0, 14L },
                    { 27L, 80, "24ml", 120.0, 14L },
                    { 28L, 40, "30ml", 45.0, 15L },
                    { 29L, 30, "50ml", 75.0, 15L },
                    { 30L, 30, "100ml", 120.0, 15L },
                    { 31L, 40, "15g", 62.0, 16L },
                    { 32L, 30, "25g", 90.0, 16L },
                    { 33L, 30, "35g", 115.0, 16L },
                    { 34L, 20, "30ml", 80.0, 17L },
                    { 35L, 15, "50ml", 115.0, 17L },
                    { 36L, 15, "100ml", 165.0, 17L },
                    { 37L, 150, "Standard", 25.0, 18L },
                    { 38L, 100, "30ml", 15.0, 19L },
                    { 39L, 80, "60ml", 25.0, 19L },
                    { 40L, 70, "100ml", 40.0, 19L },
                    { 41L, 50, "Standard", 95.0, 20L },
                    { 42L, 150, "Small", 5.0, 21L },
                    { 43L, 120, "Medium", 8.0, 21L },
                    { 44L, 80, "Large", 12.0, 21L },
                    { 45L, 20, "5ml", 15.0, 22L },
                    { 46L, 15, "10ml", 25.0, 22L },
                    { 47L, 15, "15ml", 35.0, 22L },
                    { 48L, 20, "15g", 92.0, 23L },
                    { 49L, 15, "20g", 120.0, 23L },
                    { 50L, 15, "25g", 145.0, 23L }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 2L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 3L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 4L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 5L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 6L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 7L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 8L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 9L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 10L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 11L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 12L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 13L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 14L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 15L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 16L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 17L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 18L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 19L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 20L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 21L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 22L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 23L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 24L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 25L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 26L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 27L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 28L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 29L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 30L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 31L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 32L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 33L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 34L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 35L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 36L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 37L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 38L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 39L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 40L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 41L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 42L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 43L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 44L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 45L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 46L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 47L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 48L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 49L);

            migrationBuilder.DeleteData(
                table: "ProductVariant",
                keyColumn: "Id",
                keyValue: 50L);
        }
    }
}
