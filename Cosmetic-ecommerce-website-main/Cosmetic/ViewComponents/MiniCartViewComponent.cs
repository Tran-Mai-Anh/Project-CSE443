using Cosmetic.Data;
using Cosmetic.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.ViewComponents
{
    public class MiniCartViewComponent : ViewComponent
    {
        private readonly CosmeticContext _context;

        public MiniCartViewComponent(CosmeticContext context)
        {
            this._context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            string email = HttpContext.Session.GetString("UserEmail");

            Customer customer = await _context.Customer.Include(eachCustomer => eachCustomer.Cart).ThenInclude(eachCart => eachCart.CartItems).FirstOrDefaultAsync(eachCustomer => eachCustomer.Email == email);

            return View(customer.Cart);

        }
    }
}
