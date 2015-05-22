

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_MedicalRecords_Update]'))
DROP TRIGGER [dbo].[trg_MedicalRecords_Update]
GO

create trigger [dbo].[trg_MedicalRecords_Update] on [dbo].[MedicalRecords]
for update
as
set nocount on
	
	declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update MedicalRecords
	Set UpdatedOn = @currentDate
	Where MedicalRecordId in (select record.MedicalRecordId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update MedicalRecords
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from MedicalRecords tabA
			join deleted record on record.MedicalRecordId = tabA.MedicalRecordId
		end
	end
	
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_MedicalRecords_Insert]'))
DROP TRIGGER [dbo].[trg_MedicalRecords_Insert]
GO

create trigger [dbo].[trg_MedicalRecords_Insert] on [dbo].[MedicalRecords]
for insert
as
set nocount on
	Update MedicalRecords
	Set AddedOn = GETUTCDATE()
	Where MedicalRecordId = (select record.MedicalRecordId from inserted record)	
set nocount off

Go