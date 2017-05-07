using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Process_DetailsMap : EntityTypeConfiguration<Process_Details>
    {
        public Process_DetailsMap()
        {
            // Primary Key
            this.HasKey(t => t.ProcessId);

            // Properties
            this.Property(t => t.ProcessId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ProcessName)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Process_Details");
            this.Property(t => t.ProcessId).HasColumnName("ProcessId");
            this.Property(t => t.ProcessName).HasColumnName("ProcessName");
            this.Property(t => t.RequiredProcessTime).HasColumnName("RequiredProcessTime");
        }
    }
}
