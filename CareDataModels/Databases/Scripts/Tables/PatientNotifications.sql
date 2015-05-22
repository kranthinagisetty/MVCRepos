

/********************************* Start Table: PatientNotifications *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotifications_PatientId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotifications]'))
ALTER TABLE [dbo].[PatientNotifications] DROP CONSTRAINT [FK_PatientNotifications_PatientId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientNotifications]') AND type in (N'U'))
DROP TABLE [dbo].[PatientNotifications]
GO

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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotificationsToStaff_PatientNotificationId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]'))
ALTER TABLE [dbo].[PatientNotificationsToStaff] DROP CONSTRAINT [FK_PatientNotificationsToStaff_PatientNotificationId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientNotificationsToStaff_StaffId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]'))
ALTER TABLE [dbo].[PatientNotificationsToStaff] DROP CONSTRAINT [FK_PatientNotificationsToStaff_StaffId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientNotificationsToStaff]') AND type in (N'U'))
DROP TABLE [dbo].[PatientNotificationsToStaff]
GO

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



