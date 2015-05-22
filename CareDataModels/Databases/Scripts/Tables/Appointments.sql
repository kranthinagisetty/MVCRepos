

/********************************* Start Table: Appointments *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Appointments_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Appointments]'))
ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_Appointments_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Appointments]') AND type in (N'U'))
DROP TABLE [dbo].[Appointments]
GO

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

--/********************************* Start Table: AppointmentsToStaff *********************************/

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AppointmentsToStaff_AppointmentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AppointmentsToStaff]'))
--ALTER TABLE [dbo].[AppointmentsToStaff] DROP CONSTRAINT [FK_AppointmentsToStaff_AppointmentId]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AppointmentsToStaff_StaffId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AppointmentsToStaff]'))
--ALTER TABLE [dbo].[AppointmentsToStaff] DROP CONSTRAINT [FK_AppointmentsToStaff_StaffId]
--GO

--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppointmentsToStaff]') AND type in (N'U'))
--DROP TABLE [dbo].[AppointmentsToStaff]
--GO

--create table AppointmentsToStaff
--(
--AppointmentId int not null,
--StaffId int not null
--)

--alter table AppointmentsToStaff
--add constraint PK_AppointmentsToStaff primary key(AppointmentId)

--alter table AppointmentsToStaff
--add constraint FK_AppointmentsToStaff_AppointmentId foreign key(AppointmentId)
--references Appointments(AppointmentId)

--alter table AppointmentsToStaff
--add constraint FK_AppointmentsToStaff_StaffId foreign key(StaffId)
--references Staff(StaffId)

--/********************************* End Table: AppointmentsToStaff *********************************/