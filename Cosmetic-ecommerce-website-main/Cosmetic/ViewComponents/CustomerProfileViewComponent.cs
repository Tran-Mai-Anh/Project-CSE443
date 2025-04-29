using Cosmetic.Data;
using Cosmetic.Models;
using Cosmetic.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.ViewComponents
{
    public class CustomerProfileViewComponent : ViewComponent
    {
        private readonly CosmeticContext _context;

        public CustomerProfileViewComponent(CosmeticContext context)
        {
            this._context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync(string mode = "default", EditCustomerViewModel tempEditCustomer = null)
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");

            Customer customer = await _context.Customer.Include(eachCustomer => eachCustomer.Rank).AsNoTracking().FirstOrDefaultAsync(eachCustomer => eachCustomer.Email == userEmail);
            EditCustomerViewModel editCustomer = null;
            if(tempEditCustomer == null)
            {
                editCustomer = new EditCustomerViewModel
                {
                    Name = customer.Name,
                    Address = customer.Address,
                    PhoneNumber = customer.PhoneNumber,
                    DoB = customer.DateOfBirth,
                    Email = customer.Email,
                    Gender = customer.Gender
                };
            }
            else
            {
                editCustomer = new EditCustomerViewModel { 
                    Name = tempEditCustomer.Name,
                    Address = tempEditCustomer.Address,
                    PhoneNumber = tempEditCustomer.PhoneNumber,
                    DoB = tempEditCustomer.DoB,
                    Email = tempEditCustomer.Email,
                    Gender = tempEditCustomer.Gender
                };
            }
            if (mode == "editProfile")
            {
                return View("EditProfile", editCustomer);
            }
            if (mode == "changePassword")
            {
                return View("ChangePassword", editCustomer);
            }

            return View("Default", customer);

        }
    }
}
