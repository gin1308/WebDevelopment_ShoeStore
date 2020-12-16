using PhatTrienWeb_Project_NguyenThanhLoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Web.Script.Serialization;

namespace PhatTrienWeb_Project_NguyenThanhLoc.Controllers
{
	public class CartController : Controller
	{
		private const string CartSession = "CartSession";
		// GET: Cart
		public ActionResult Index()
		{
			var cart = Session["CartSession"];
			var list = new List<Item>();
			if (cart != null)
			{
				list = (List<Item>)cart;
			}
			return View(list);
		}

		public ActionResult AddItem(int productID, int quantity)
		{
			Model1 db = new Model1();
			var cart = Session["CartSession"];
			var product = db.SanPhams.Where(x => x.MaSP == productID).FirstOrDefault();
			if (cart != null)
			{
				var list = (List<Item>)cart;
				if (list.Exists(x => x.Product.MaSP == productID))
				{
					foreach (var item in list)
					{
						if (item.Product.MaSP == productID)
						{
							item.Quantity += quantity;
						}
					}
				}
				else
				{
					var item = new Item
					{
						Product = product,
						Quantity = quantity
					};
					list.Add(item);
				}
				Session[CartSession] = list;
			}
			else
			{
				var item = new Item
				{
					Product = product,
					Quantity = quantity
				};

				var list = new List<Item>
				{
					item
				};
				Session[CartSession] = list;
			}
			return RedirectToAction("Index");
		}

		public ActionResult CartInfor()
		{
			Model1 model1 = new Model1();

			var cart = Session["CartSession"];
			var list = new List<Item>();
			if (cart != null)
			{
				list = (List<Item>)cart;
			}
			return PartialView(list);
		}

		public JsonResult Update(string cartModel)
		{
			var jsonCart = new JavaScriptSerializer().Deserialize<List<Item>>(cartModel);
			var sessionCart = (List<Item>)Session["CartSession"];
			foreach (var item in sessionCart)
			{
				var jsonItem = jsonCart.SingleOrDefault(x => x.Product.MaSP == item.Product.MaSP);
				if (jsonItem != null)
				{
					item.Quantity = jsonItem.Quantity;
				}
			}
			Session["CartSession"] = sessionCart;
			return Json(new
			{
				status = true
			});
		}

		//public JsonResult DeleteItem(int productID)
		//{
		//	var sessionCart = (List<Item>)Session["CartSession"];
		//	Session["CartSession"] = sessionCart;
		//	sessionCart.RemoveAll(x => x.Product.MaSP == productID);
		//	return Json(new
		//	{
		//		status = true, 
		//	}, JsonRequestBehavior.AllowGet);
		//}

		public ActionResult DeleteItem(int productID)
		{
			List<Item> cart = (List<Item>)Session["CartSession"];
			int index = IsExist(productID);
			cart.RemoveAt(index);
			Session["CartSession"] = cart;
			return RedirectToAction("Index");
		}

		public JsonResult DeleteAll(string cartModel)
		{
			Session["CartSession"] = null;
			return Json(new
			{
				status = true
			});
		}

		private int IsExist(int productID)
		{
			List<Item> cart = (List<Item>)Session["CartSession"];
			for (int i = 0; i < cart.Count; i++)
				if (cart[i].Product.MaSP.Equals(productID))
				{
					return i;
				}
			return -1;
		}

		public ActionResult Payment()
		{
			if (Session["Haha"] != null)
			{
				var cart = Session["CartSession"];
				var list = new List<Item>();
				if (cart != null)
				{
					list = (List<Item>)cart;
				}
				return View(list);
			}
			else
			{
				return View("Fail");
			}
		}
		[HttpPost]
		public ActionResult Payment(OrderModels model)
		{
			if (Session["Haha"] != null)
			{
				List<Item> cart = Session["CartSession"] as List<Item>;
				Model1 db = new Model1();

				Order order = new Order
				{
					NgayTao = DateTime.Now,
					TenKH_Ship = model.ShipName,
					SoDT_Ship = model.ShipTel,
					DiaChi_Ship = model.ShipAddress,
				};
				db.Orders.Add(order);
				db.SaveChanges();

				foreach (Item item in cart)
				{
					ChiTietOrder orderDetail = new ChiTietOrder
					{
						Order_ID = order.ID,
						MaSP = item.Product.MaSP,
						SoLuong = item.Quantity,
						Gia = item.Product.Gia * item.Quantity,
					};
					db.ChiTietOrders.Add(orderDetail);
					db.SaveChanges();
				}
				Session.Remove(CartSession);
				return View("OrderStatus");
			}
			else
			{

				return View("Fail");
			}
		}
	}
}