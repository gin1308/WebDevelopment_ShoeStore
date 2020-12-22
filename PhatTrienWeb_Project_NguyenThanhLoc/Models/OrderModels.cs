using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
	public class OrderModels
	{
		[Required]
		public string ShipName { get; set; }
		[Required]
		[MaxLength(11, ErrorMessage = "Please enter a valid phone number, it must be 11 numbers.")]
		public string ShipTel { get; set; }
		[Required]
		public string ShipAddress { get; set; }

		public int total { get; set; }
	}
}