using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Models;
namespace Website.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class BaoCaoController : Controller
    {
        VanShopEntities db = new VanShopEntities();
       
        public ActionResult Index(int? page)
        {
            var sanPham = db.DatHangCTs.GroupBy(dhct => dhct.SanPham).Select(g => new BaoCao
            {
                SanPhamID =g.Key.SanPhamID,
                TenSanPham =g.Key.TenSanPham,
                TenNhom=g.Key.Nhomsp.TenNhomsp,
                Hinh=g.Key.Hinh,
                DonGia=g.Key.DonGia,     
                SLBan=g.Sum(dhct=>dhct.SoLuong)
            }).OrderBy(dhct=>dhct.TenSanPham).ToPagedList(page ?? 1, 10);
            int SumTien = 0,SumSP=0;
            foreach(var item in sanPham)
            {
                SumTien += item.SLBan * item.DonGia;
                SumSP += item.SLBan;
            }
            ViewBag.TongTien = SumTien;
            ViewBag.TongSP = SumSP;
            return View(sanPham);
        }
        public ActionResult BaoCaoTheoThang()
        {
            var list = db.DatHangCTs.GroupBy(dh => dh.DatHang).Select(g => new BCSPBanTheoThang
            {
                Thang =g.Key.NgayGiao.Value.Month,
                SLBan=g.Sum(m=>m.SoLuong),
                TongTien=g.Sum(m=>m.ThanhTien)
            }).OrderBy(m=>m.Thang).ToList();
            int SL=0, SumT=0;
            List<BCSPBanTheoThang> bc=new List<BCSPBanTheoThang>();
            int[] thang = { 1,2,3,4,5,6,7,8,9,10,11,12 };
            int TongTienCuaNam = 0;
            int TongSPCuaNam = 0;
            foreach(int i in thang)
            {
                foreach(BCSPBanTheoThang item in list)
                {
                    if (item.Thang == i)
                    {
                        SL += item.SLBan;
                        SumT += item.TongTien;
                    }
                }
                BCSPBanTheoThang item_bc = new BCSPBanTheoThang
                {
                    Thang = i,
                    SLBan=SL,
                    TongTien=SumT
                };
                SL = 0;SumT = 0;
                bc.Add(item_bc);
                TongTienCuaNam += item_bc.TongTien;
                TongSPCuaNam += item_bc.SLBan;
            }
            ViewBag.TongTienCuaNam = TongTienCuaNam;
            ViewBag.TongSPCuaNam = TongSPCuaNam;
            return View(bc);
        }
    }
}