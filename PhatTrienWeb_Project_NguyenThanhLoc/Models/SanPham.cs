namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [Key]
        public int MaSP { get; set; }

        [Required]
        [StringLength(100)]
        public string TenSP { get; set; }

        public double Gia { get; set; }

        public int? SoLuong { get; set; }

        [StringLength(4000)]
        public string MoTa { get; set; }

        [Required]
        [StringLength(1000)]
        public string Anh { get; set; }

        public int MaLoai { get; set; }

		public int GiamGia { get; set; }
    }
}
