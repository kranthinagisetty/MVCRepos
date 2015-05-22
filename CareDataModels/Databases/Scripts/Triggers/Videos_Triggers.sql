

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Videos_Update]'))
DROP TRIGGER [dbo].[trg_Videos_Update]
GO

create trigger [dbo].[trg_Videos_Update] on [dbo].[Videos]
for update
as
set nocount on
	
	declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Videos
	Set UpdatedOn = @currentDate
	Where VideoId in (select record.VideoId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Videos
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Videos tabA
			join deleted record on record.VideoId = tabA.VideoId
		end
	end
	
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Videos_Insert]'))
DROP TRIGGER [dbo].[trg_Videos_Insert]
GO

create trigger [dbo].[trg_Videos_Insert] on [dbo].[Videos]
for insert
as
set nocount on
	Update Videos
	Set AddedOn = GETUTCDATE()
	Where VideoId = (select record.VideoId from inserted record)	
set nocount off

Go