
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_PatientNotifications_Update]'))
DROP TRIGGER [dbo].[trg_PatientNotifications_Update]
GO

create trigger [dbo].[trg_PatientNotifications_Update] on [dbo].[PatientNotifications]
for update
as
set nocount on
	Update PatientNotifications
	Set UpdatedOn = GETUTCDATE()
	Where PatientNotificationId in (select record.PatientNotificationId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update PatientNotifications
			Set AddedOn = record.AddedOn
			from PatientNotifications tabA
			join deleted record on record.PatientNotificationId = tabA.PatientNotificationId
		end
	end
	
set nocount off

Go