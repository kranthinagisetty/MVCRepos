GO
/****** Object:  Trigger [dbo].[trg_Admins_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Admins_Insert] on [dbo].[Admins]
for insert
as
set nocount on

    declare @displayid varchar(30)
    exec GetDisplayID 'AdminDisplayID', @displayid output
    
	Update Admins
	Set AddedOn = GETUTCDATE(), RoleId = 2,
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where AdminId = (select record.AdminId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Admins_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Appointments_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Appointments_Insert] on [dbo].[Appointments]
for insert
as
set nocount on
    
	Update Appointments
	Set AddedOn = GETUTCDATE(), IsApproved = 0, IsCancelled = 0
	Where AppointmentId = (select record.AppointmentId from inserted record)	
	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Appointments_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_DoctorNotifications_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Doctors_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Doctors_Insert] on [dbo].[Doctors]
for insert
as
set nocount on 
	Update Doctors
	Set AddedOn = GETUTCDATE(), RoleId = 8,
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where DoctorId = (select record.DoctorId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Doctors_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Doctors_Update] on [dbo].[Doctors]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Doctors
	Set UpdatedOn = @currentDate
	Where DoctorId in (select record.DoctorId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Doctors
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Doctors tabA
			join deleted record on record.DoctorId = tabA.DoctorId
		end
	end
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Feedback_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Feedback_Insert] on [dbo].[Feedback]
for insert
as
set nocount on
	Update Feedback
	Set AddedOn = GETUTCDATE()
	Where FeedbackId = (select record.FeedbackId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Feedback_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Hospitals_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Hospitals_Insert] on [dbo].[Hospitals]
for insert
as
set nocount on
    
	Update Hospitals
	Set AddedOn = GETUTCDATE(), IsActive = 1
	Where HospitalId = (select record.HospitalId from inserted record)	
	
set nocount off
GO
/****** Object:  Trigger [dbo].[trg_Hospitals_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

GO
/****** Object:  Trigger [dbo].[trg_MedicalRecords_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_MedicalRecords_Insert] on [dbo].[MedicalRecords]
for insert
as
set nocount on
	Update MedicalRecords
	Set AddedOn = GETUTCDATE()
	Where MedicalRecordId = (select record.MedicalRecordId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_MedicalRecords_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_PatientNotifications_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Patients_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Patients_Insert] on [dbo].[Patients]
for insert
as
set nocount on 
    
	Update Patients
	Set AddedOn = GETUTCDATE(), RoleId = 8,
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where PatientId = (select record.PatientId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Patients_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Prescriptions_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Prescriptions_Insert] on [dbo].[Prescriptions]
for insert
as
set nocount on
	Update Prescriptions
	Set AddedOn = GETUTCDATE()
	Where PrescriptionId = (select record.PrescriptionId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Prescriptions_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO
/****** Object:  Trigger [dbo].[trg_Staff_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Staff_Insert] on [dbo].[Staff]
for insert
as
set nocount on
  
    
	Update Staff
	Set AddedOn = GETUTCDATE(), RoleId = 4, 
	IsActive = 1, IsLocked = 0, FailedLoginAttempts = 0	
	Where StaffId = (select record.StaffId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Staff_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Staff_Update] on [dbo].[Staff]
for update
as
set nocount on
   
    declare @currentDate datetime
    set @currentDate = GETUTCDATE()
   
	Update Staff
	Set UpdatedOn = @currentDate
	Where StaffId in (select record.StaffId from inserted record)
	
	if exists(select 1 from deleted)
	begin
		if(UPDATE(AddedOn))
		begin
			Update Staff
			Set AddedOn = coalesce(record.AddedOn, @currentDate)
			from Staff tabA
			join deleted record on record.StaffId = tabA.StaffId
		end
	end
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Videos_Insert]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[trg_Videos_Insert] on [dbo].[Videos]
for insert
as
set nocount on
	Update Videos
	Set AddedOn = GETUTCDATE()
	Where VideoId = (select record.VideoId from inserted record)	
set nocount off


GO
/****** Object:  Trigger [dbo].[trg_Videos_Update]    Script Date: 10/27/2014 11:12:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


GO 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO 

Create trigger [dbo].[trg_Pictures_Insert] on [dbo].[Pictures]
for insert
as
set nocount on
	Update Pictures
	Set AddedOn = GETUTCDATE() ,  UpdatedOn = GETUTCDATE()
	Where PictureId = (select record.PictureId from inserted record)	
set nocount off



GO