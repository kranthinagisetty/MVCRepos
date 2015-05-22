
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_DoctorNotifications_Update]'))
DROP TRIGGER [dbo].[trg_DoctorNotifications_Update]
GO

create trigger [dbo].[trg_DoctorNotifications_Update] on [dbo].[DoctorNotifications]
for update
as
set nocount on
	Update DoctorNotifications
	Set UpdatedOn = GETUTCDATE()
	Where DoctorNotificationId in (select record.DoctorNotificationId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update DoctorNotifications
			Set AddedOn = record.AddedOn
			from DoctorNotifications tabA
			join deleted record on record.DoctorNotificationId = tabA.DoctorNotificationId
		end
	end
set nocount off

Go