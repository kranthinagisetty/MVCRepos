

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Admins_Update]'))
DROP TRIGGER [dbo].[trg_Admins_Update]
GO

create trigger [dbo].[trg_Admins_Update] on [dbo].[Admins]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Admins
	Set UpdatedOn = @currentDate
	Where AdminId in (select record.AdminId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Admins
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Admins tabA
			join deleted record on record.AdminId = tabA.AdminId
		end
	end
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Admins_Insert]'))
DROP TRIGGER [dbo].[trg_Admins_Insert]
GO

create trigger [dbo].[trg_Admins_Insert] on [dbo].[Admins]
for insert
as
set nocount on

    declare @displayid varchar(30)
    exec GetDisplayID 'AdminDisplayID', @displayid output
    
	Update Admins
	Set AddedOn = GETUTCDATE(), RoleId = 2, UserName = @displayid, 
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where AdminId = (select record.AdminId from inserted record)	
set nocount off

Go