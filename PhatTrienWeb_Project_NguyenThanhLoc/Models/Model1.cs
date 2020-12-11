namespace PhatTrienWeb_Project_NguyenThanhLoc.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class Model1 : DbContext
	{
		public Model1()
			: base("name=webproject")
		{
		}

		public virtual DbSet<ChiTietOrder> ChiTietOrders { get; set; }
		public virtual DbSet<KhachHang> KhachHangs { get; set; }
		public virtual DbSet<LoaiSP> LoaiSPs { get; set; }
		public virtual DbSet<Order> Orders { get; set; }
		public virtual DbSet<SanPham> SanPhams { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
		}
	}
}
