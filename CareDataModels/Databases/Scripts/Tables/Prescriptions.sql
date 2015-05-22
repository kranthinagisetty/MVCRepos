
/********************************* Start Table: Prescriptions *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prescriptions_HospitalId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prescriptions]'))
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_Prescriptions_HospitalId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prescriptions]') AND type in (N'U'))
DROP TABLE [dbo].[Prescriptions]
GO

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

/********************************* End Table: Prescriptions *********************************/

