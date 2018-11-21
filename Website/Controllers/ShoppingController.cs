using System.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Website.Models;
namespace Website.Controllers
{
    public class ShoppingController : Controller
    {
        // GET: Shopping
        VanShopEntities db = new VanShopEntities();
        public ActionResult Giohang()
        {
            return View(Session["shopping"]);
        }
        public RedirectResult ThemVaoGio(int SanPhamID)
        {
            SanPham sanPham = db.SanPhams.Find(SanPhamID);
            CartItem item = new CartItem()
            {
                SanPhamID = SanPhamID,
                TenSanPham = sanPham.TenSanPham,
                SoLuong = 1,
                DonGia = (uint)sanPham.DonGia,
                Hinh = sanPham.Hinh
            };
            if (Session["shopping"] == null)
            {
                Session["shopping"] = new List<CartItem>();
                (Session["shopping"] as List<CartItem>).Add(item);
            }
            else
            {
                CartItem itemInCart = (Session["shopping"] as List<CartItem>).SingleOrDefault(m => m.SanPhamID == SanPhamID);
                if(itemInCart != null)
                {
                    itemInCart.SoLuong++;
                }
                else
                {
                    (Session["shopping"] as List<CartItem>).Add(item);
                }
            }
            ViewBag.SoLuongTrongGio= (Session["shopping"] as List<CartItem>).Count();
            return Redirect(HttpContext.Request.UrlReferrer.ToString());
        }
        [HttpPost]
        public ActionResult XoaSanPhamTrongGio(int SanPhamID)
        {
            (Session["shopping"] as List<CartItem>).Remove((Session["shopping"] as List<CartItem>).Single(m => m.SanPhamID == SanPhamID));
            return RedirectToAction("Giohang");
        }
        //Thay doi so luong mua
        public JsonResult SuaSoLuongMua(int SanPhamID,short soLuongMoi)
        {
            CartItem itemInCart = null;
            try
            {
                itemInCart = (Session["shopping"] as List<CartItem>).Single(m => m.SanPhamID == SanPhamID);
                itemInCart.SoLuong = soLuongMoi;
                return Json(new { trangthai = 1, soLuongMoi = soLuongMoi, thanhtienmoi = itemInCart.ThanhTien, tongsoluongmoi = (Session["shopping"] as List<CartItem>).Sum(m => m.SoLuong),
                    tongthanhtienmoi = (Session["shopping"] as List<CartItem>).Sum(m => m.ThanhTien) }, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new { trangthai = 0, soluongcu = itemInCart.SoLuong }, JsonRequestBehavior.AllowGet);
            }
        }
        //Thanh toan
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThanhToan([Bind(Exclude ="NgayDat,TriGia,DaGiao,NgayGiao")] DatHang dathang)
        {
            try
            {
                dathang.NgayDat = DateTime.Now;
                dathang.TriGia = (int)(Session["shopping"] as List<CartItem>).Sum(m => m.ThanhTien);
                dathang.DaGiao = false;
                //Thay doi ngay giao
                dathang.NgayGiao =dathang.NgayDat.AddDays(4) ;
                ViewBag.NgayGiao = dathang.NgayGiao;
                if (ModelState.IsValid)
                {
                    db.DatHangs.Add(dathang);
                    db.SaveChanges();
                }
                foreach(CartItem item in (Session["shopping"] as List<CartItem>))
                {
                    DatHangCT ct = new DatHangCT()
                    {
                        DatHangID = dathang.DatHangID,
                        SanPhamID = item.SanPhamID,
                        DonGia = (int)item.DonGia,
                        SoLuong = (int)item.SoLuong,
                        ThanhTien = (int)item.ThanhTien
                    };
                    Session.Clear();
                    db.DatHangCTs.Add(ct);
                    db.SaveChanges();
                }  
                            
            }
            catch
            {
                return View("Error");
            }
            return View("ThanhToanThanhCong");
        }
    }
}