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
    
    public partial class DoctorAppointmentSchedule
    {
        public DoctorAppointmentSchedule()
        {
            this.DoctorAppointments = new HashSet<DoctorAppointment>();
        }
    
        public int ScheduleId { get; set; }
        public Nullable<int> DoctorID { get; set; }
        public Nullable<int> AppointmentSlotID { get; set; }
        public string Timings_Slot { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> isdeleted { get; set; }
        public Nullable<System.DateTime> SlotFromDateTime { get; set; }
        public Nullable<System.DateTime> SlotToDateTime { get; set; }
    
        public virtual AppointmentSlot AppointmentSlot { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual ICollection<DoctorAppointment> DoctorAppointments { get; set; }
    }
}
