

/********************************* Start Table: Feedback *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feedback_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feedback]'))
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK_Feedback_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feedback_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feedback]'))
ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK_Feedback_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type in (N'U'))
DROP TABLE [dbo].[Feedback]
GO

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


/********************************* End Table: Feedback *********************************/
