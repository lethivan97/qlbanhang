using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website.Models
{
    public class SanPhamBanChay
    {
        public int SanPhamID { get; set; }
        public string TenSanPham { get; set; }
        public string MoTa { get; set; }
        public int DonGia { get; set; }
        public int GiaKM { get; set; }
        public string Hinh { get; set; }
        public int NhomspID { get; set; }
        public System.DateTime NgayCapNhat { get; set; }
        public bool NgungBan { get; set; }
        public string BiDanh { get; set; }
    }
}