using PhatTrienWeb_Project_NguyenThanhLoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

		public ActionResult Register()
		{
			return View();
		}
		[HttpPost]
		public ActionResult Register(RegisterModel model)
		{
			if (ModelState.IsValid)
			{
				Model1 model1 = new Model1();
				UserManager manager = new UserManager();
				if (manager.checkUserName(model.UserName) && manager.checkEmail(model.Email))
				{
					KhachHang user = new KhachHang
					{
						Username = model.UserName,
						Email = model.Email,
						MatKhau = Encrypt.MD5Hash(model.Password),
						TenKH = model.FullName,
						DoB = model.DateOfBirth,
						SoDT = model.PhoneNumber,
						DiaChi = model.Address
					};
					model1.KhachHangs.Add(user);
					model1.SaveChanges();
					return RedirectToAction("Login", "User"); //View("Success");
				}
				else
				{
					ModelState.AddModelError("Register", "Username or Email are existed.");
					return View("");
				}
			}
			return View();
		}

		public ActionResult Login()
		{
			return View();
		}
		[HttpPost]
		public ActionResult Login(LoginModel model)
		{
			Model1 model1 = new Model1();
			UserManager manager = new UserManager();	
			
			if (ModelState.IsValid)
			{
				if (manager.checkLogin(model.Username, Encrypt.MD5Hash(model.Password)))
				{
					Session["Haha"] = model.Username;
 					return RedirectToAction("Index", "Home");
				}
				else
				{
					ModelState.AddModelError("Login", "Username or Password is wrong, please try again!");
					return View();
				}
			}
			return View();
		}

		public ActionResult Logout()
		{
			Session["Haha"] = null;
			return RedirectToAction("Index", "Home");
		}
	}
}