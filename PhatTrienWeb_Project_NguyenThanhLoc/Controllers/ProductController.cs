using PhatTrienWeb_Project_NguyenThanhLoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

		public ActionResult Detail(int MaSP)
		{
			Model1 model1 = new Model1();
			SanPham detail = model1.SanPhams.Where(x => x.MaSP == MaSP).SingleOrDefault();
			return View(detail);
		}

		public ActionResult ProductCategory(int MaSP)
		{
			Model1 model1 = new Model1();
			List<SanPham> ProductCategory = model1.SanPhams.Where(p => p.MaLoai == MaSP).ToList();
			return View(ProductCategory);
		}	
	}
}