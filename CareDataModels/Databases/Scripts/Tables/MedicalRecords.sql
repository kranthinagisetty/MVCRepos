
/********************************* Start Table: MedicalRecords *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecords_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecords]'))
ALTER TABLE [dbo].[MedicalRecords] DROP CONSTRAINT [FK_MedicalRecords_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecords_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecords]'))
ALTER TABLE [dbo].[MedicalRecords] DROP CONSTRAINT [FK_MedicalRecords_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicalRecords]') AND type in (N'U'))
DROP TABLE [dbo].[MedicalRecords]
GO

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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedicalRecordsToDoctors_MedicalRecordId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]'))
ALTER TABLE [dbo].[MedicalRecordsToDoctors] DROP CONSTRAINT [FK_MedicalRecordsToDoctors_MedicalRecordId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PK_MedicalRecordsToDoctors_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]'))
ALTER TABLE [dbo].[MedicalRecordsToDoctors] DROP CONSTRAINT [PK_MedicalRecordsToDoctors_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicalRecordsToDoctors]') AND type in (N'U'))
DROP TABLE [dbo].[MedicalRecordsToDoctors]
GO

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