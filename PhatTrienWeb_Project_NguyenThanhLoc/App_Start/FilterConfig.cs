using System.Web;
using System.Web.Mvc;

namespace PhatTrienWeb_Project_NguyenThanhLoc
{
	public class FilterConfig
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			filters.Add(new HandleErrorAttribute());
		}
	}
}
