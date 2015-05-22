

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Staff_Update]'))
DROP TRIGGER [dbo].[trg_Staff_Update]
GO

create trigger [dbo].[trg_Staff_Update] on [dbo].[Staff]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Staff
	Set UpdatedOn = @currentDate
	Where StaffId in (select record.StaffId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Staff
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Staff tabA
			join deleted record on record.StaffId = tabA.StaffId
		end
	end
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Staff_Insert]'))
DROP TRIGGER [dbo].[trg_Staff_Insert]
GO

create trigger [dbo].[trg_Staff_Insert] on [dbo].[Staff]
for insert
as
set nocount on

    declare @displayid varchar(30)
    exec GetDisplayID 'StaffDisplayID', @displayid output
    
	Update Staff
	Set AddedOn = GETUTCDATE(), RoleId = 4, UserName = @displayid, 
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where StaffId = (select record.StaffId from inserted record)	
set nocount off

Go