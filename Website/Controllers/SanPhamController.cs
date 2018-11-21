using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Website.Models;
using PagedList;
using PagedList.Mvc;
namespace Website.Controllers
{
    public class SanPhamController : Controller
    {
        private VanShopEntities db = new VanShopEntities();
        // GET: SanPham
        public ActionResult Detail(int? id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            var sp = db.SanPhams.Find(id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.spCungLoai = db.SanPhams.Where(m => m.NhomspID == sp.NhomspID).Take(4).ToList();
            ViewBag.NhomspNam = db.Nhomsps.Where(m => m.PhanLoaiID == 2).ToList();
            ViewBag.NhomspNu = db.Nhomsps.Where(m => m.PhanLoaiID == 1).ToList();
            return View("Detail", sp);
        }
        public ActionResult SanPhamTheoPhanLoai(int? phanLoaiId, int? page)
        {
            ViewBag.NhomspNam = db.Nhomsps.Where(m => m.PhanLoaiID == 2).ToList();
            ViewBag.NhomspNu = db.Nhomsps.Where(m => m.PhanLoaiID == 1).ToList();
            IEnumerable<SanPham> list = null;
            if (phanLoaiId == null)
            {
                return HttpNotFound();
            }
            else
            {
                list = db.SanPhams.Where(m => m.Nhomsp.PhanLoaiID == phanLoaiId).OrderByDescending(m => m.SanPhamID).AsEnumerable().ToPagedList(page ?? 1, 12);
            }
            return View(list);
        }

        public ActionResult SanPhamTheoNhomSP(int? nhomSanPhamID,int ? page)
        {
            ViewBag.TenNhomSP = db.Nhomsps.Find(nhomSanPhamID).TenNhomsp;
            IEnumerable<SanPham> list = null;
            list = db.SanPhams.Where(m => m.NhomspID == nhomSanPhamID).OrderByDescending(m => m.SanPhamID).AsEnumerable().ToPagedList(page ?? 1, 12); ;
            return View("SanPhamTheoNhomSP", list);
        }

        public ActionResult Search(string txtSearch)
        {
            IEnumerable<SanPham> list = db.SanPhams.Where(m => m.TenSanPham.Contains(txtSearch.Trim())).AsEnumerable();
            ViewBag.SanPhamTimKiem = txtSearch;
            return View("Search", list);
        }
    }
}