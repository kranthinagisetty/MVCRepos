
/******************************* Start: Drop Constraints *****************************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VideosToPatients_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[VideosToPatients]'))
ALTER TABLE [dbo].[VideosToPatients] DROP CONSTRAINT [FK_VideosToPatients_VideoId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PK_VideosToPatients_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[VideosToPatients]'))
ALTER TABLE [dbo].[VideosToPatients] DROP CONSTRAINT [PK_VideosToPatients_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feedback_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feedback]'))
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK_Feedback_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feedback_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feedback]'))
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK_Feedback_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotifications_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotifications]'))
ALTER TABLE [dbo].[PatientNotifications] DROP CONSTRAINT [FK_PatientNotifications_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotificationsToStaff_PatientNotificationId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]'))
ALTER TABLE [dbo].[PatientNotificationsToStaff] DROP CONSTRAINT [FK_PatientNotificationsToStaff_PatientNotificationId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotificationsToStaff_StaffId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]'))
ALTER TABLE [dbo].[PatientNotificationsToStaff] DROP CONSTRAINT [FK_PatientNotificationsToStaff_StaffId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientToDoctor_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]'))
ALTER TABLE [dbo].[PatientToDoctor] DROP CONSTRAINT [FK_PatientToDoctor_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientToDoctor_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]'))
ALTER TABLE [dbo].[PatientToDoctor] DROP CONSTRAINT [FK_PatientToDoctor_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecords_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecords]'))
ALTER TABLE [dbo].[MedicalRecords] DROP CONSTRAINT [FK_MedicalRecords_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecords_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecords]'))
ALTER TABLE [dbo].[MedicalRecords] DROP CONSTRAINT [FK_MedicalRecords_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecordsToDoctors_MedicalRecordId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]'))
ALTER TABLE [dbo].[MedicalRecordsToDoctors] DROP CONSTRAINT [FK_MedicalRecordsToDoctors_MedicalRecordId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PK_MedicalRecordsToDoctors_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]'))
ALTER TABLE [dbo].[MedicalRecordsToDoctors] DROP CONSTRAINT [PK_MedicalRecordsToDoctors_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToDoctor_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]'))
ALTER TABLE [dbo].[HospitalToDoctor] DROP CONSTRAINT [FK_HospitalToDoctor_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Admins_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Admins]'))
ALTER TABLE [dbo].[Admins] DROP CONSTRAINT [FK_Admins_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Staff_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Staff]'))
ALTER TABLE [dbo].[Staff] DROP CONSTRAINT [FK_Staff_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToDoctor_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]'))
ALTER TABLE [dbo].[HospitalToDoctor] DROP CONSTRAINT [FK_HospitalToDoctor_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToPatient_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]'))
ALTER TABLE [dbo].[HospitalToPatient] DROP CONSTRAINT [FK_HospitalToPatient_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToPatient_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]'))
ALTER TABLE [dbo].[HospitalToPatient] DROP CONSTRAINT [FK_HospitalToPatient_PatientId]
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotifications_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotifications]'))
ALTER TABLE [dbo].[DoctorNotifications] DROP CONSTRAINT [FK_DoctorNotifications_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotificationsToStaff_DoctorNotificationId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]'))
ALTER TABLE [dbo].[DoctorNotificationsToStaff] DROP CONSTRAINT [FK_DoctorNotificationsToStaff_DoctorNotificationId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotificationsToStaff_StaffId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]'))
ALTER TABLE [dbo].[DoctorNotificationsToStaff] DROP CONSTRAINT [FK_DoctorNotificationsToStaff_StaffId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_HospitalId]
GO

/******************************* End: Drop Constraints *****************************************/

/******************************* End: Drop Tables **********************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppointmentsToStaff]') AND type in (N'U'))
DROP TABLE [dbo].[AppointmentsToStaff]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Appointments]') AND type in (N'U'))
DROP TABLE [dbo].[Appointments]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]') AND type in (N'U'))
DROP TABLE [dbo].[DoctorNotificationsToStaff]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorNotifications]') AND type in (N'U'))
DROP TABLE [dbo].[DoctorNotifications]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalToPatient]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalToDoctor]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]') AND type in (N'U'))
DROP TABLE [dbo].[MedicalRecordsToDoctors]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hospitals]') AND type in (N'U'))
DROP TABLE [dbo].[Hospitals]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicalRecords]') AND type in (N'U'))
DROP TABLE [dbo].[MedicalRecords]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]') AND type in (N'U'))
DROP TABLE [dbo].[PatientToDoctor]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Videos]') AND type in (N'U'))
DROP TABLE [dbo].[Videos]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VideosToPatients]') AND type in (N'U'))
DROP TABLE [dbo].[VideosToPatients]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]') AND type in (N'U'))
DROP TABLE [dbo].[PatientNotificationsToStaff]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientNotifications]') AND type in (N'U'))
DROP TABLE [dbo].[PatientNotifications]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prescriptions]') AND type in (N'U'))
DROP TABLE [dbo].[Prescriptions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctors]') AND type in (N'U'))
DROP TABLE [dbo].[Doctors]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type in (N'U'))
DROP TABLE [dbo].[Feedback]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
DROP TABLE [dbo].[Staff]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patients]') AND type in (N'U'))
DROP TABLE [dbo].[Patients]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admins]') AND type in (N'U'))
DROP TABLE [dbo].[Admins]
GO

/******************************* End: Drop Tables **********************************************/

/********************************* Start Table: Roles *********************************/

create table Roles
(
RoleId int not null,
Name nvarchar(20),
Description nvarchar(50)
)

alter table Roles 
add constraint PK_Roles primary key(RoleId)

alter table Roles 
add constraint CK_Roles_Name unique(Name)

/********************************* End Table: Roles *********************************/


/********************************* Start Table: Hospitals *********************************************/

create table Hospitals
(
HospitalId int identity(1,1),
HospitalDisplayId nvarchar(20) not null,
Name nvarchar(255) not null,
IsActive bit default(1),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Hospitals
add constraint PK_Hospitals primary key(HospitalId)

alter table Hospitals
add constraint CK_Hospitals_HospitalDisplayID unique(HospitalDisplayID)

/********************************* End Table: Hospitals *****************************************/

/********************************* Start Table: Admin *********************************/

create table Admins
(
AdminID int identity(1,1),
HospitalID int not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(2),
Email nvarchar(50),
Phone nvarchar(20) not null unique,
Gender bit default(1),
FailedLoginAttempts int default(0),
IsActive bit default(1),
IsLocked bit default(0),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Admins
add constraint PK_Admin primary key(AdminID)

alter table Admins
add constraint FK_Admins_HospitalID foreign key(HospitalID)
references Hospitals(HospitalID)

create unique nonclustered index Idx_Admins_UserName on Admins(UserName)

/********************************* End Table: Admin ********************************************/

/********************************* Start Table: Doctors ****************************************/

create table Doctors
(
DoctorID int identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As 'Dr. ' + Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
Specialization nvarchar(50),
RoleId int default(8),
Phone nvarchar(20) not null unique,
Email nvarchar(50),
Gender bit default(1),
FailedLoginAttempts int default(0),
IsActive bit default(1),
IsLocked bit default(0),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Doctors
add constraint PK_Doctors primary key(DoctorID)

create unique nonclustered index Idx_Doctors_UserName on Doctors(UserName)

/********************************* End Table: Doctors *********************************/

/********************************* Start Table: Staff *********************************/

create table Staff
(
StaffID int identity(1,1),
HospitalID int not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(4),
Email nvarchar(50),
Phone nvarchar(20) not null unique,
Gender bit default(1),
FailedLoginAttempts int default(0),
IsActive bit default(1),
IsLocked bit default(0),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Staff
add constraint PK_Staff primary key(StaffID)

alter table Staff
add constraint FK_Staff_HospitalID foreign key(HospitalID)
references Hospitals(HospitalID)

create unique nonclustered index Idx_Staff_UserName on Staff(UserName) 

/********************************* End Table: Staff **************************************/

/********************************* Start Table: Patients *********************************/

create table Patients
(
PatientID int identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(16),
Profession nvarchar(20),
DOB datetime,
Age As datediff(year, coalesce(DOB, getdate()), getdate()) ,
Phone nvarchar(20) not null unique,
Email nvarchar(50),
Gender bit default(1),
FailedLoginAttempts int default(0),
IsActive bit default(1),
IsLocked bit default(0),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Patients
add constraint PK_Patients primary key(PatientID)

create unique nonclustered index Idx_Patients_UserName on Patients(UserName) 

/********************************* End Table: Patients ***********************************/

/********************************* Start Table: Feedback *********************************/

create table Feedback
(
FeedbackId int identity(1,1),
FeedbackText nvarchar(255),
DoctorId int not null,
PatientId int not null,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Feedback
add constraint PK_Feedback primary key(FeedbackId)

alter table Feedback
add constraint FK_Feedback_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

alter table Feedback
add constraint FK_Feedback_PatientId foreign key(PatientId)
references Patients(PatientId)


/********************************* End Table: Feedback ****************************************/

/********************************* Start Table: Prescriptions *********************************/

create table Prescriptions
(
PrescriptionId int identity(1,1),
PrescriptionName nvarchar(50),
PrescriptionText nvarchar(500),
PrescriptionImage image,
ImageExtension nvarchar(50),
DoctorId int not null,
PatientId int not null,
HospitalId int not null,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate(),
AddedBy nvarchar(20),
UpdatedBy nvarchar(20)
)

alter table Prescriptions
add constraint PK_Prescriptions primary key(PrescriptionId)

alter table Prescriptions
add constraint FK_Prescriptions_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

alter table Prescriptions
add constraint FK_Prescriptions_PatientId foreign key(PatientId)
references Patients(PatientId)

alter table Prescriptions
add constraint FK_Prescriptions_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

/********************************* End Table: Prescriptions ******************************************/

/********************************* Start Table: PatientNotifications *********************************/

create table PatientNotifications
(
PatientNotificationId int identity(1,1),
NotificationText nvarchar(255),
NotificationTime datetime not null,
PatientId int not null,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table PatientNotifications
add constraint PK_PatientNotifications primary key(PatientNotificationId)

alter table PatientNotifications
add constraint FK_PatientNotifications_PatientId foreign key(PatientId)
references Patients(PatientId)

/********************************* Start Table: PatientNotifications ****************************************/

/********************************* Start Table: PatientNotificationsToStaff *********************************/

create table PatientNotificationsToStaff
(
PatientNotificationId int not null,
StaffId int not null
)

alter table PatientNotificationsToStaff
add constraint PK_PatientNotificationsToStaff primary key(PatientNotificationId, StaffId)

alter table PatientNotificationsToStaff
add constraint FK_PatientNotificationsToStaff_PatientNotificationId foreign key(PatientNotificationId)
references PatientNotifications(PatientNotificationId)

alter table PatientNotificationsToStaff
add constraint FK_PatientNotificationsToStaff_StaffId foreign key(StaffId)
references Staff(StaffId)

/********************************* End Table: PatientNotifications *********************************/

/********************************* Start Table: Videos *********************************************/

create table Videos
(
VideoId int identity(1,1),
Description nvarchar(255),
VideoLink nvarchar(500),
HospitalId int,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate(),
AddedBy nvarchar(20),
UpdatedBy nvarchar(20)
)

alter table Videos
add constraint PK_Videos primary key(VideoId)

alter table Videos
add constraint FK_Videos_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

/********************************* End Table: Videos *********************************************************/

/********************************* Start Table: VideosToPatients *********************************************/

create table VideosToPatients
(
VideoId int not null,
PatientId int not null
)

alter table VideosToPatients
add constraint PK_VideosToPatients primary key(VideoId, PatientId)

alter table VideosToPatients
add constraint FK_VideosToPatients_VideoId foreign key(VideoId)
references Videos(VideoId)

alter table VideosToPatients
add constraint PK_VideosToPatients_PatientId foreign key(PatientId)
references Patients(PatientId)

/********************************* End Table: VideosToPatients ********************************************/

/********************************* Start Table: PatientToDoctor *******************************************/

create table PatientToDoctor
(
PatientId int not null,
DoctorId int not null
)

alter table PatientToDoctor
add constraint PK_PatientToDoctor primary key(PatientId, DoctorId)

alter table PatientToDoctor
add constraint FK_PatientToDoctor_PatientId foreign key(PatientId)
references Patients(PatientId)

alter table PatientToDoctor
add constraint FK_PatientToDoctor_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

/********************************* End Table: PatientToDoctor **********************************/

/********************************* Start Table: MedicalRecords *********************************/

create table MedicalRecords
(
MedicalRecordId int identity(1,1),
MedicalRecordName nvarchar(50) not null,
MedicalRecordImage image,
ImageExtension nvarchar(50),
PatientId int not null,
HospitalId int not null,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate(),
AddedBy nvarchar(20),
UpdatedBy nvarchar(20)
)

alter table MedicalRecords
add constraint PK_MedicalRecords primary key(MedicalRecordId)

alter table MedicalRecords
add constraint FK_MedicalRecords_PatientId foreign key(PatientId)
references Patients(PatientId)

alter table MedicalRecords
add constraint FK_MedicalRecords_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

/********************************* End Table: MedicalRecords ********************************************/

/********************************* Start Table: MedicalRecordsToDoctors *********************************/

create table MedicalRecordsToDoctors
(
MedicalRecordId int not null,
DoctorId int not null
)

alter table MedicalRecordsToDoctors
add constraint PK_MedicalRecordsToDoctors primary key(MedicalRecordId, DoctorId)

alter table MedicalRecordsToDoctors
add constraint FK_MedicalRecordsToDoctors_MedicalRecordId foreign key(MedicalRecordId)
references MedicalRecords(MedicalRecordId)

alter table MedicalRecordsToDoctors
add constraint PK_MedicalRecordsToDoctors_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

/********************************* End Table: MedicalRecordsToDoctors *********************************/

/********************************* Start Table: HospitalToDoctor *********************************/

create table HospitalToDoctor
(
HospitalId int not null,
DoctorId int not null,
)

alter table HospitalToDoctor
add constraint PK_HospitalToDoctor primary key(HospitalId, DoctorId)

alter table HospitalToDoctor
add constraint FK_HospitalToDoctor_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

alter table HospitalToDoctor
add constraint FK_HospitalToDoctor_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)


/********************************* End Table: HospitalToDoctor ************************************/

/********************************* Start Table: HospitalToPatient *********************************/

create table HospitalToPatient
(
HospitalId int not null,
PatientId int not null,
)

alter table HospitalToPatient
add constraint PK_HospitalToPatient primary key(HospitalId, PatientId)

alter table HospitalToPatient
add constraint FK_HospitalToPatient_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

alter table HospitalToPatient
add constraint FK_HospitalToPatient_PatientId foreign key(PatientId)
references Patients(PatientId)


/********************************* End Table: HospitalToPatient *************************************/

/********************************* Start Table: DoctorNotifications *********************************/

create table DoctorNotifications
(
DoctorNotificationId int identity(1,1),
NotificationText nvarchar(255),
NotificationTime datetime not null,
DoctorId int not null,
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table DoctorNotifications
add constraint PK_DoctorNotifications primary key(DoctorNotificationId)

alter table DoctorNotifications
add constraint FK_DoctorNotifications_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

/********************************* End Table: DoctorNotifications ******************************************/

/********************************* Start Table: DoctorNotificationsToStaff *********************************/

create table DoctorNotificationsToStaff
(
DoctorNotificationId int not null,
StaffId int not null
)

alter table DoctorNotificationsToStaff
add constraint PK_DoctorNotificationsToStaff primary key(DoctorNotificationId, StaffId)

alter table DoctorNotificationsToStaff
add constraint FK_DoctorNotificationsToStaff_DoctorNotificationId foreign key(DoctorNotificationId)
references DoctorNotifications(DoctorNotificationId)

alter table DoctorNotificationsToStaff
add constraint FK_DoctorNotificationsToStaff_StaffId foreign key(StaffId)
references Staff(StaffId)


/********************************* End Table: DoctorNotificationsToStaff *********************************/

/********************************* Start Table: Appointments *********************************************/

create table Appointments
(
AppointmentId int identity(1,1),
AppointmentDate datetime not null,
PatientId int not null,
DoctorId int not null,
HospitalId int not null,
IsApproved bit default(0),
IsCancelled bit default(0),
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate(),
AddedBy nvarchar(20),
UpdatedBy nvarchar(20)
)

alter table Appointments
add constraint PK_Appointments primary key(AppointmentId)

alter table Appointments
add constraint FK_Appointments_PatientId foreign key(PatientId)
references Patients(PatientId)

alter table Appointments
add constraint FK_Appointments_DoctorId foreign key(DoctorId)
references Doctors(DoctorId)

alter table Appointments
add constraint FK_Appointments_HospitalId foreign key(HospitalId)
references Hospitals(HospitalId)

/********************************* End Table: Appointments ******************************************/

/********************************* Start: Static Data ****************************************************/

insert into Roles(RoleId, Name, Description) values
 (1, 'SuperAdmin', 'Can create Admins')
,(2, 'Admin', 'Can create Staff')
,(4, 'Staff', 'Can create Patients & Doctors')
,(8, 'Doctor', 'Can access Patients and Resources')
,(16, 'Patient', 'Can access his/her resources')
go

set identity_insert Hospitals on
INSERT INTO [Hospitals]([HospitalId],[HospitalDisplayId],[Name],[AddressLine1],[AddressLine2],[City],[State],[ZipCode])
VALUES(-1, 'AllHospitals','AllHospitals','AddressLine1','AddressLine2','City','State',999999)
GO
set identity_insert Hospitals off

insert into Admins([HospitalID],[FirstName],[LastName],[UserName],[Password],[RoleId],[Email],[Phone],[AddressLine1],[AddressLine2],[City],[State],[ZipCode])
values (-1,'super','admin','superadmin','superadmin',1,'super@admin.com','9999999999','AddressLine1','AddressLine2','City','State',999999)

/********************************* End: Static Data ****************************************************/