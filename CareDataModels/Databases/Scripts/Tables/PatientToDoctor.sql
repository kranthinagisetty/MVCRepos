

/********************************* Start Table: PatientToDoctor *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientToDoctor_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]'))
ALTER TABLE [dbo].[PatientToDoctor] DROP CONSTRAINT [FK_PatientToDoctor_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientToDoctor_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]'))
ALTER TABLE [dbo].[PatientToDoctor] DROP CONSTRAINT [FK_PatientToDoctor_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientToDoctor]') AND type in (N'U'))
DROP TABLE [dbo].[PatientToDoctor]
GO

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

/********************************* End Table: PatientToDoctor *********************************/