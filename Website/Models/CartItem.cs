using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website.Models
{
    public class CartItem
    {
        public int SanPhamID { get; set; }
        public String TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public uint DonGia { get; set; }
        public uint ThanhTien
        {
            get
            {
                return (uint)(SoLuong * DonGia);
            }
        }
        public String Hinh { get; set; }
    }
}