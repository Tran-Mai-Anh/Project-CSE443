using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Cosmetic.Data;
using Microsoft.AspNetCore.Identity;
using System.Diagnostics;
using System.Collections.Generic;
using System;
using Cosmetic.Models;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Http;
using Cosmetic.Helper;
using Cosmetic.Models.ViewModels;
using Cosmetic.DTO.Cart;
using Cosmetic.DTO.CartItem;
using Cosmetic.DTO.Product;
using Cosmetic.DTO.ProductVariant;

namespace Cosmetic.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly CosmeticContext _context;

        private readonly PasswordService passwordService = new PasswordService();

        public HomeController(ILogger<HomeController> logger, CosmeticContext context)
        {
            _logger = logger;
            _context = context;
        }


        // Done
        public async Task<IActionResult> Index()
        {
            List<string> categoryMenu = new List<string> { "Eyes", "Face", "Lips" };

            List<Product> products = await _context.Product
                                   .Where(eachProduct => (categoryMenu.Contains(eachProduct.Category.Name) && eachProduct.IsAvailable && eachProduct.ProductVariants.Any(productVariant => productVariant.InStock > 0)))
                                   .Include(eachProduct => eachProduct.ProductVariants.Where(eachProductVariant => eachProductVariant.InStock > 0))
                                   .ToListAsync();

            List<Product> productsHasPriceUnder50 = await _context.Product
                                                                    .Where(eachProduct =>
                                                                            categoryMenu.Contains(eachProduct.Category.Name) &&
                                                                            eachProduct.IsAvailable &&
                                                                            eachProduct.ProductVariants.Any(productVariant => productVariant.InStock > 0 && productVariant.Price <= 50)
                                                                          )
                                                                    .Include(eachProduct => eachProduct.ProductVariants.Where(eachProductVariant =>
                                                                             eachProductVariant.InStock > 0 && eachProductVariant.Price <= 50
                                                                            ))
                                                    .ToListAsync();

            return View(new ProductIndexViewModel
            {
                products = products,
                productsHasPriceUnder50 = productsHasPriceUnder50
            });
        }

        // Done
        public IActionResult Register() => View();

        // Done
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel registerViewModel)
        {
            if (ModelState.IsValid)
            {
                var email = registerViewModel.Email;
                var name = registerViewModel.Name;
                var password = registerViewModel.Password;
                var confirmPassword = registerViewModel.ConfirmPassword;
                var DoB = registerViewModel.DoB;
                var gender = registerViewModel.Gender;
                var address = registerViewModel.Address;
                var phoneNumber = registerViewModel.PhoneNumber;
                var existingCustomer = await _context.Customer
                                                     .FirstOrDefaultAsync(c => c.Email == email);
                if (existingCustomer != null)
                {
                    ModelState.AddModelError("", "Email is already in use");
                    return View(registerViewModel);
                }

                if (password != confirmPassword)
                {
                    ModelState.AddModelError("", "Password does not match");
                    return View(registerViewModel);
                }

                if (DateTime.Today <= DoB)
                {
                    ModelState.AddModelError("", "Invalid Date");
                    return View(registerViewModel);
                }
                var encriptedPassword = passwordService.HashPassword(password);
                User user = new User(email, encriptedPassword);
                await _context.User.AddAsync(user);
                await _context.SaveChangesAsync();
                Rank rank = await _context.Rank.FirstOrDefaultAsync(eachRank => eachRank.Id == 1);
                Customer customer = new Customer(name, email, encriptedPassword, address, phoneNumber, DoB, gender, user.Id, user, rank.Id, rank);
                await _context.Customer.AddAsync(customer);
                await _context.SaveChangesAsync();

                Cart cart = new Cart(customer.Id, customer);
                await _context.Cart.AddAsync(cart);
                await _context.SaveChangesAsync();

                customer.Cart = cart;
                TempData["RegisterSuccessMessage"] = "Registration successful! You can now log in.";

                return RedirectToAction("Register");
            }

            return View(registerViewModel);
        }

        // Done
        public IActionResult Login(string? returnURL)
        {
            HttpContext.Session.Clear();
            ViewBag.ReturnURL = returnURL;
            Console.WriteLine(returnURL + " Hehehe");
            return View();
        }


        // Done
        [HttpPost]
        public IActionResult Login(LoginViewModel loginViewModel, string? returnURL)
        {

            if (ModelState.IsValid)
            {
                var email = loginViewModel.Email;
                var password = loginViewModel.Password;
                User user = _context.User.FirstOrDefault(eachUser => eachUser.Email == email);
                if (user == null)
                {
                    ModelState.AddModelError("", "Email does not exist");
                    return View(loginViewModel);
                }
                bool isValid = passwordService.VerifyPassword(user.Password, password);
                if (!isValid)
                {
                    ModelState.AddModelError("", "Password is not correct");
                    return View(loginViewModel);
                }

                HttpContext.Session.SetString("UserEmail", email);
                TempData["LoginSuccess"] = "Successful";
                if (!string.IsNullOrEmpty(returnURL))
                {
                    return Redirect(returnURL);
                }
                return RedirectToAction("Index", "Home");
            }

            return View(loginViewModel);

        }


        // Done
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("UserEmail");
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }


        [HttpGet]
        [Route("home/category")]
        public async Task<IActionResult> Category(int? categoryId, string orderby, double? minPrice, double? maxPrice, string searchQuery)
        {
            if (categoryId.HasValue)
            {
                var category = await _context.Category
                                              .FirstOrDefaultAsync(c => c.Id == categoryId.Value && c.Status);
                if (category == null)
                {
                    return Content("Invalid category!");
                }
            }

            var query = _context.Product.Where(p => p.IsAvailable && p.InStock > 0 && p.ProductVariants.Any(pv => pv.InStock > 0));

            if (categoryId.HasValue)
            {
                query = query.Where(p => p.CategoryId == categoryId.Value);
            }

            if (minPrice.HasValue && maxPrice.HasValue)
            {
                query = query.Where(p => p.ProductVariants.Any(pv => pv.Price >= minPrice && pv.Price <= maxPrice && pv.InStock > 0));

            }

            if (!string.IsNullOrEmpty(searchQuery))
            {
                query = query.Where(p => p.Name.Contains(searchQuery) || p.Category.Name.Contains(searchQuery));
            }

            if (orderby == "alphabet-asc")
            {
                query = query.OrderBy(p => p.Name);
            }
            else if (orderby == "alphabet-desc")
            {
                query = query.OrderByDescending(p => p.Name);
            }

            var productList = await query.Include(p => p.ProductVariants.Where(pv => pv.InStock > 0)).AsSplitQuery().ToListAsync();

            ViewBag.SelectedCategoryId = categoryId;
            ViewBag.Categories = await _context.Category.Where(c => c.Status).ToListAsync();
            ViewBag.OrderBy = orderby;
            ViewBag.MinPrice = minPrice;
            ViewBag.MaxPrice = maxPrice;
            ViewBag.SearchQuery = searchQuery;

            return View(productList);
        }


        // Done
        public async Task<IActionResult> ProductDetail(int id, string size, int quantity)
        {
            Product? product = await _context.Product
                .Include(p => p.Category)
                .Include(p => p.ProductVariants.Where(pv => pv.InStock > 0))
                .FirstOrDefaultAsync(p => p.Id == id);

            if (product == null)
            {
                return NotFound();
            }

            List<Product> relatedProducts = await _context.Product
                .Where(p => p.Category.Name == product.Category.Name && p.ProductVariants.Any(pv => pv.InStock > 0))
                .Include(p => p.ProductVariants.Where(pv => pv.InStock > 0))
                .ToListAsync();


            return View(new ProductDetailViewModel(product, size, quantity, relatedProducts, product.ProductVariants));
        }
        public async Task<IActionResult> ShoppingCart(long cartId)
        {


            var shippingCartDTO = await _context.Cart
                .Where(cart => cart.Id == cartId)
                .Include(cart => cart.Customer)
                .ThenInclude(c => c.AddressShippings.Where(addShip => addShip.IsDefaultAddress))
                .Select(cart => new ShippingCartDTO
                {
                    Id = cart.Id,
                    cartItems = cart.CartItems.Select(ci => new ShippingCartItemDTO
                    {
                        Id = ci.Id,
                        FinalPrice = ci.Product.ProductVariants.Where(pv => pv.Name == ci.ProductSize)
                                                                .Select(pv => ((pv.Price * ci.Quantity) * ((100 - ci.Product.Discount) / 100)))
                                                                .FirstOrDefault(),
                        ProductDiscount = ci.Product.Discount,
                        ProductSize = ci.ProductSize,
                        Quantity = ci.Quantity,
                        Status = ci.Status,
                        TotalPrice = ci.Product.ProductVariants.Where(pv => pv.Name == ci.ProductSize)
                                                                .Select(pv => (pv.Price * ci.Quantity))
                                                                .FirstOrDefault(),
                        Product = new ShippingProductDTO
                        {
                            Id = ci.Product.Id,
                            Discount = ci.Product.Discount,
                            Image = ci.Product.Image,
                            IsAvailable = ci.Product.IsAvailable,
                            Name = ci.Product.Name,
                            ProductVariant = ci.Product.ProductVariants
                                                .Where(pv => pv.Name == ci.ProductSize)
                                                .Select(pv => new ShippingProductVariantDTO
                                                {
                                                    Id = pv.Id,
                                                    InStock = pv.InStock,
                                                    Name = pv.Name,
                                                    Price = pv.Price,
                                                }).FirstOrDefault()
                        }
                    }).ToList(),
                    AddressShipping = cart.Customer.AddressShippings.Count() > 0 ? cart.Customer.AddressShippings[0] : null,
                }).FirstOrDefaultAsync();


            return View(shippingCartDTO);
        }
        public IActionResult CheckOut() => View();
        public IActionResult AboutUs() => View();

        [HttpGet]
        [Route("home/compare/{productId}")]
        public async Task<IActionResult> Compare(int productId)
        {
            var selectedProduct = await _context.Product
                                          .Include(p => p.Category)
                                          .Include(p => p.ProductVariants.Where(pv => pv.InStock > 0))
                                          .FirstOrDefaultAsync(p => p.Id == productId);

            if (selectedProduct == null)
            {
                return NotFound();
            }

            var relatedProducts = await _context.Product
                                          .Where(p => p.CategoryId == selectedProduct.CategoryId && p.Id != selectedProduct.Id && p.ProductVariants.Any(pv => pv.InStock > 0))
                                          .Include(p => p.ProductVariants.Where(pv => pv.InStock > 0))
                                          .OrderBy(r => Guid.NewGuid())
                                          .Take(3)
                                          .ToListAsync();

            ViewData["SelectedProduct"] = selectedProduct;
            ViewData["RelatedProducts"] = relatedProducts;

            return View();
        }


    }
}
