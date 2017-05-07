using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Employee_SheduleMap : EntityTypeConfiguration<Employee_Shedule>
    {
        public Employee_SheduleMap()
        {
            // Primary Key
            this.HasKey(t => t.RowId);

            // Properties
            // Table & Column Mappings
            this.ToTable("Employee_Shedule");
            this.Property(t => t.RowId).HasColumnName("RowId");
            this.Property(t => t.CropId).HasColumnName("CropId");
            this.Property(t => t.ProcessId).HasColumnName("ProcessId");
            this.Property(t => t.EnterdDate).HasColumnName("EnterdDate");
            this.Property(t => t.EmployeeCount).HasColumnName("EmployeeCount");

            // Relationships
            this.HasRequired(t => t.Crop_Details)
                .WithMany(t => t.Employee_Shedule)
                .HasForeignKey(d => d.CropId);
            this.HasRequired(t => t.Process_Details)
                .WithMany(t => t.Employee_Shedule)
                .HasForeignKey(d => d.ProcessId);

        }
    }
}
