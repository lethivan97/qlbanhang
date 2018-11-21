using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website.Models;

namespace Website.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SanPhamController : Controller
    {
        private VanShopEntities db = new VanShopEntities();

        // GET: Admin/SanPhams
        // GET: Admin/SanPham
        public ActionResult Index(int? page)
        {
            IEnumerable<SanPham> list = null;
            list = db.SanPhams.Include("Nhomsp").Where(m => m.Nhomsp.PhanLoai.PhanLoaiID != 3).OrderByDescending(m => m.SanPhamID).AsEnumerable().ToPagedList(page ?? 1, 10);
            return View(list);
        }
        public PartialViewResult Pager(int? page)
        {
            IEnumerable<SanPham> list = null;
            list = db.SanPhams.Include("Nhomsp").Where(m => m.Nhomsp.PhanLoai.PhanLoaiID != 3).OrderByDescending(m => m.SanPhamID).AsEnumerable().ToPagedList(page ?? 1, 10);
            return PartialView(list);
        }
        public PartialViewResult Search(string tukhoa)
        {
            return PartialView(db.SanPhams.Include("Nhomsp").Where(m => m.Nhomsp.PhanLoai.PhanLoaiID != 3 && m.TenSanPham.Contains(tukhoa)).ToList());
        }

        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.listType = db.PhanLoais.Where(m => m.PhanLoaiID != 3).AsEnumerable();
            //ViewBag.NhomspID = new SelectList(db.Nhomsps, "NhomspID", "TenNhomsp");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "TenSanPham,MoTa,DonGia,GiaKM,NhomspID,NgungBan,BiDanh")] SanPham sanPham, HttpPostedFileBase file)
        {
            if (file == null || file.ContentLength == 0)
            {
                ModelState.AddModelError("", "Chưa chọn hình");
            }
            else
            {
                string extend = System.IO.Path.GetExtension(file.FileName);
                if (extend != ".jpg" && extend != ".jpeg" && extend != ".png")
                {
                    ModelState.AddModelError("", "Hình ảnh phải có đuôi .jpg hoặc .jpeg hoặc .png");
                }
                else
                {
                    try
                    {
                        sanPham.Hinh = sanPham.BiDanh + extend;
                        file.SaveAs(Server.MapPath("~/Content/images/Photos/" + sanPham.Hinh));
                    }
                    catch
                    {
                        ModelState.AddModelError("", "Xảy ra lỗi khi lưu hình");
                    }
                }
                sanPham.NgayCapNhat = DateTime.Now;
            }
            //Bat loi 
            if (ModelState.IsValid)
            {
                db.SanPhams.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.listType = db.PhanLoais.Where(m => m.PhanLoaiID != 3).AsEnumerable();
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.listType = db.PhanLoais.Where(m => m.PhanLoaiID != 3).AsEnumerable();
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "SanPhamID,TenSanPham,MoTa,DonGia,GiaKM,Hinh,NhomspID,NgayCapNhat,NgungBan,BiDanh")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.listType = db.PhanLoais.Where(m => m.PhanLoaiID != 3).AsEnumerable();
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            List<DatHangCT> dathangcts = db.DatHangCTs.Where(m => m.SanPhamID == id).ToList();
            db.DatHangCTs.RemoveRange(dathangcts);
            foreach (DatHangCT item in dathangcts)
            {
                db.DatHangCTs.Remove(item);
                DatHang dh = db.DatHangs.Find(item.DatHangID);
                if (dh.DatHangCTs.Count() == 0)
                {
                    db.DatHangs.Remove(dh);
                }
            }

            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
