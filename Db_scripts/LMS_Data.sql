
BEGIN TRY

    BEGIN TRAN


USE [Production_Management_System]

/****** Object:  Table [dbo].[Crop_Details]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Crop_Details](
	[CropId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[EstateLeafWeight] [float] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[BoughtLeafWeight] [float] NOT NULL,
	[ProducedWeight] [float] NOT NULL,
	[WastageWeight] [float] NOT NULL,
	[InProduction] [bit] NOT NULL,
 CONSTRAINT [PK_Crop_Details] PRIMARY KEY CLUSTERED 
(
	[CropId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Employee_Details]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Employee_Details](
	[EmployeeId] [int] NOT NULL,
	[KnownAs] [nchar](100) NULL,
	[EmployeeFirstName] [nchar](200) NOT NULL,
	[EmployeeLastName] [nchar](200) NULL,
	[Address] [nchar](300) NULL,
	[JoinDate] [date] NULL,
	[IsConfirmed] [bit] NULL,
 CONSTRAINT [PK_Employee_Details] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Employee_Shedule]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Employee_Shedule](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[CropId] [int] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[EnterdDate] [datetime] NOT NULL,
	[EmployeeCount] [int] NOT NULL,
 CONSTRAINT [PK_Employee_Shedule] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Machine_Details]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Machine_Details](
	[MachineId] [int] NOT NULL,
	[MachineName] [nchar](20) NOT NULL,
	[MaxWight] [float] NOT NULL,
	[ProcessId] [int] NOT NULL,
 CONSTRAINT [PK_Machine_Details] PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Machine_Shedule]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Machine_Shedule](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[CropId] [int] NOT NULL,
	[EnterdDate] [datetime] NOT NULL,
	[MachineId] [int] NOT NULL,
 CONSTRAINT [PK_Process_Shedule] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Process_Details]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Process_Details](
	[ProcessId] [int] NOT NULL,
	[ProcessName] [nchar](20) NOT NULL,
	[RequiredProcessTime] [float] NOT NULL,
 CONSTRAINT [PK_Process_Details] PRIMARY KEY CLUSTERED 
(
	[ProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Process_Shedule]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Process_Shedule](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[CropId] [int] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[MachineCount] [int] NOT NULL,
	[ProcessCount] [int] NOT NULL,
	[EnterdDate] [date] NOT NULL,
 CONSTRAINT [PK_Process_Shedule_1] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Supplier_Details]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Supplier_Details](
	[SupplierId] [int] NOT NULL,
	[SupplierName] [nchar](200) NOT NULL,
	[ContactNumber] [nchar](15) NULL,
 CONSTRAINT [PK_Supplier_Details] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 7/1/2016 8:03:43 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


SET IDENTITY_INSERT [dbo].[Crop_Details] ON 

INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (1, CAST(N'2016-06-26 00:00:00.000' AS DateTime), 23.34, 1, 243, 15700.419, 118.921, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (2, CAST(N'2016-06-28 00:00:00.000' AS DateTime), 23, 3, 234, 2300.25, 114.75, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (3, CAST(N'2016-06-30 00:00:00.000' AS DateTime), 1234.33, 3, 321, 7600.875, 694.455, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2340.345, 1, 2324.43, 2581.953, 2082.822, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (5, CAST(N'2016-07-08 00:00:00.000' AS DateTime), 2344, 1, 0, 1297.404, 1046.596, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (6, CAST(N'2016-07-08 00:00:00.000' AS DateTime), 223, 3, 232, 251.842, 203.158, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (7, CAST(N'2016-07-16 00:00:00.000' AS DateTime), 2345, 2, 2, 1299.065, 1047.935, 1)
INSERT [dbo].[Crop_Details] ([CropId], [Date], [EstateLeafWeight], [SupplierId], [BoughtLeafWeight], [ProducedWeight], [WastageWeight], [InProduction]) VALUES (8, CAST(N'2016-07-21 00:00:00.000' AS DateTime), 3434, 0, 2, 1901.826, 1534.174, 1)
SET IDENTITY_INSERT [dbo].[Crop_Details] OFF
SET IDENTITY_INSERT [dbo].[Employee_Shedule] ON 

INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (52, 1, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (53, 1, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (54, 1, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (55, 1, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (56, 1, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (57, 1, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (58, 1, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (59, 1, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (60, 1, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (61, 1, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (62, 2, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (63, 2, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (64, 2, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (65, 2, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (66, 2, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (67, 2, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (68, 2, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (69, 2, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (70, 2, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (71, 2, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (72, 3, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (73, 3, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (74, 3, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (75, 3, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (76, 3, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (77, 3, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (78, 3, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (79, 3, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (80, 3, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (81, 3, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (82, 4, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (83, 4, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (84, 4, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (85, 4, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (86, 4, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (87, 4, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (88, 4, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (89, 4, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (90, 4, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (91, 4, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (92, 5, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (93, 5, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (94, 5, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (95, 5, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (96, 5, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (97, 5, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (98, 5, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (99, 5, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (100, 5, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (101, 5, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (102, 1, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (103, 1, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (104, 1, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (105, 1, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (106, 1, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (107, 1, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (108, 1, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (109, 1, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (110, 1, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (111, 1, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (112, 1, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (113, 1, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (114, 1, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (115, 1, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (116, 1, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (117, 1, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (118, 1, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (119, 1, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (120, 1, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (121, 1, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (122, 6, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (123, 6, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (124, 6, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (125, 6, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (126, 6, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (127, 6, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (128, 6, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (129, 6, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (130, 6, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (131, 6, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (132, 1, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (133, 1, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (134, 1, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (135, 1, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (136, 1, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (137, 1, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (138, 1, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (139, 1, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (140, 1, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (141, 1, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (142, 7, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (143, 7, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (144, 7, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (145, 7, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (146, 7, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (147, 7, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (148, 7, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (149, 7, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (150, 7, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)

INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (151, 7, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (152, 8, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (153, 8, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (154, 8, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (155, 8, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (156, 8, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (157, 8, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (158, 8, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (159, 8, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (160, 8, 9, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Employee_Shedule] ([RowId], [CropId], [ProcessId], [EnterdDate], [EmployeeCount]) VALUES (161, 8, 10, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Employee_Shedule] OFF
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (1, N'Trough01            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (2, N'Trough02            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (3, N'Trough03            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (4, N'Trough04            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (5, N'Trough05            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (6, N'Trough06            ', 2500, 1)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (7, N'Roller01            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (8, N'Roller02            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (9, N'Roller03            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (10, N'Roller04            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (11, N'Roller05            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (12, N'Roller06            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (13, N'Roller07            ', 140, 2)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (14, N'RollBreaking01      ', 175, 3)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (15, N'RollBreaking02      ', 175, 3)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (16, N'RollBreaking03      ', 175, 3)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (17, N'RollBreaking04      ', 175, 3)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (18, N'RollBreaking05      ', 175, 3)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (19, N'Dryer               ', 300, 5)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (20, N'Sifter01            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (21, N'Sifter02            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (22, N'Sifter03            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (23, N'Sifter04            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (24, N'Sifter05            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (25, N'Sifter06            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (26, N'Sifter07            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (27, N'Sifter08            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (28, N'Sifter09            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (29, N'Sifter10            ', 355, 6)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (30, N'ColorSorter01       ', 200, 7)
INSERT [dbo].[Machine_Details] ([MachineId], [MachineName], [MaxWight], [ProcessId]) VALUES (31, N'ColorSorter02       ', 200, 7)
SET IDENTITY_INSERT [dbo].[Machine_Shedule] ON 

INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (969, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (970, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (971, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (972, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (973, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (974, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (975, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (976, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (977, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (978, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (979, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (980, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (981, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (982, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (983, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (984, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (985, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (986, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (987, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (988, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (989, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (990, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (991, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (992, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (993, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (994, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (995, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (996, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (997, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (998, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (999, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1000, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1001, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1002, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1003, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1004, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1005, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1006, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1007, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1008, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1009, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1010, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1011, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1012, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1013, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1014, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1015, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1016, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1017, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1018, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1019, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1020, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1021, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1022, 2, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1023, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1024, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1025, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1026, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1027, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1028, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1029, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1030, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1031, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1032, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1033, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1034, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1035, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1036, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1037, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1038, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1039, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1040, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1041, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1042, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1043, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1044, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1045, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1046, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1047, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1048, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1049, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1050, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1051, 3, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1052, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1053, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1054, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1055, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1056, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1057, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1058, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1059, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1060, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1061, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1062, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1063, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1064, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1065, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1066, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1067, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)

INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1068, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1069, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1070, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1071, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1072, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1073, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1074, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1075, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1076, 4, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1077, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1078, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1079, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1080, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1081, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1082, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1083, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1084, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1085, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1086, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1087, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1088, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1089, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1090, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1091, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1092, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1093, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1094, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1095, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1096, 5, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1097, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1098, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1099, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1100, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1101, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1102, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1103, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1104, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1105, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1106, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1107, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1108, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1109, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1110, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1111, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1112, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1113, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1114, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1115, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1116, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1117, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1118, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1119, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1120, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1121, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1122, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1123, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1124, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1125, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1126, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1127, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1128, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1129, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1130, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1131, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1132, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1133, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1134, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1135, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1136, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1137, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1138, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1139, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1140, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1141, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1142, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1143, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1144, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1145, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1146, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1147, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1148, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1149, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1150, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1151, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1152, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1153, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1154, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1155, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1156, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1157, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1158, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1159, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1160, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1161, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1162, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1163, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1164, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1165, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1166, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1167, 6, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)

INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1168, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1169, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1170, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1171, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1172, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1173, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1174, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1175, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1176, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1177, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1178, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1179, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1180, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1181, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1182, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1183, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1184, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1185, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1186, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1187, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1188, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1189, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1190, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1191, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1192, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1193, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 26)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1194, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 27)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1195, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 28)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1196, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 29)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1197, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1198, 1, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1199, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1200, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1201, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1202, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1203, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1204, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1205, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1206, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1207, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1208, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1209, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1210, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1211, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1212, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1213, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1214, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1215, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1216, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1217, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1218, 7, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1219, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1220, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1221, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1222, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1223, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1224, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1225, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1226, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1227, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1228, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1229, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1230, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1231, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1232, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1233, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1234, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 21)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1235, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1236, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 23)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1237, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 24)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1238, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1239, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Machine_Shedule] ([RowId], [CropId], [EnterdDate], [MachineId]) VALUES (1240, 8, CAST(N'2016-07-01 00:00:00.000' AS DateTime), 31)
SET IDENTITY_INSERT [dbo].[Machine_Shedule] OFF
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (1, N'Withering           ', 12)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (2, N'Rolling             ', 0.3)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (3, N'Roll Breaking       ', 0.2)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (4, N'Fermentation        ', 1.5)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (5, N'Drying              ', 0.21)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (6, N'Sifting             ', 8)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (7, N'Color Sorting       ', 0.05)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (8, N'Packing             ', 0)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (9, N'Transportation      ', 0)
INSERT [dbo].[Process_Details] ([ProcessId], [ProcessName], [RequiredProcessTime]) VALUES (10, N'Spreading           ', 0)
SET IDENTITY_INSERT [dbo].[Process_Shedule] ON 

INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (139, 1, 1, 6, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (140, 1, 2, 7, 113, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (141, 1, 3, 5, 90, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (142, 1, 5, 1, 53, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (143, 1, 6, 10, 45, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (144, 1, 7, 2, 79, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (145, 2, 1, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (146, 2, 2, 7, 17, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (147, 2, 3, 5, 14, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (148, 2, 5, 1, 8, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (149, 2, 6, 7, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (150, 2, 7, 2, 12, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (151, 3, 1, 4, 4, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (152, 3, 2, 7, 55, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (153, 3, 3, 5, 44, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (154, 3, 5, 1, 26, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (155, 3, 6, 10, 22, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (156, 3, 7, 2, 39, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (157, 4, 1, 2, 2, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (158, 4, 2, 7, 19, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (159, 4, 3, 5, 15, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (160, 4, 5, 1, 9, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (161, 4, 6, 8, 8, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (162, 4, 7, 2, 13, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (163, 5, 1, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (164, 5, 2, 7, 10, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (165, 5, 3, 5, 8, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (166, 5, 5, 1, 5, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (167, 5, 6, 4, 4, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (168, 5, 7, 2, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (169, 1, 1, 6, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (170, 1, 2, 7, 113, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (171, 1, 3, 5, 90, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (172, 1, 5, 1, 53, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (173, 1, 6, 10, 45, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (174, 1, 7, 2, 79, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (175, 1, 1, 6, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (176, 1, 2, 7, 113, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (177, 1, 3, 5, 90, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (178, 1, 5, 1, 53, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (179, 1, 6, 10, 45, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (180, 1, 7, 2, 79, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (181, 6, 1, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (182, 6, 2, 2, 2, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (183, 6, 3, 2, 2, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (184, 6, 5, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (185, 6, 6, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (186, 6, 7, 2, 2, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (187, 1, 1, 6, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (188, 1, 2, 7, 113, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (189, 1, 3, 5, 90, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (190, 1, 5, 1, 53, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (191, 1, 6, 10, 45, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (192, 1, 7, 2, 79, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (193, 7, 1, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (194, 7, 2, 7, 10, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (195, 7, 3, 5, 8, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (196, 7, 5, 1, 5, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (197, 7, 6, 4, 4, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (198, 7, 7, 2, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (199, 8, 1, 1, 1, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (200, 8, 2, 7, 14, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (201, 8, 3, 5, 11, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (202, 8, 5, 1, 7, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (203, 8, 6, 6, 6, CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Process_Shedule] ([RowId], [CropId], [ProcessId], [MachineCount], [ProcessCount], [EnterdDate]) VALUES (204, 8, 7, 2, 10, CAST(N'2016-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[Process_Shedule] OFF
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (0, N'Supplier04                                                                                                                                                                                              ', N'12345678       ')
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (1, N'Unassigned                                                                                                                                                                                              ', NULL)
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (2, N'supplier1                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (3, N'supplier2                                                                                                                                                                                               ', NULL)
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (43, N'ewewe                                                                                                                                                                                                   ', N'213            ')
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (123, N'chamoh                                                                                                                                                                                                  ', N'122323         ')
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (323, N'rtrtttrtr                                                                                                                                                                                               ', N'2323           ')
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (43243, N'werwerr                                                                                                                                                                                                 ', N'232            ')
INSERT [dbo].[Supplier_Details] ([SupplierId], [SupplierName], [ContactNumber]) VALUES (323243, N'wewewe                                                                                                                                                                                                  ', N'212            ')
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'chamodh')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (2, N'prashan')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (3, N'testUser')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2016-06-21 18:39:08.983' AS DateTime), NULL, 1, CAST(N'2016-06-23 13:09:16.883' AS DateTime), 0, N'AP8hWVfSKjm2u+qzYZyHlvvdRU3kT8aCKQAaIAavTbpi/k3oOtSLvRGQ/rbvDBRC0A==', CAST(N'2016-06-21 18:39:08.983' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(N'2016-06-21 18:39:28.087' AS DateTime), NULL, 1, CAST(N'2016-07-01 10:30:58.350' AS DateTime), 0, N'AOkEnKPK8TJ3OwijYmHijQ8IcibArdhVeJJp3sk0ntU57sGLtX9wnyURiw2JSNMIJg==', CAST(N'2016-07-01 10:27:52.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(N'2016-07-01 10:29:16.667' AS DateTime), NULL, 1, NULL, 0, N'AATHOGzfg+x540SoW3w1tenwR4f8QpRlf5ucrM2WWBenP6eyaz357FZCgToewOf/oA==', CAST(N'2016-07-01 10:29:16.667' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'AdminUser')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'EmployeeUser')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
SET ANSI_PADDING ON


/****** Object:  Index [UQ__UserProf__C9F2845669C89572]    Script Date: 7/1/2016 8:03:43 PM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

SET ANSI_PADDING ON


/****** Object:  Index [UQ__webpages__8A2B6160C2083141]    Script Date: 7/1/2016 8:03:43 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

ALTER TABLE [dbo].[Crop_Details]  WITH CHECK ADD FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier_Details] ([SupplierId])

ALTER TABLE [dbo].[Employee_Shedule]  WITH CHECK ADD FOREIGN KEY([CropId])
REFERENCES [dbo].[Crop_Details] ([CropId])

ALTER TABLE [dbo].[Employee_Shedule]  WITH CHECK ADD FOREIGN KEY([ProcessId])
REFERENCES [dbo].[Process_Details] ([ProcessId])

ALTER TABLE [dbo].[Machine_Details]  WITH CHECK ADD FOREIGN KEY([ProcessId])
REFERENCES [dbo].[Process_Details] ([ProcessId])

ALTER TABLE [dbo].[Machine_Shedule]  WITH CHECK ADD FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine_Details] ([MachineId])

ALTER TABLE [dbo].[Machine_Shedule]  WITH CHECK ADD FOREIGN KEY([CropId])
REFERENCES [dbo].[Crop_Details] ([CropId])

ALTER TABLE [dbo].[Process_Shedule]  WITH CHECK ADD FOREIGN KEY([CropId])
REFERENCES [dbo].[Crop_Details] ([CropId])

ALTER TABLE [dbo].[Process_Shedule]  WITH CHECK ADD FOREIGN KEY([ProcessId])
REFERENCES [dbo].[Process_Details] ([ProcessId])

ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]

ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]

USE [master]

ALTER DATABASE [Production_Management_System] SET  READ_WRITE 


 COMMIT TRAN

END TRY

BEGIN CATCH

ROLLBACK TRAN
SELECT ERROR_MESSAGE()

END CATCH
