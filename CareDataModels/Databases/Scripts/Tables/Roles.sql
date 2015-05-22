
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO

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

insert into Roles(RoleId, Name, Description) values
 (1, 'SuperAdmin', 'Can create Admins')
,(2, 'Admin', 'Can create Staff')
,(4, 'Staff', 'Can create Patients & Doctors')
,(8, 'Doctor', 'Can access Patients and Resources')
,(16, 'Patient', 'Can access his/her resources')
go

