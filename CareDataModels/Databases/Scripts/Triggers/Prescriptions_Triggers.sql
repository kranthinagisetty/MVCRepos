

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Prescriptions_Update]'))
DROP TRIGGER [dbo].[trg_Prescriptions_Update]
GO

create trigger [dbo].[trg_Prescriptions_Update] on [dbo].[Prescriptions]
for update
as
set nocount on
	
	declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Prescriptions
	Set UpdatedOn = @currentDate
	Where PrescriptionId in (select record.PrescriptionId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Prescriptions
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Prescriptions tabA
			join deleted record on record.PrescriptionId = tabA.PrescriptionId
		end
	end
	
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Prescriptions_Insert]'))
DROP TRIGGER [dbo].[trg_Prescriptions_Insert]
GO

create trigger [dbo].[trg_Prescriptions_Insert] on [dbo].[Prescriptions]
for insert
as
set nocount on
	Update Prescriptions
	Set AddedOn = GETUTCDATE()
	Where PrescriptionId = (select record.PrescriptionId from inserted record)	
set nocount off

Go