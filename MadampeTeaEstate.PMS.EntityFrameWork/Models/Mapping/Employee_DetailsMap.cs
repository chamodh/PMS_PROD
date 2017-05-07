using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping
{
    public class Employee_DetailsMap : EntityTypeConfiguration<Employee_Details>
    {
        public Employee_DetailsMap()
        {
            // Primary Key
            this.HasKey(t => t.EmployeeId);

            // Properties
            this.Property(t => t.EmployeeId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.KnownAs)
                .IsFixedLength()
                .HasMaxLength(100);

            this.Property(t => t.EmployeeFirstName)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(200);

            this.Property(t => t.EmployeeLastName)
                .IsFixedLength()
                .HasMaxLength(200);

            this.Property(t => t.Address)
                .IsFixedLength()
                .HasMaxLength(300);

            // Table & Column Mappings
            this.ToTable("Employee_Details");
            this.Property(t => t.EmployeeId).HasColumnName("EmployeeId");
            this.Property(t => t.KnownAs).HasColumnName("KnownAs");
            this.Property(t => t.EmployeeFirstName).HasColumnName("EmployeeFirstName");
            this.Property(t => t.EmployeeLastName).HasColumnName("EmployeeLastName");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.JoinDate).HasColumnName("JoinDate");
            this.Property(t => t.IsConfirmed).HasColumnName("IsConfirmed");
        }
    }
}
