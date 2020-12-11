using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
	public class UserManager
	{
		Model1 model = new Model1();
		public Boolean checkUserName(string userName)
		{
			List<KhachHang> UserName = (from user in model.KhachHangs where user.Username == userName select user).ToList();
			if (UserName.Count == 1)
			{
				return false; 
			}
			return true;
		}

		public Boolean checkEmail(string email)
		{
			List<KhachHang> Email = (from user in model.KhachHangs where user.Email == email select user).ToList();
			if (Email.Count == 1)
			{
				return false;
			}
			return true;
		}

		public Boolean checkLogin(string username, string password)
		{
			Model1 model = new Model1();
			KhachHang customer = model.KhachHangs.SingleOrDefault(p => p.Username == username && p.MatKhau == password);
			if (customer != null)
			{
				return true;
			}
			return false;
		}
	}
}