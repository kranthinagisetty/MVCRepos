

/********************************* Start Table: Admin *********************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admins]') AND type in (N'U'))
DROP TABLE [dbo].[Admins]
GO

create table Admins
(
AdminID int identity(1,1),
HospitalID int not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100),
FullName As Coalesce(FirstName, '') + ' ' + Coalesce(LastName, ''),
UserName nvarchar(20),
Password nvarchar(20) not null,
RoleId int default(2),
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

alter table Admins
add constraint PK_Admin primary key(AdminID)

alter table Admins
add constraint FK_Admins_HospitalID foreign key(HospitalID)
references Hospitals(HospitalID)

create unique nonclustered index Idx_Admins_UserName on Admins(UserName) 

insert into Admins([HospitalID],[FirstName],[LastName],[UserName],[Password],[RoleId],[Email],[Phone],[AddressLine1],[AddressLine2],[City],[State],[ZipCode])
values (-1,'super','admin','superadmin','superadmin',1,'super@admin.com','9999999999','AddressLine1','AddressLine2','City','State',999999)

/********************************* End Table: Admin *********************************/


