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
    
    public partial class Nhomsp
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Nhomsp()
        {
            this.SanPhams = new HashSet<SanPham>();
        }
    
        public int NhomspID { get; set; }
        public string TenNhomsp { get; set; }
        public int PhanLoaiID { get; set; }
        public string BiDanh { get; set; }
    
        public virtual PhanLoai PhanLoai { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
