using System.Threading.Tasks;
using Cosmetic.Data;
using Cosmetic.Models;
using Cosmetic.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.Controllers
{
    public class CustomerController : Controller
    {
        private readonly CosmeticContext _context;

        public CustomerController(CosmeticContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index(string section)
        {
            ViewBag.Section = section;
            var userEmail = HttpContext.Session.GetString("UserEmail");
            Customer customer = await _context.Customer.FirstOrDefaultAsync(c => c.Email == userEmail);
            return View(customer);
        }

        [HttpPost]
        public async Task<IActionResult> ChangeInforCustomer(EditCustomerViewModel editCustomerViewModel)
        {
            if (ModelState.IsValid)
            {
                var userEmail = HttpContext.Session.GetString("UserEmail");
                Customer customer = await _context.Customer.FirstOrDefaultAsync(c => c.Email == userEmail);
                customer.PhoneNumber = editCustomerViewModel.PhoneNumber;
                customer.Address = editCustomerViewModel.Address;
                customer.DateOfBirth = editCustomerViewModel.DoB;
                customer.Gender = editCustomerViewModel.Gender;
                customer.Name = editCustomerViewModel.Name;

                await _context.SaveChangesAsync();
                return Json(new
                {
                    success = true
                });
            }
            var fieldErrors = ModelState
    .Where(x => x.Value.Errors.Count > 0)
    .ToDictionary(
        kvp => kvp.Key,
        kvp => kvp.Value.Errors.First().ErrorMessage
    );

            return Json(new
            {
                success = false,
                fieldErrors
            });

        }


        [HttpGet]
        public IActionResult LoadSection(string section)
        {
            switch (section)
            {
                case "customerProfile":
                    return ViewComponent("CustomerProfile", new { mode = "default" });
                case "editProfile":
                    return ViewComponent("CustomerProfile", new { mode = "editProfile" });
                case "customerOrder":
                    return ViewComponent("Order");
                case "customerAddress":
                    return ViewComponent("AddressShipping");
                default:
                    return Content("Section not found.");
            }
        }
    }
}
