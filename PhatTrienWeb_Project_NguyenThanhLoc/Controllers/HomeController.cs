using PhatTrienWeb_Project_NguyenThanhLoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			Model1 model1 = new Model1();
			List<SanPham> SanPhams = model1.SanPhams.ToList();
			return View(SanPhams);
		}

		public ActionResult About()
		{
			ViewBag.Message = "Your application description page.";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}

		public ActionResult Category()
		{
			Model1 model1 = new Model1();
			List<LoaiSP> loaiSPs = model1.LoaiSPs.ToList();
			return PartialView(loaiSPs);
		}
	}
}