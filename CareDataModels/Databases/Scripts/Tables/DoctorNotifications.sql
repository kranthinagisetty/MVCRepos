

/********************************* Start Table: DoctorNotifications *********************************/

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotifications_DoctorId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotifications]'))
ALTER TABLE [dbo].[DoctorNotifications] DROP CONSTRAINT [FK_DoctorNotifications_DoctorId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorNotifications]') AND type in (N'U'))
DROP TABLE [dbo].[DoctorNotifications]
GO

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

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotificationsToStaff_DoctorNotificationId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]'))
ALTER TABLE [dbo].[DoctorNotificationsToStaff] DROP CONSTRAINT [FK_DoctorNotificationsToStaff_DoctorNotificationId]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DoctorNotificationsToStaff_StaffId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]'))
ALTER TABLE [dbo].[DoctorNotificationsToStaff] DROP CONSTRAINT [FK_DoctorNotificationsToStaff_StaffId]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoctorNotificationsToStaff]') AND type in (N'U'))
DROP TABLE [dbo].[DoctorNotificationsToStaff]
GO

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




