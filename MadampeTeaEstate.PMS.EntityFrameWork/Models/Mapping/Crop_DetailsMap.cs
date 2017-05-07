using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Crop_DetailsMap : EntityTypeConfiguration<Crop_Details>
    {
        public Crop_DetailsMap()
        {
            // Primary Key
            this.HasKey(t => t.CropId);

            // Properties
            // Table & Column Mappings
            this.ToTable("Crop_Details");
            this.Property(t => t.CropId).HasColumnName("CropId");
            this.Property(t => t.Date).HasColumnName("Date");
            this.Property(t => t.EstateLeafWeight).HasColumnName("EstateLeafWeight");
            this.Property(t => t.SupplierId).HasColumnName("SupplierId");
            this.Property(t => t.BoughtLeafWeight).HasColumnName("BoughtLeafWeight");
            this.Property(t => t.ProducedWeight).HasColumnName("ProducedWeight");
            this.Property(t => t.WastageWeight).HasColumnName("WastageWeight");
            this.Property(t => t.InProduction).HasColumnName("InProduction");

            // Relationships
            this.HasRequired(t => t.Supplier_Details)
                .WithMany(t => t.Crop_Details)
                .HasForeignKey(d => d.SupplierId);

        }
    }
}
