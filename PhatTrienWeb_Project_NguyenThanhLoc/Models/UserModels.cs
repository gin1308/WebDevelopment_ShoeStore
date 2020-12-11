using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
	public class RegisterModel
	{
		[Required]
		public string UserName { get; set; }

		[Required]
		[EmailAddress]
		public string Email { get; set; }

		[Required]
		[MinLength(6, ErrorMessage = "Password must be at least 6 characters long.")]
		public string Password { get; set; }

		[Required]
		[Compare("Password", ErrorMessage = "Does not match password field.")]
		public string ConfirmPassword { get; set; }

		[Required]
		public string FullName { get; set; }

		[Required]
		public DateTime DateOfBirth { get; set; }

		[Required]
		[MaxLength(11, ErrorMessage = "Please enter a valid phone number. It must be 11 numbers.")]
		public string PhoneNumber { get; set; }

		[Required]
		public string Address { get; set; }
	}

	public class LoginModel
	{
		[Required]
		public string Username { get; set; }

		[Required]
		public string Password { get; set; }
	}
}