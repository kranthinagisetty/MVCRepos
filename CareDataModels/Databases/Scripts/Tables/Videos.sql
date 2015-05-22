
/********************************* Start Table: Videos *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Videos]') AND type in (N'U'))
DROP TABLE [dbo].[Videos]
GO

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

/********************************* End Table: Videos *********************************************/

/********************************* Start Table: VideosToPatients *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VideosToPatients_VideoId]') AND parent_object_id = OBJECT_ID(N'[dbo].[VideosToPatients]'))
ALTER TABLE [dbo].[VideosToPatients] DROP CONSTRAINT [FK_VideosToPatients_VideoId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[PK_VideosToPatients_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[VideosToPatients]'))
ALTER TABLE [dbo].[VideosToPatients] DROP CONSTRAINT [PK_VideosToPatients_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VideosToPatients]') AND type in (N'U'))
DROP TABLE [dbo].[VideosToPatients]
GO

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

/********************************* End Table: VideosToPatients *********************************/