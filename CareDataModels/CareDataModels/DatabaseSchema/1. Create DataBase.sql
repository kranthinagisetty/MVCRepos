USE [master]
GO
/****** Object:  Database [CareApp]    Script Date: 10/20/2014 7:17:03 PM ******/
CREATE DATABASE [CareApp] ON  PRIMARY 
( NAME = N'CareApp', FILENAME = N'D:\SQL SERVER DATABASES\DATA\CareApp.mdf' , SIZE = 22528KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CareApp_log', FILENAME = N'D:\SQL SERVER DATABASES\DATA\CareApp_log.ldf' , SIZE = 24384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CareApp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CareApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CareApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CareApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CareApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CareApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CareApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [CareApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CareApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CareApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CareApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CareApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CareApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CareApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CareApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CareApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CareApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CareApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CareApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CareApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CareApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CareApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CareApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CareApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CareApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CareApp] SET RECOVERY FULL 
GO
ALTER DATABASE [CareApp] SET  MULTI_USER 
GO
ALTER DATABASE [CareApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CareApp] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CareApp', N'ON'
GO
USE [CareApp]
GO
/****** Object:  StoredProcedure [dbo].[GetDisplayID]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetDisplayID](@idtype varchar(30), @displayId varchar(30) output)
as
begin

declare @id int
--begin tran

select @id = PropertyValue + 1
from DisplayIDs
where PropertyName = @idtype

Update DisplayIDs
Set PropertyValue = @id
where PropertyName = @idtype

--end tran

select 
@displayId = 
case
when @idtype = 'AdminDisplayId' then 'AA'
when @idtype = 'StaffDisplayId' then 'SA'
when @idtype = 'PatientDisplayId' then 'PA'
when @idtype = 'DoctorDisplayId' then 'DR'
end
 + Right('000000' + CONVERT(NVARCHAR, @id), 6) 

end

GO
/****** Object:  Table [dbo].[Admins]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FullName]  AS ((coalesce([FirstName],'')+' ')+coalesce([LastName],'')),
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[RoleId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](20) NULL,
	[FailedLoginAttempts] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[IsApproved] [bit] NULL,
	[IsCancelled] [bit] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[AddedBy] [nvarchar](20) NULL,
	[UpdatedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisplayIDs]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisplayIDs](
	[PropertyName] [varchar](30) NOT NULL,
	[PropertyValue] [int] NOT NULL,
 CONSTRAINT [PK_DisplayIDs] PRIMARY KEY CLUSTERED 
(
	[PropertyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoctorNotifications]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorNotifications](
	[DoctorNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationText] [nvarchar](255) NULL,
	[NotificationTime] [datetime] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DoctorNotifications] PRIMARY KEY CLUSTERED 
(
	[DoctorNotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorNotificationsToStaff]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorNotificationsToStaff](
	[DoctorNotificationId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
 CONSTRAINT [PK_DoctorNotificationsToStaff] PRIMARY KEY CLUSTERED 
(
	[DoctorNotificationId] ASC,
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FullName]  AS ((('Dr. '+coalesce([FirstName],''))+' ')+coalesce([LastName],'')),
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Specialization] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](20) NULL,
	[FailedLoginAttempts] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackText] [nvarchar](255) NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalDisplayId] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ImageContent] [image] NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [CK_Hospitals_HospitalDisplayID] UNIQUE NONCLUSTERED 
(
	[HospitalDisplayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HospitalToDoctor]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalToDoctor](
	[HospitalId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_HospitalToDoctor] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC,
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HospitalToPatient]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalToPatient](
	[HospitalId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_HospitalToPatient] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC,
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalRecords]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecords](
	[MedicalRecordId] [int] IDENTITY(1,1) NOT NULL,
	[MedicalRecordName] [nvarchar](50) NOT NULL,
	[MedicalRecordImage] [image] NULL,
	[ImageExtension] [nvarchar](50) NULL,
	[PatientId] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[AddedBy] [nvarchar](20) NULL,
	[UpdatedBy] [nvarchar](20) NULL,
	[DoctorID] [int] NULL,
 CONSTRAINT [PK_MedicalRecords] PRIMARY KEY CLUSTERED 
(
	[MedicalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalRecordsToDoctors]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecordsToDoctors](
	[MedicalRecordId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalRecordsToDoctors] PRIMARY KEY CLUSTERED 
(
	[MedicalRecordId] ASC,
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientNotifications]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientNotifications](
	[PatientNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationText] [nvarchar](255) NULL,
	[NotificationTime] [datetime] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_PatientNotifications] PRIMARY KEY CLUSTERED 
(
	[PatientNotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientNotificationsToStaff]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientNotificationsToStaff](
	[PatientNotificationId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
 CONSTRAINT [PK_PatientNotificationsToStaff] PRIMARY KEY CLUSTERED 
(
	[PatientNotificationId] ASC,
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FullName]  AS ((coalesce([FirstName],'')+' ')+coalesce([LastName],'')),
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[RoleId] [int] NULL,
	[Profession] [nvarchar](20) NULL,
	[DOB] [datetime] NULL,
	[Age]  AS (datediff(year,coalesce([DOB],getdate()),getdate())),
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](20) NULL,
	[FailedLoginAttempts] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ImageContent] [image] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientToDoctor]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientToDoctor](
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_PatientToDoctor] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionName] [nvarchar](50) NULL,
	[PrescriptionText] [nvarchar](500) NULL,
	[PrescriptionImage] [image] NULL,
	[ImageExtension] [nvarchar](50) NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[AddedBy] [nvarchar](20) NULL,
	[UpdatedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_Prescriptions] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [CK_Roles_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FullName]  AS ((coalesce([FirstName],'')+' ')+coalesce([LastName],'')),
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[RoleId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](20) NULL,
	[FailedLoginAttempts] [int] NULL,
	[IsActive] [bit] NULL,
	[IsLocked] [bit] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[ZipCode] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Videos]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[VideoLink] [nvarchar](500) NULL,
	[HospitalId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[AddedBy] [nvarchar](20) NULL,
	[UpdatedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pictures](
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
	[PictureContent] [image] NULL,
	[Description] [nvarchar](255) NULL,
	[HospitalId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [nvarchar](20) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO

ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO

ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO

ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_HospitalId]
GO

/****** Object:  Table [dbo].[VideosToPatients]    Script Date: 10/20/2014 7:17:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideosToPatients](
	[VideoId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_VideosToPatients] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC,
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Idx_Admins_UserName]    Script Date: 10/20/2014 7:17:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx_Admins_UserName] ON [dbo].[Admins]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Idx_Doctors_UserName]    Script Date: 10/20/2014 7:17:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx_Doctors_UserName] ON [dbo].[Doctors]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Idx_Patients_UserName]    Script Date: 10/20/2014 7:17:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx_Patients_UserName] ON [dbo].[Patients]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Idx_Staff_UserName]    Script Date: 10/20/2014 7:17:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx_Staff_UserName] ON [dbo].[Staff]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((2)) FOR [RoleId]
GO 
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((0)) FOR [FailedLoginAttempts]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Admins] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[DoctorNotifications] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[DoctorNotifications] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT ((8)) FOR [RoleId]
GO 
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT ((0)) FOR [FailedLoginAttempts]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Hospitals] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Hospitals] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Hospitals] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[MedicalRecords] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[MedicalRecords] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[PatientNotifications] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PatientNotifications] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT ((16)) FOR [RoleId]
GO 
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT ((0)) FOR [FailedLoginAttempts]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Patients] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((4)) FOR [RoleId]
GO 
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [FailedLoginAttempts]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Videos] ADD  DEFAULT (getutcdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Videos] ADD  DEFAULT (getutcdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_HospitalID] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_HospitalID]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_DoctorId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_HospitalId]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_PatientId]
GO
ALTER TABLE [dbo].[DoctorNotifications]  WITH CHECK ADD  CONSTRAINT [FK_DoctorNotifications_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[DoctorNotifications] CHECK CONSTRAINT [FK_DoctorNotifications_DoctorId]
GO
ALTER TABLE [dbo].[DoctorNotificationsToStaff]  WITH CHECK ADD  CONSTRAINT [FK_DoctorNotificationsToStaff_DoctorNotificationId] FOREIGN KEY([DoctorNotificationId])
REFERENCES [dbo].[DoctorNotifications] ([DoctorNotificationId])
GO
ALTER TABLE [dbo].[DoctorNotificationsToStaff] CHECK CONSTRAINT [FK_DoctorNotificationsToStaff_DoctorNotificationId]
GO
ALTER TABLE [dbo].[DoctorNotificationsToStaff]  WITH CHECK ADD  CONSTRAINT [FK_DoctorNotificationsToStaff_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[DoctorNotificationsToStaff] CHECK CONSTRAINT [FK_DoctorNotificationsToStaff_StaffId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_DoctorId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_PatientId]
GO
ALTER TABLE [dbo].[HospitalToDoctor]  WITH CHECK ADD  CONSTRAINT [FK_HospitalToDoctor_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[HospitalToDoctor] CHECK CONSTRAINT [FK_HospitalToDoctor_DoctorId]
GO
ALTER TABLE [dbo].[HospitalToDoctor]  WITH CHECK ADD  CONSTRAINT [FK_HospitalToDoctor_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[HospitalToDoctor] CHECK CONSTRAINT [FK_HospitalToDoctor_HospitalId]
GO
ALTER TABLE [dbo].[HospitalToPatient]  WITH CHECK ADD  CONSTRAINT [FK_HospitalToPatient_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[HospitalToPatient] CHECK CONSTRAINT [FK_HospitalToPatient_HospitalId]
GO
ALTER TABLE [dbo].[HospitalToPatient]  WITH CHECK ADD  CONSTRAINT [FK_HospitalToPatient_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[HospitalToPatient] CHECK CONSTRAINT [FK_HospitalToPatient_PatientId]
GO
ALTER TABLE [dbo].[MedicalRecords]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecords_DoctorsId] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[MedicalRecords] CHECK CONSTRAINT [FK_MedicalRecords_DoctorsId]
GO
ALTER TABLE [dbo].[MedicalRecords]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecords_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[MedicalRecords] CHECK CONSTRAINT [FK_MedicalRecords_HospitalId]
GO
ALTER TABLE [dbo].[MedicalRecords]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecords_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[MedicalRecords] CHECK CONSTRAINT [FK_MedicalRecords_PatientId]
GO
ALTER TABLE [dbo].[MedicalRecordsToDoctors]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecordsToDoctors_MedicalRecordId] FOREIGN KEY([MedicalRecordId])
REFERENCES [dbo].[MedicalRecords] ([MedicalRecordId])
GO
ALTER TABLE [dbo].[MedicalRecordsToDoctors] CHECK CONSTRAINT [FK_MedicalRecordsToDoctors_MedicalRecordId]
GO
ALTER TABLE [dbo].[MedicalRecordsToDoctors]  WITH CHECK ADD  CONSTRAINT [PK_MedicalRecordsToDoctors_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[MedicalRecordsToDoctors] CHECK CONSTRAINT [PK_MedicalRecordsToDoctors_DoctorId]
GO
ALTER TABLE [dbo].[PatientNotifications]  WITH CHECK ADD  CONSTRAINT [FK_PatientNotifications_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[PatientNotifications] CHECK CONSTRAINT [FK_PatientNotifications_PatientId]
GO
ALTER TABLE [dbo].[PatientNotificationsToStaff]  WITH CHECK ADD  CONSTRAINT [FK_PatientNotificationsToStaff_PatientNotificationId] FOREIGN KEY([PatientNotificationId])
REFERENCES [dbo].[PatientNotifications] ([PatientNotificationId])
GO
ALTER TABLE [dbo].[PatientNotificationsToStaff] CHECK CONSTRAINT [FK_PatientNotificationsToStaff_PatientNotificationId]
GO
ALTER TABLE [dbo].[PatientNotificationsToStaff]  WITH CHECK ADD  CONSTRAINT [FK_PatientNotificationsToStaff_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[PatientNotificationsToStaff] CHECK CONSTRAINT [FK_PatientNotificationsToStaff_StaffId]
GO
ALTER TABLE [dbo].[PatientToDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PatientToDoctor_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[PatientToDoctor] CHECK CONSTRAINT [FK_PatientToDoctor_DoctorId]
GO
ALTER TABLE [dbo].[PatientToDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PatientToDoctor_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[PatientToDoctor] CHECK CONSTRAINT [FK_PatientToDoctor_PatientId]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_DoctorId]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_HospitalId]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_PatientId]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_HospitalID] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_HospitalID]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_HospitalId]
GO
ALTER TABLE [dbo].[VideosToPatients]  WITH CHECK ADD  CONSTRAINT [FK_VideosToPatients_VideoId] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[VideosToPatients] CHECK CONSTRAINT [FK_VideosToPatients_VideoId]
GO
ALTER TABLE [dbo].[VideosToPatients]  WITH CHECK ADD  CONSTRAINT [PK_VideosToPatients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[VideosToPatients] CHECK CONSTRAINT [PK_VideosToPatients_PatientId]
GO
USE [master]
GO
ALTER DATABASE [CareApp] SET  READ_WRITE 
GO
/** Hari **/

GO
CREATE TABLE AppointmentSlots
(
AppointmentSlotsID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
DoctorID int FOREIGN KEY REFERENCES Doctors(DoctorID), 
SlotFrom nvarchar(50),
SlotTo nvarchar(50),
AddedOn datetime DEFAULT (getutcdate()),
UpdatedOn datetime DEFAULT (getutcdate())
) 
GO
CREATE TABLE DoctorAppointmentSchedule
(
ScheduleId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
DoctorID int FOREIGN KEY REFERENCES Doctors(DoctorID),
AppointmentSlotID int FOREIGN KEY REFERENCES AppointmentSlots(AppointmentSlotsID),
Timings_Slot varchar(100),
AddedOn datetime DEFAULT (getutcdate()),
UpdatedOn datetime DEFAULT (getutcdate()),
 IsSlotBooked bit
)
GO
CREATE TABLE DoctorAppointments
(
Id int  IDENTITY(1,1) NOT NULL PRIMARY KEY,
Hospitald int ,
ScheduleId int FOREIGN KEY REFERENCES DoctorAppointmentSchedule(ScheduleId),
PatientId int FOREIGN KEY REFERENCES Patients(patientId),
AppointmentDate datetime,
AddedOn datetime DEFAULT (getutcdate()),
UpdatedOn datetime DEFAULT (getutcdate())
)
GO
CREATE TABLE Settings
(
Id int NOT NULL PRIMARY KEY, 
AddedOn datetime DEFAULT (getutcdate()),
UpdatedOn datetime DEFAULT (getutcdate())
)
GO  
/* Triggers */
Create TRIGGER [dbo].[trg_AppointmentSlots_AfterInsert]
ON [dbo].[AppointmentSlots]
For  Insert 
as
set nocount on

	Update [AppointmentSlots]
	Set AddedOn = GETUTCDATE(), UpdatedOn=GETUTCDATE() 
	Where AppointmentSlotsID = (select record.AppointmentSlotsID from inserted record)	
	 set nocount off
Go
Create TRIGGER [dbo].[trg_DoctorAppointmentSchedule_AfterInsert]
ON [dbo].[DoctorAppointmentSchedule]
For  Insert 
as
set nocount on

	Update [DoctorAppointmentSchedule]
	Set AddedOn = GETUTCDATE(), UpdatedOn=GETUTCDATE() 
	Where ScheduleId = (select record.ScheduleId from inserted record)	
	 set nocount off

	 GO
	 Create TRIGGER [dbo].[trg_DoctorAppointments_AfterInsert]
ON [dbo].[DoctorAppointments]
For  Insert 
as
set nocount on

	Update [DoctorAppointments]
	Set AddedOn = GETUTCDATE(), UpdatedOn=GETUTCDATE() 
	Where Id = (select record.Id from inserted record)	
	 set nocount off
	 GO
	 GO

/****** Object:  Table [dbo].[Countries]    Script Date: 1/14/2015 8:08:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Districts](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](max) NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Districts] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Districts_dbo.States_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_dbo.Districts_dbo.States_StateId]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_dbo.States_dbo.Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_dbo.States_dbo.Countries_CountryId]
GO



CREATE TABLE [dbo].[SubRegions](
	[SubRegionId] [int] IDENTITY(1,1) NOT NULL,
	[SubRegionName] [nvarchar](max) NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SubRegions] PRIMARY KEY CLUSTERED 
(
	[SubRegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubRegions_dbo.Districts_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([DistrictId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_dbo.SubRegions_dbo.Districts_DistrictId]
GO