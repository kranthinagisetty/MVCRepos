

/********************************* Start Table: Hospitals *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hospitals]') AND type in (N'U'))
DROP TABLE [dbo].[Hospitals]
GO

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

/********************************* Start Table: HospitalToDoctor *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToDoctor_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]'))
ALTER TABLE [dbo].[HospitalToDoctor] DROP CONSTRAINT [FK_HospitalToDoctor_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToDoctor_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]'))
ALTER TABLE [dbo].[HospitalToDoctor] DROP CONSTRAINT [FK_HospitalToDoctor_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Admins_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Admins]'))
ALTER TABLE [dbo].[Admins] DROP CONSTRAINT [FK_Admins_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Staff_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Staff]'))
ALTER TABLE [dbo].[Staff] DROP CONSTRAINT [FK_Staff_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalToDoctor]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalToDoctor]
GO

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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToPatient_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]'))
ALTER TABLE [dbo].[HospitalToPatient] DROP CONSTRAINT [FK_HospitalToPatient_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HospitalToPatient_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]'))
ALTER TABLE [dbo].[HospitalToPatient] DROP CONSTRAINT [FK_HospitalToPatient_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HospitalToPatient]') AND type in (N'U'))
DROP TABLE [dbo].[HospitalToPatient]
GO

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


/********************************* End Table: HospitalToPatient *********************************/