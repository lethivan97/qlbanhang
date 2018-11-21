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
    public class DatHangController : Controller
    {
        private VanShopEntities db = new VanShopEntities();

        // GET: Admin/DatHang
        public ActionResult Index()
        {
            return View(db.DatHangs.ToList());
        }

        // GET: Admin/DatHang/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DatHang datHang = db.DatHangs.Find(id);
            if (datHang == null)
            {
                return HttpNotFound();
            }
            return View(datHang);
        }

        // GET: Admin/DatHang/Create
        public ActionResult Create()
        {
            return View();
        }
        public PartialViewResult Search(string tukhoa)
        {
            return PartialView(db.DatHangs.Where(m=>m.Hoten.Contains(tukhoa)).ToList());
        }
        // POST: Admin/DatHang/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DatHangID,Hoten,DienThoai,DiaChi,Email,NgayDat,TriGia,DaGiao,NgayGiao,GhiChu")] DatHang datHang)
        {
            if (ModelState.IsValid)
            {
                db.DatHangs.Add(datHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(datHang);
        }

        // GET: Admin/DatHang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DatHang datHang = db.DatHangs.Find(id);
            if (datHang == null)
            {
                return HttpNotFound();
            }
            return View(datHang);
        }

        // POST: Admin/DatHang/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DatHangID,Hoten,DienThoai,DiaChi,Email,NgayDat,TriGia,DaGiao,NgayGiao,GhiChu")] DatHang datHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(datHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(datHang);
        }

        // GET: Admin/DatHang/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DatHang datHang = db.DatHangs.Find(id);
            if (datHang == null)
            {
                return HttpNotFound();
            }
            return View(datHang);
        }

        // POST: Admin/DatHang/Delete/5
        [HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int []dsxoa)
        {
            foreach(int id in dsxoa)
            {
                DatHang datHang = db.DatHangs.Find(id);
                IEnumerable<DatHangCT> dathangct = db.DatHangCTs.Where(m => m.DatHangID == id);
                foreach(var item in dathangct)
                {
                    db.DatHangCTs.Remove(item);
                }
                db.DatHangs.Remove(datHang);
            }          
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
