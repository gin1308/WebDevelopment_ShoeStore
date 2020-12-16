using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
	public class Item
	{
		public KhachHang Customer { get; set; }

		public SanPham Product { get; set; } 

		public int Quantity { get; set; }
	}
}