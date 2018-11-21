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
    public class NhomspsController : Controller
    {
        private VanShopEntities db = new VanShopEntities();

        // GET: Admin/Nhomsps
        public ActionResult Index()
        {
            var nhomsps = db.Nhomsps.Include(n => n.PhanLoai).Where(m=>m.PhanLoaiID !=3);
            return View(nhomsps.ToList());
        }

        // GET: Admin/Nhomsps/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhomsp nhomsp = db.Nhomsps.Find(id);
            if (nhomsp == null)
            {
                return HttpNotFound();
            }
            return View(nhomsp);
        }

        // GET: Admin/Nhomsps/Create
        public ActionResult Create()
        {
            ViewBag.PhanLoaiID = new SelectList(db.PhanLoais.Where(m=>m.PhanLoaiID !=3), "PhanLoaiID", "TenPhanLoai");
            return View();
        }

        // POST: Admin/Nhomsps/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NhomspID,TenNhomsp,PhanLoaiID,BiDanh")] Nhomsp nhomsp)
        {
            if (ModelState.IsValid)
            {
                db.Nhomsps.Add(nhomsp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PhanLoaiID = new SelectList(db.PhanLoais, "PhanLoaiID", "TenPhanLoai", nhomsp.PhanLoaiID);
            return View(nhomsp);
        }

        // GET: Admin/Nhomsps/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhomsp nhomsp = db.Nhomsps.Find(id);
            if (nhomsp == null)
            {
                return HttpNotFound();
            }
            ViewBag.PhanLoaiID = new SelectList(db.PhanLoais, "PhanLoaiID", "TenPhanLoai", nhomsp.PhanLoaiID);
            return View(nhomsp);
        }

        // POST: Admin/Nhomsps/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NhomspID,TenNhomsp,PhanLoaiID,BiDanh")] Nhomsp nhomsp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhomsp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PhanLoaiID = new SelectList(db.PhanLoais, "PhanLoaiID", "TenPhanLoai", nhomsp.PhanLoaiID);
            return View(nhomsp);
        }

        // GET: Admin/Nhomsps/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhomsp nhomsp = db.Nhomsps.Find(id);
            if (nhomsp == null)
            {
                return HttpNotFound();
            }
            return View(nhomsp);
        }

        // POST: Admin/Nhomsps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Nhomsp nhomsp = db.Nhomsps.Find(id);
            List<SanPham> sanpham = db.SanPhams.Where(m => m.NhomspID == id).ToList();
            if(sanpham.Count() != 0)
            {
                foreach (SanPham item in sanpham)
                {
                    IEnumerable<DatHangCT> item_DH = db.DatHangCTs.Where(m=>m.SanPhamID==item.SanPhamID);
                    foreach(var item_CT in item_DH)
                    {
                        DatHang dathang = db.DatHangs.Find(item_CT.DatHangID);
                        IEnumerable<DatHangCT> dathangct = db.DatHangCTs.Where(m => m.DatHangID == dathang.DatHangID);
                        if (dathangct.Count() ==1)
                        {
                            foreach (DatHangCT item_D in dathangct)
                            {
                                DatHang dh = db.DatHangs.Find(item_D.DatHangID);
                                db.DatHangs.Remove(dh);
                            }                                    
                        }
                        db.DatHangCTs.Remove(item_CT);
                    }
                    db.SanPhams.Remove(item);
                }
            }
            db.Nhomsps.Remove(nhomsp);
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
