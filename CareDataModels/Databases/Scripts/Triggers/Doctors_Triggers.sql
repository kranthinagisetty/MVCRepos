

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Doctors_Update]'))
DROP TRIGGER [dbo].[trg_Doctors_Update]
GO

create trigger [dbo].[trg_Doctors_Update] on [dbo].[Doctors]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Doctors
	Set UpdatedOn = @currentDate
	Where DoctorId in (select record.DoctorId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Doctors
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Doctors tabA
			join deleted record on record.DoctorId = tabA.DoctorId
		end
	end
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Doctors_Insert]'))
DROP TRIGGER [dbo].[trg_Doctors_Insert]
GO

create trigger [dbo].[trg_Doctors_Insert] on [dbo].[Doctors]
for insert
as
set nocount on

    declare @displayid varchar(30)
    exec GetDisplayID 'DoctorDisplayID', @displayid output
    
	Update Doctors
	Set AddedOn = GETUTCDATE(), RoleId = 8, UserName = @displayid, 
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where DoctorId = (select record.DoctorId from inserted record)	
set nocount off

Go