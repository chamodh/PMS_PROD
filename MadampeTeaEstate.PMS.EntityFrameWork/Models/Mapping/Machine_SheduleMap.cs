using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Machine_SheduleMap : EntityTypeConfiguration<Machine_Shedule>
    {
        public Machine_SheduleMap()
        {
            // Primary Key
            this.HasKey(t => t.RowId);

            // Properties
            // Table & Column Mappings
            this.ToTable("Machine_Shedule");
            this.Property(t => t.RowId).HasColumnName("RowId");
            this.Property(t => t.CropId).HasColumnName("CropId");
            this.Property(t => t.EnterdDate).HasColumnName("EnterdDate");
            this.Property(t => t.MachineId).HasColumnName("MachineId");

            // Relationships
            this.HasRequired(t => t.Crop_Details)
                .WithMany(t => t.Machine_Shedule)
                .HasForeignKey(d => d.CropId);
            this.HasRequired(t => t.Machine_Details)
                .WithMany(t => t.Machine_Shedule)
                .HasForeignKey(d => d.MachineId);

        }
    }
}
