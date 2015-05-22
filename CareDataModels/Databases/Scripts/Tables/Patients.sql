
/********************************* Start Table: Patients *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patients]') AND type in (N'U'))
DROP TABLE [dbo].[Patients]
GO

create table Patients
(
PatientID int identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(16),
Profession nvarchar(20),
DOB datetime,
Age As datediff(year, coalesce(DOB, getdate()), getdate()) ,
Phone nvarchar(20) not null unique,
Email nvarchar(50),
Gender bit default(1),
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

alter table Patients
add constraint PK_Patients primary key(PatientID)

create unique nonclustered index Idx_Patients_UserName on Patients(UserName) 

/********************************* End Table: Patients *********************************/

