using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Process_SheduleMap : EntityTypeConfiguration<Process_Shedule>
    {
        public Process_SheduleMap()
        {
            // Primary Key
            this.HasKey(t => t.RowId);

            // Properties
            // Table & Column Mappings
            this.ToTable("Process_Shedule");
            this.Property(t => t.RowId).HasColumnName("RowId");
            this.Property(t => t.CropId).HasColumnName("CropId");
            this.Property(t => t.ProcessId).HasColumnName("ProcessId");
            this.Property(t => t.MachineCount).HasColumnName("MachineCount");
            this.Property(t => t.ProcessCount).HasColumnName("ProcessCount");
            this.Property(t => t.EnterdDate).HasColumnName("EnterdDate");

            // Relationships
            this.HasRequired(t => t.Crop_Details)
                .WithMany(t => t.Process_Shedule)
                .HasForeignKey(d => d.CropId);
            this.HasRequired(t => t.Process_Details)
                .WithMany(t => t.Process_Shedule)
                .HasForeignKey(d => d.ProcessId);

        }
    }
}
