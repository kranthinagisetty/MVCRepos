
/********************************* Start Table: Staff *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Staff]') AND type in (N'U'))
DROP TABLE [dbo].[Staff]
GO

create table Staff
(
StaffID int identity(1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(4),
Email nvarchar(50),
Phone nvarchar(20) not null unique,
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

alter table Staff
add constraint PK_Staff primary key(StaffID)

create unique nonclustered index Idx_Staff_UserName on Staff(UserName) 

/********************************* End Table: Staff *********************************/


