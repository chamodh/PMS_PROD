using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using MadampeTeaEstate.PMS.EntityFrameWork.Models.Mapping;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class Production_Management_SystemContext : DbContext
    {
        static Production_Management_SystemContext()
        {
            Database.SetInitializer<Production_Management_SystemContext>(null);
        }

        public Production_Management_SystemContext()
            : base("Name=Production_Management_SystemContext")
        {
        }

        public DbSet<Crop_Details> Crop_Details { get; set; }
        public DbSet<Employee_Details> Employee_Details { get; set; }
        public DbSet<Employee_Shedule> Employee_Shedule { get; set; }
        public DbSet<Machine_Details> Machine_Details { get; set; }
        public DbSet<Machine_Shedule> Machine_Shedule { get; set; }
        public DbSet<Process_Details> Process_Details { get; set; }
        public DbSet<Process_Shedule> Process_Shedule { get; set; }
        public DbSet<Supplier_Details> Supplier_Details { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }
        public DbSet<webpages_Membership> webpages_Membership { get; set; }
        public DbSet<webpages_OAuthMembership> webpages_OAuthMembership { get; set; }
        public DbSet<webpages_Roles> webpages_Roles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new Crop_DetailsMap());
            modelBuilder.Configurations.Add(new Employee_DetailsMap());
            modelBuilder.Configurations.Add(new Employee_SheduleMap());
            modelBuilder.Configurations.Add(new Machine_DetailsMap());
            modelBuilder.Configurations.Add(new Machine_SheduleMap());
            modelBuilder.Configurations.Add(new Process_DetailsMap());
            modelBuilder.Configurations.Add(new Process_SheduleMap());
            modelBuilder.Configurations.Add(new Supplier_DetailsMap());
            modelBuilder.Configurations.Add(new UserProfileMap());
            modelBuilder.Configurations.Add(new webpages_MembershipMap());
            modelBuilder.Configurations.Add(new webpages_OAuthMembershipMap());
            modelBuilder.Configurations.Add(new webpages_RolesMap());
        }
    }
}
