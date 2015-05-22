
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDisplayID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDisplayID]
GO

create procedure GetDisplayID(@idtype varchar(30), @displayId varchar(30) output)
as
begin

declare @id int
--begin tran

select @id = PropertyValue + 1
from DisplayIDs
where PropertyName = @idtype

Update DisplayIDs
Set PropertyValue = @id
where PropertyName = @idtype

--end tran

select 
@displayId = 
case
when @idtype = 'AdminDisplayId' then 'AA'
when @idtype = 'StaffDisplayId' then 'SA'
when @idtype = 'PatientDisplayId' then 'PA'
when @idtype = 'DoctorDisplayId' then 'DR'
end
 + Right('000000' + CONVERT(NVARCHAR, @id), 6) 

end
