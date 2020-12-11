namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public long ID { get; set; }

        public DateTime? NgayTao { get; set; }

        public int? KH_ID { get; set; }

		[StringLength(50)]
		public string TenKH_Ship { get; set; }

		[StringLength(11)]
        public string SoDT_Ship { get; set; }

        [StringLength(50)]
        public string DiaChi_Ship { get; set; }

        public int? TrangThai { get; set; }
    }
}
