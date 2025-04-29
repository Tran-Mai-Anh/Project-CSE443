using Cosmetic.Data;
using Microsoft.EntityFrameworkCore;
using Cosmetic.Models;
using Cosmetic.Enums;

var builder = WebApplication.CreateBuilder(args);

// Database configuration
builder.Services.AddDbContext<CosmeticContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnectionString")));



// Add services to the container
builder.Services.AddControllersWithViews();

// FL - Configure Session
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
// End FL - Configure Session 

builder.Services.AddRazorPages();
builder.Services.AddLogging();

var app = builder.Build();



// Use session
app.UseSession();

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
else
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

app.MapRazorPages();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
