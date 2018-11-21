using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website.Models
{
    public class BaoCao
    {
        public int SanPhamID { get; set; }
        public string TenSanPham { get; set; }
        public string TenNhom { get; set; }
        public string Hinh { get; set; }
        public int DonGia { get; set; }
        public int SLBan { get; set; } 
    }
}