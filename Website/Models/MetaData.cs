using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//Khai bao su dung anotation
using System.ComponentModel.DataAnnotations;
namespace Website.Models
{
    [MetadataType(typeof(SanPhamMetaData))]
    public partial class SanPham
    {

    }

    sealed class SanPhamMetaData // class cau hinh metadata, khong ke thua 
    {
        [Display(Name = "ID")]
        public int SanPhamID { get; set; }
        [Display(Name = "Tên sản phẩm")]
        [StringLength(150,ErrorMessage = "Tên sản phẩm không được vượt quá 150 kí tự")]
        [Required(ErrorMessage = "Tên sản phẩm không được bỏ trống")]
        public string TenSanPham { get; set; }
        [Display(Name = "Mô tả")]
        public string MoTa { get; set; }
        [Display(Name = "Đơn giá")]
        [Required(ErrorMessage = "Đơn giá không được bỏ trống")]
        public int DonGia { get; set; }
        [Display(Name ="Giá khuyến mại")]
        [Required(ErrorMessage ="Đơn giá khuyến mại không được bỏ trống")]
        public int GiaKM { get; set; }
        [Display(Name ="Hình ảnh")]
        [StringLength(150,ErrorMessage ="Tên của ảnh không được vượt quá 150 kí tự")]
        public string Hinh { get; set; }
        [Display(Name = "Tên nhóm")]
        public int NhomspID { get; set; }
        [Display(Name ="Ngày cập nhập")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime NgayCapNhat { get; set; }
        [Display(Name ="Ngừng bán")]
        public bool NgungBan { get; set; }
        [Display(Name ="Bí danh")]
        [StringLength(150, ErrorMessage = "Tên bí danh không được vượt quá 150 kí tự")]
        public string BiDanh { get; set; }
    }

    [MetadataType(typeof(PhanLoaiMetaData))]
    public partial class PhanLoai
    {

    }
    sealed class PhanLoaiMetaData
    {
        [Display(Name ="ID")]
        public int PhanLoaiID { get; set; }
        [Display(Name ="Tên loại")]
        [StringLength(50,ErrorMessage ="Tên loại không được quá 50 kí tự")]
        [Required(ErrorMessage ="Tên loại không được bỏ trống")]
        public string TenPhanLoai { get; set; }
        [Display(Name ="Bí danh")]
        [StringLength(50,ErrorMessage ="Bí danh không được vượt quá 50 kí tự")]
        public string BiDanh { get; set; }
    }
    [MetadataType(typeof(NhomspMetaData))]
    public partial class Nhomsp
    {

    }
    sealed class NhomspMetaData
    {
        [Display(Name ="ID")]
        public int NhomspID { get; set; }
        [Display(Name ="Tên nhóm")]
        [StringLength(50,ErrorMessage ="Tên nhóm không được vượt quá 50 kí tự")]
        [Required(ErrorMessage ="Tên nhóm không được bỏ trống")]
        public string TenNhomsp { get; set; }
        [Display(Name ="Tên loại")]
        public int PhanLoaiID { get; set; }
        [Display(Name ="Bí danh")]
        [StringLength(50,ErrorMessage ="Bí danh không được vượt quá 50 kí tự")]
        public string BiDanh { get; set; }
    }
    [MetadataType(typeof(HopThuMetaData))]
    public partial class HopThu
    {

    }
    sealed class HopThuMetaData
    {
        [Display(Name ="ID")]
        public int HopThuID { get; set; }
        [Display(Name ="Họ tên")]
        [StringLength(100,ErrorMessage ="Họ tên không được vượt quá 100 kí tự")]
        [Required(ErrorMessage ="Họ tên không được bỏ trống")]
        public string Hoten { get; set; }
        [Display(Name ="Email")]
        [StringLength(100,ErrorMessage ="Email phải đúng định dạng")]
        [EmailAddress(ErrorMessage = "Email phải đúng định dạng")]
        [Required(ErrorMessage ="Email không được để trống")]
        public string Email { get; set; }
        [Display(Name ="Nội dung")]
        [Required(ErrorMessage ="Nội dung không được bỏ trống")]
        public string NoiDung { get; set; }
        [Display(Name = "Ngày cập nhập")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime NgayCapNhat { get; set; }
        [Display(Name ="Đã đọc")]
        public bool DaDoc { get; set; }
        [Display(Name ="Điện thoại")]
        [StringLength(11,ErrorMessage ="Số điện thoại không được vượt quá 11 kí tự")]
        public string SDT { get; set; }
        [Display(Name ="Tiêu đề")]
        [StringLength(50,ErrorMessage ="Tiêu đề không được vượt quá 50 kí tự")]
        public string TieuDe { get; set; }
    }
    [MetadataType(typeof(DatHangMetaData))]
    public partial class DatHang
    {

    }
    sealed class DatHangMetaData
    {
        [Display(Name ="ID")]
        public int DatHangID { get; set; }
        [Display(Name ="Tên khách hàng")]
        [StringLength(50,ErrorMessage ="Họ tên không được vượt quá 50 kí tự")]
        [Required(ErrorMessage ="Họ tên không được bỏ trống")]
        public string Hoten { get; set; }
        [Display(Name ="Điện thoại")]
        [StringLength(11,ErrorMessage ="Điện thoại không được vượt quá 11 kí tự")]
        [Required(ErrorMessage ="Điện thoại không được bỏ trống")]
        public string DienThoai { get; set; }
        [Display(Name = "Địa chỉ nhận hàng")]
        [StringLength(200, ErrorMessage = "Điạ chỉ không được vượt quá 11 kí tự")]
        [Required(ErrorMessage = "Địa chỉ không được bỏ trống")]
        public string DiaChi { get; set; }
        [Display(Name = "Email")]
        [StringLength(150, ErrorMessage = "Email phải đúng định dạng")]
        [EmailAddress(ErrorMessage = "Email phải đúng định dạng")]
        public string Email { get; set; }
        [Display(Name = "Ngày cập nhập")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime NgayDat { get; set; }
        [Display(Name = "Tổng tiền đơn hàng")]
        [Required(ErrorMessage = "Tổng tiền đơn hàng không được bỏ trống")]
        public int TriGia { get; set; }
        [Display(Name ="Đã giao")]
        public bool DaGiao { get; set; }
        [Display(Name = "Ngày giao")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> NgayGiao { get; set; }
        [Display(Name ="Ghi chú")]
        public string GhiChu { get; set; }
    }

}