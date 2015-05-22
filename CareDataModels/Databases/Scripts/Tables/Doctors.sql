

/********************************* Start Table: Doctors *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctors]') AND type in (N'U'))
DROP TABLE [dbo].[Doctors]
GO

create table Doctors
(
DoctorID int identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As 'Dr. ' + Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
Specialization nvarchar(50),
RoleId int default(8),
Phone nvarchar(20) not null unique,
Gender bit default(1),
Email nvarchar(50),
FailedLoginAttempts int default(0),
IsActive bit default(1),
IsLocked bit default(0),
AddressLine1 nvarchar(100),
AddressLine2 nvarchar(100),
City nvarchar(20),
State nvarchar(20),
ZipCode int, 
AddedOn datetime default getutcdate(),
UpdatedOn datetime default getutcdate()
)

alter table Doctors
add constraint PK_Doctors primary key(DoctorID)

create unique nonclustered index Idx_Doctors_UserName on Doctors(UserName)
 
/********************************* End Table: Doctors *********************************/

