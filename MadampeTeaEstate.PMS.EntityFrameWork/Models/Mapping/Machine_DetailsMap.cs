using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Machine_DetailsMap : EntityTypeConfiguration<Machine_Details>
    {
        public Machine_DetailsMap()
        {
            // Primary Key
            this.HasKey(t => t.MachineId);

            // Properties
            this.Property(t => t.MachineId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.MachineName)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Machine_Details");
            this.Property(t => t.MachineId).HasColumnName("MachineId");
            this.Property(t => t.MachineName).HasColumnName("MachineName");
            this.Property(t => t.MaxWight).HasColumnName("MaxWight");
            this.Property(t => t.ProcessId).HasColumnName("ProcessId");

            // Relationships
            this.HasRequired(t => t.Process_Details)
                .WithMany(t => t.Machine_Details)
                .HasForeignKey(d => d.ProcessId);

        }
    }
}
