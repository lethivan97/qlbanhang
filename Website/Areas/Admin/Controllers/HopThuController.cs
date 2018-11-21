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
    public class HopThuController : Controller
    {
        private VanShopEntities db = new VanShopEntities();

        // GET: Admin/HopThu
        public ActionResult Index()
        {
            return View(db.HopThus.ToList());
        }

        // GET: Admin/HopThu/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopThu hopThu = db.HopThus.Find(id);
            if (hopThu == null)
            {
                return HttpNotFound();
            }
            return View(hopThu);
        }

        // GET: Admin/HopThu/Create
        public ActionResult Create()
        {
            return View();
        }
        public PartialViewResult Search(string tukhoa)
        {
            return PartialView(db.HopThus.Where(m => m.Hoten.Contains(tukhoa)).ToList());
        }
        // POST: Admin/HopThu/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HopThuID,Hoten,Email,NoiDung,NgayCapNhat,DaDoc,SDT,TieuDe")] HopThu hopThu)
        {
            if (ModelState.IsValid)
            {
                db.HopThus.Add(hopThu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hopThu);
        }

        // GET: Admin/HopThu/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopThu hopThu = db.HopThus.Find(id);
            if (hopThu == null)
            {
                return HttpNotFound();
            }
            return View(hopThu);
        }

        // POST: Admin/HopThu/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HopThuID,Hoten,Email,NoiDung,NgayCapNhat,DaDoc,SDT,TieuDe")] HopThu hopThu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hopThu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hopThu);
        }

        // GET: Admin/HopThu/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopThu hopThu = db.HopThus.Find(id);
            if (hopThu == null)
            {
                return HttpNotFound();
            }
            return View(hopThu);
        }

        // POST: Admin/HopThu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HopThu hopThu = db.HopThus.Find(id);
            db.HopThus.Remove(hopThu);
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
