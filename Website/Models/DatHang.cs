//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Website.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DatHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatHang()
        {
            this.DatHangCTs = new HashSet<DatHangCT>();
        }
    
        public int DatHangID { get; set; }
        public string Hoten { get; set; }
        public string DienThoai { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public System.DateTime NgayDat { get; set; }
        public int TriGia { get; set; }
        public bool DaGiao { get; set; }
        public Nullable<System.DateTime> NgayGiao { get; set; }
        public string GhiChu { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatHangCT> DatHangCTs { get; set; }
    }
}
