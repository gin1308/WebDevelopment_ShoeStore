namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [Key]
        public int KH_ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [StringLength(50)]
        public string TenKH { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        public DateTime? DoB { get; set; }

        [Required]
        [StringLength(11)]
        public string SoDT { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }
    }
}
