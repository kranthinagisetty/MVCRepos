

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Feedback_Update]'))
DROP TRIGGER [dbo].[trg_Feedback_Update]
GO

create trigger [dbo].[trg_Feedback_Update] on [dbo].[Feedback]
for update
as
set nocount on
	
	declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Feedback
	Set UpdatedOn = @currentDate
	Where FeedbackId in (select record.FeedbackId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Feedback
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Feedback tabA
			join deleted record on record.FeedbackId = tabA.FeedbackId
		end
	end
	
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Feedback_Insert]'))
DROP TRIGGER [dbo].[trg_Feedback_Insert]
GO

create trigger [dbo].[trg_Feedback_Insert] on [dbo].[Feedback]
for insert
as
set nocount on
	Update Feedback
	Set AddedOn = GETUTCDATE()
	Where FeedbackId = (select record.FeedbackId from inserted record)	
set nocount off

Go