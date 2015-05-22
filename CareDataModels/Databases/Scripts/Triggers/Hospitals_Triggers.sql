

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Hospitals_Update]'))
DROP TRIGGER [dbo].[trg_Hospitals_Update]
GO

create trigger [dbo].[trg_Hospitals_Update] on [dbo].[Hospitals]
for update
as
set nocount on
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
    
	Update Hospitals
	Set UpdatedOn = @currentDate
	Where HospitalId in (select record.HospitalId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Hospitals
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Hospitals tabA
			join deleted record on record.HospitalId = tabA.HospitalId
		end
	end
	
set nocount off
Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Hospitals_Insert]'))
DROP TRIGGER [dbo].[trg_Hospitals_Insert]
GO

create trigger [dbo].[trg_Hospitals_Insert] on [dbo].[Hospitals]
for insert
as
set nocount on
    
	Update Hospitals
	Set AddedOn = GETUTCDATE(), IsActive = 1
	Where HospitalId = (select record.HospitalId from inserted record)	
	
set nocount off