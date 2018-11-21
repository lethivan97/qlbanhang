using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Models;
namespace Website.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class HomeController : Controller
    {
        VanShopEntities db = new VanShopEntities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            ViewBag.lstSanPham = db.SanPhams.OrderByDescending(m => m.NgayCapNhat).Take(5);
            ViewBag.lstDatHang = db.DatHangs.OrderByDescending(m => m.NgayGiao).Take(5);
            ViewBag.lstNhomSP = db.Nhomsps.Take(5);
            ViewBag.lstHopThu = db.HopThus.OrderByDescending(m => m.NgayCapNhat).Take(5);
            return View();
        }
    }
}