namespace Cosmetic.Models.ViewModels
{
    public class DashboardCustomerViewModel
    {
        public List<Customer> Customers { get; set; }

        public int CurrentPage { get; set; }

        public int TotalPages { get; set; }
    }
}
