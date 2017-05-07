namespace MadampeTeaEstate.PMS.EntityFrameWork.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedatabaseverboseforce : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Crop_Details",
                c => new
                    {
                        CropId = c.Int(nullable: false, identity: true),
                        Date = c.DateTime(nullable: false),
                        EstateLeafWeight = c.Double(nullable: false),
                        SupplierId = c.Int(nullable: false),
                        BoughtLeafWeight = c.Double(nullable: false),
                        ProducedWeight = c.Double(nullable: false),
                        WastageWeight = c.Double(nullable: false),
                        InProduction = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.CropId)
                .ForeignKey("dbo.Supplier_Details", t => t.SupplierId, cascadeDelete: true)
                .Index(t => t.SupplierId);
            
            CreateTable(
                "dbo.Employee_Shedule",
                c => new
                    {
                        RowId = c.Int(nullable: false, identity: true),
                        CropId = c.Int(nullable: false),
                        ProcessId = c.Int(nullable: false),
                        EnterdDate = c.DateTime(nullable: false),
                        EmployeeCount = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RowId)
                .ForeignKey("dbo.Crop_Details", t => t.CropId, cascadeDelete: true)
                .ForeignKey("dbo.Process_Details", t => t.ProcessId, cascadeDelete: true)
                .Index(t => t.CropId)
                .Index(t => t.ProcessId);
            
            CreateTable(
                "dbo.Process_Details",
                c => new
                    {
                        ProcessId = c.Int(nullable: false),
                        ProcessName = c.String(nullable: false, maxLength: 20, fixedLength: true),
                        RequiredProcessTime = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ProcessId);
            
            CreateTable(
                "dbo.Machine_Details",
                c => new
                    {
                        MachineId = c.Int(nullable: false),
                        MachineName = c.String(nullable: false, maxLength: 20, fixedLength: true),
                        MaxWight = c.Double(nullable: false),
                        ProcessId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MachineId)
                .ForeignKey("dbo.Process_Details", t => t.ProcessId, cascadeDelete: true)
                .Index(t => t.ProcessId);
            
            CreateTable(
                "dbo.Machine_Shedule",
                c => new
                    {
                        RowId = c.Int(nullable: false, identity: true),
                        CropId = c.Int(nullable: false),
                        EnterdDate = c.DateTime(nullable: false),
                        MachineId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.RowId)
                .ForeignKey("dbo.Crop_Details", t => t.CropId, cascadeDelete: true)
                .ForeignKey("dbo.Machine_Details", t => t.MachineId, cascadeDelete: true)
                .Index(t => t.CropId)
                .Index(t => t.MachineId);
            
            CreateTable(
                "dbo.Process_Shedule",
                c => new
                    {
                        RowId = c.Int(nullable: false, identity: true),
                        CropId = c.Int(nullable: false),
                        ProcessId = c.Int(nullable: false),
                        MachineCount = c.Int(nullable: false),
                        ProcessCount = c.Int(nullable: false),
                        EnterdDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.RowId)
                .ForeignKey("dbo.Crop_Details", t => t.CropId, cascadeDelete: true)
                .ForeignKey("dbo.Process_Details", t => t.ProcessId, cascadeDelete: true)
                .Index(t => t.CropId)
                .Index(t => t.ProcessId);
            
            CreateTable(
                "dbo.Supplier_Details",
                c => new
                    {
                        SupplierId = c.Int(nullable: false),
                        SupplierName = c.String(nullable: false, maxLength: 200, fixedLength: true),
                        ContactNumber = c.String(maxLength: 15, fixedLength: true),
                    })
                .PrimaryKey(t => t.SupplierId);
            
            CreateTable(
                "dbo.Employee_Details",
                c => new
                    {
                        EmployeeId = c.Int(nullable: false),
                        KnownAs = c.String(maxLength: 100, fixedLength: true),
                        EmployeeFirstName = c.String(nullable: false, maxLength: 200, fixedLength: true),
                        EmployeeLastName = c.String(maxLength: 200, fixedLength: true),
                        Address = c.String(maxLength: 300, fixedLength: true),
                        JoinDate = c.DateTime(),
                        IsConfirmed = c.Boolean(),
                    })
                .PrimaryKey(t => t.EmployeeId);
            
            CreateTable(
                "dbo.UserProfile",
                c => new
                    {
                        UserId = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.UserId);
            
            CreateTable(
                "dbo.webpages_Roles",
                c => new
                    {
                        RoleId = c.Int(nullable: false, identity: true),
                        RoleName = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.RoleId);
            
            CreateTable(
                "dbo.webpages_Membership",
                c => new
                    {
                        UserId = c.Int(nullable: false),
                        CreateDate = c.DateTime(),
                        ConfirmationToken = c.String(maxLength: 128),
                        IsConfirmed = c.Boolean(),
                        LastPasswordFailureDate = c.DateTime(),
                        PasswordFailuresSinceLastSuccess = c.Int(nullable: false),
                        Password = c.String(nullable: false, maxLength: 128),
                        PasswordChangedDate = c.DateTime(),
                        PasswordSalt = c.String(nullable: false, maxLength: 128),
                        PasswordVerificationToken = c.String(maxLength: 128),
                        PasswordVerificationTokenExpirationDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.UserId);
            
            CreateTable(
                "dbo.webpages_OAuthMembership",
                c => new
                    {
                        Provider = c.String(nullable: false, maxLength: 30),
                        ProviderUserId = c.String(nullable: false, maxLength: 100),
                        UserId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Provider, t.ProviderUserId });
            
            CreateTable(
                "dbo.webpages_UsersInRoles",
                c => new
                    {
                        RoleId = c.Int(nullable: false),
                        UserId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.RoleId, t.UserId })
                .ForeignKey("dbo.webpages_Roles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.UserProfile", t => t.UserId, cascadeDelete: true)
                .Index(t => t.RoleId)
                .Index(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.webpages_UsersInRoles", "UserId", "dbo.UserProfile");
            DropForeignKey("dbo.webpages_UsersInRoles", "RoleId", "dbo.webpages_Roles");
            DropForeignKey("dbo.Crop_Details", "SupplierId", "dbo.Supplier_Details");
            DropForeignKey("dbo.Employee_Shedule", "ProcessId", "dbo.Process_Details");
            DropForeignKey("dbo.Process_Shedule", "ProcessId", "dbo.Process_Details");
            DropForeignKey("dbo.Process_Shedule", "CropId", "dbo.Crop_Details");
            DropForeignKey("dbo.Machine_Details", "ProcessId", "dbo.Process_Details");
            DropForeignKey("dbo.Machine_Shedule", "MachineId", "dbo.Machine_Details");
            DropForeignKey("dbo.Machine_Shedule", "CropId", "dbo.Crop_Details");
            DropForeignKey("dbo.Employee_Shedule", "CropId", "dbo.Crop_Details");
            DropIndex("dbo.webpages_UsersInRoles", new[] { "UserId" });
            DropIndex("dbo.webpages_UsersInRoles", new[] { "RoleId" });
            DropIndex("dbo.Process_Shedule", new[] { "ProcessId" });
            DropIndex("dbo.Process_Shedule", new[] { "CropId" });
            DropIndex("dbo.Machine_Shedule", new[] { "MachineId" });
            DropIndex("dbo.Machine_Shedule", new[] { "CropId" });
            DropIndex("dbo.Machine_Details", new[] { "ProcessId" });
            DropIndex("dbo.Employee_Shedule", new[] { "ProcessId" });
            DropIndex("dbo.Employee_Shedule", new[] { "CropId" });
            DropIndex("dbo.Crop_Details", new[] { "SupplierId" });
            DropTable("dbo.webpages_UsersInRoles");
            DropTable("dbo.webpages_OAuthMembership");
            DropTable("dbo.webpages_Membership");
            DropTable("dbo.webpages_Roles");
            DropTable("dbo.UserProfile");
            DropTable("dbo.Employee_Details");
            DropTable("dbo.Supplier_Details");
            DropTable("dbo.Process_Shedule");
            DropTable("dbo.Machine_Shedule");
            DropTable("dbo.Machine_Details");
            DropTable("dbo.Process_Details");
            DropTable("dbo.Employee_Shedule");
            DropTable("dbo.Crop_Details");
        }
    }
}
