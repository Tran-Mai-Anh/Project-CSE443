using System.ComponentModel.DataAnnotations;

namespace Cosmetic.Models
{
    public class User
    {
        [Key]
        public long Id { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public List<string> Roles { get; set; }

        public Customer Customer { get; set; }

        public Admin Admin { get; set; }

        public User() { }

        public User(string Email, string Password)
        {
            this.Email = Email;
            this.Password = Password;
            this.Roles = new List<string> { "Customer" };
        }



    }
}
