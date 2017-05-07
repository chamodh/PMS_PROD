using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Supplier_DetailsMap : EntityTypeConfiguration<Supplier_Details>
    {
        public Supplier_DetailsMap()
        {
            // Primary Key
            this.HasKey(t => t.SupplierId);

            // Properties
            this.Property(t => t.SupplierId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.SupplierName)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(200);

            this.Property(t => t.ContactNumber)
                .IsFixedLength()
                .HasMaxLength(15);

            // Table & Column Mappings
            this.ToTable("Supplier_Details");
            this.Property(t => t.SupplierId).HasColumnName("SupplierId");
            this.Property(t => t.SupplierName).HasColumnName("SupplierName");
            this.Property(t => t.ContactNumber).HasColumnName("ContactNumber");
        }
    }
}
