
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Appointments_Update]'))
DROP TRIGGER [dbo].[trg_Appointments_Update]
GO

create trigger [dbo].[trg_Appointments_Update] on [dbo].[Appointments]
for update
as
set nocount on

    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
    
	Update Appointments
	Set UpdatedOn = @currentDate
	Where AppointmentId in (select record.AppointmentId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Appointments
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Appointments tabA
			join deleted record on record.AppointmentId = tabA.AppointmentId 
		end
	end
set nocount off

Go


IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Appointments_Insert]'))
DROP TRIGGER [dbo].[trg_Appointments_Insert]
GO

create trigger [dbo].[trg_Appointments_Insert] on [dbo].[Appointments]
for insert
as
set nocount on
    
	Update Appointments
	Set AddedOn = GETUTCDATE(), IsApproved = 0, IsCancelled = 0
	Where AppointmentId = (select record.AppointmentId from inserted record)	
	
set nocount off

Go