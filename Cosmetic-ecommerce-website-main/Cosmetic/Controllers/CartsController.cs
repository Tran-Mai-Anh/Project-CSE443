using System.Drawing;
using Cosmetic.Data;
using Cosmetic.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Cosmetic.Controllers
{
    public class CartsController : Controller
    {

        private readonly CosmeticContext _context;

        public CartsController(CosmeticContext context)
        {
            this._context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddProductToCart(long productId, string? productSize, int quantity)
        {
            string email = HttpContext.Session.GetString("UserEmail");
            Customer customer = await _context.Customer.Include(eachCustomer => eachCustomer.Cart).ThenInclude(eachCart => eachCart.CartItems).FirstOrDefaultAsync(eachCustomer => eachCustomer.Email == email);

            Product product = await _context.Product.Include(eachProduct => eachProduct.ProductVariants.Where(pv => pv.InStock > 0)).FirstOrDefaultAsync(eachProduct => eachProduct.Id == productId);

            Cart cart = customer.Cart;

            ProductVariant variant = null;

            if (string.IsNullOrEmpty(productSize))
            {
                variant = product.ProductVariants[0];
            }
            else
            {
                variant = product.ProductVariants.FirstOrDefault(eachProductVariant => eachProductVariant.Name == productSize);
            }

            productSize = variant.Name;
            double price = variant.Price;
            double totalPrice = price * quantity;
            double productDiscount = product.Discount;
            double finalPrice = totalPrice * ((100 - productDiscount) / 100);


            var existedItem = cart.CartItems.FirstOrDefault(eachCartItem => eachCartItem.ProductId == product.Id && eachCartItem.ProductSize == productSize);
            if (existedItem != null)
            {
                existedItem.Quantity += quantity;
                existedItem.TotalPrice += totalPrice;
                existedItem.FinalPrice += finalPrice;
            }
            else
            {
                CartItem cartItem = new CartItem(quantity, finalPrice, productDiscount, totalPrice, productSize, productId, product, customer.Cart.Id, customer.Cart);
                await _context.CartItems.AddAsync(cartItem);
            }


            await _context.SaveChangesAsync();
            int numberOfProducts = await _context.CartItems.CountAsync(ci => ci.CartId == cart.Id);
            return Json(new
            {
                success = true,
                quantity = numberOfProducts,
                message = "Added to cart successfully"
            });
        }

        [HttpPost]
        public async Task<IActionResult> ChangeQuantityCartItem(long cartItemId, int newQuantity, string productSize)
        {
            CartItem cartItem = await _context.CartItems.Include(ci => ci.Product).ThenInclude(p => p.ProductVariants.Where(pv => pv.Name == productSize)).FirstOrDefaultAsync(ci => ci.Id == cartItemId);
            Product product = cartItem.Product;
            ProductVariant productVariant = product.ProductVariants[0];
            double totalPrice = productVariant.Price * newQuantity;
            double productDiscount = product.Discount;
            double finalPrice = totalPrice * ((100 - productDiscount) / 100);
            double prevFinalPrice = cartItem.FinalPrice;
            double prevTotalPrice = cartItem.TotalPrice;
            cartItem.FinalPrice = finalPrice;
            cartItem.Quantity = newQuantity;
            cartItem.TotalPrice = totalPrice;
            cartItem.ProductDiscount = productDiscount;
            await _context.SaveChangesAsync();

            return Json(new
            {
                success = true,
                totalPrice,
                productPriceAfterDiscount = productVariant.Price * ((100 - productDiscount) / 100),
                productDiscount,
                finalPrice,
                productPrice = productVariant.Price,
                newFinalPrice = finalPrice - prevFinalPrice,
                newTotalPrice = totalPrice - prevTotalPrice,
            });
        }

        [HttpPost]
        public async Task<IActionResult> toggleCheckBoxCartItem(long cartItemId, bool isChecked,string productSize)
        {
            CartItem cartItem = await _context.CartItems.Include(ci => ci.Product).ThenInclude(p => p.ProductVariants.Where(pv => pv.Name == productSize)).FirstOrDefaultAsync(ci => ci.Id == cartItemId);
            Product product = cartItem.Product;
            ProductVariant productVariant = product.ProductVariants[0];
            double totalPrice = productVariant.Price * cartItem.Quantity;
            double productDiscount = product.Discount;
            double finalPrice = totalPrice * ((100 - productDiscount) / 100);

            return Json(new
            {
                success = true,
                finalPrice,
                totalPrice,
                productPriceAfterDiscount = productVariant.Price * ((100 - productDiscount) / 100),
                productDiscount,
                productPrice = productVariant.Price,
                newFinalPrice = isChecked ? finalPrice : -finalPrice,
                newTotalPrice = isChecked ? totalPrice : -totalPrice,
            });
        }


        [HttpPost]
        public IActionResult ReloadMiniCart()
        {
            return ViewComponent("MiniCart");
        }

    }
}
