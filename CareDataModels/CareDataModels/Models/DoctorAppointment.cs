//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CareDataModels.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DoctorAppointment
    {
        public int Id { get; set; }
        public Nullable<int> Hospitald { get; set; }
        public Nullable<int> ScheduleId { get; set; }
        public Nullable<int> PatientId { get; set; }
        public Nullable<System.DateTime> AppointmentDate { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsSlotBooked { get; set; }
    
        public virtual Patient Patient { get; set; }
        public virtual DoctorAppointmentSchedule DoctorAppointmentSchedule { get; set; }
    }
}
