

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Patients_Update]'))
DROP TRIGGER [dbo].[trg_Patients_Update]
GO

create trigger [dbo].[trg_Patients_Update] on [dbo].[Patients]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Patients
	Set UpdatedOn = @currentDate
	Where PatientId in (select record.PatientId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Patients
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Patients tabA
			join deleted record on record.PatientId = tabA.PatientId
		end
	end
set nocount off

Go

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_Patients_Insert]'))
DROP TRIGGER [dbo].[trg_Patients_Insert]
GO

create trigger [dbo].[trg_Patients_Insert] on [dbo].[Patients]
for insert
as
set nocount on

    declare @displayid varchar(30)
    exec GetDisplayID 'PatientDisplayID', @displayid output
    
	Update Patients
	Set AddedOn = GETUTCDATE(), RoleId = 8, UserName = @displayid,
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where PatientId = (select record.PatientId from inserted record)	
set nocount off

Go