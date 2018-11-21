using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Website.Models;
namespace Website.Controllers
{
    public class HomeController : Controller
    {
        VanShopEntities db = new VanShopEntities();
        public ActionResult Index()
        {
            IEnumerable<SanPham> listNam= db.SanPhams.Include("Nhomsp")
                                                    .Where(m => m.Nhomsp.PhanLoaiID == 2)
                                                    .OrderBy(m => m.NgayCapNhat).Take(4).AsEnumerable();
            ViewBag.listNam = listNam;
            IEnumerable<SanPham> listNu= db.SanPhams.Include("Nhomsp")
                                                    .Where(m => m.Nhomsp.PhanLoaiID == 1
                                                    )
                                                    .OrderBy(m => m.NgayCapNhat).Take(4).AsEnumerable();
            ViewBag.listNu = listNu;
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact(string messeageSuccess, string messeageError)
        {
           
            return View();
        }
        public ActionResult _MenuPartial()
        {
            ViewBag.Search= Request["txtSearch"];
            ViewBag.NhomspNam = db.Nhomsps.Where(m => m.PhanLoaiID == 2).ToList();
            ViewBag.NhomspNu = db.Nhomsps.Where(m => m.PhanLoaiID == 1).ToList();
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LienHe(FormCollection frm)
        {
            try
            {
                HopThu hopthu_new = new HopThu()
                {
                    Hoten = frm["txtName"].ToString(),
                    Email = frm["txtEmail"].ToString(),
                    SDT=frm["txtSDT"].ToString(),
                    TieuDe = frm["txtTieude"].ToString(),
                    NoiDung = frm["txtNoidung"].ToString(),
                    NgayCapNhat = DateTime.Now.Date,
                    DaDoc=false
                };
                db.HopThus.Add(hopthu_new);
                db.SaveChanges();
                return RedirectToAction("Contact", new { messeageSuccess = "Gửi phải hồi thành công. Cảm ơn bạn" });
            }
            catch
            {
                return RedirectToAction("Contact", new { messeageError = "Xảy ra lỗi. Gửi thất bại" });
            }
        }
    }
}