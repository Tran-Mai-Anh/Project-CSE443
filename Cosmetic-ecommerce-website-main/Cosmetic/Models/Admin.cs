using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Cosmetic.Models
{
    public class Admin
    {
        [Key]
        public long Id { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string? Address { get; set; }

        public string PhoneNumber { get; set; }


        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Column(TypeName = "date")]
        public DateTime DateOfBirth { get; set; }

        public bool Gender { get; set; }
        public bool IsActive { get; set; }

        public List<string> Roles { get; set; }

        public long UserId { get; set; }

        public User User { get; set; }

        public Admin() { }

        public Admin(string name, string email, string password, string? address, string phoneNumber, DateTime dateOfBirth, bool gender, bool isActive, long userId, User user)
        {
            Name = name;
            Email = email;
            Password = password;
            Address = address;
            PhoneNumber = phoneNumber;
            DateOfBirth = dateOfBirth;
            Gender = gender;
            IsActive = isActive;
            this.Roles = new List<string> { "Admin" };
            UserId = userId;
            User = user;
        }
    }
}
