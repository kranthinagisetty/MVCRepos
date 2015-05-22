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
    
    public partial class Doctor
    {
        public Doctor()
        {
            this.Appointments = new HashSet<Appointment>();
            this.DoctorNotifications = new HashSet<DoctorNotification>();
            this.Feedbacks = new HashSet<Feedback>();
            this.MedicalRecords = new HashSet<MedicalRecord>();
            this.Prescriptions = new HashSet<Prescription>();
            this.Hospitals = new HashSet<Hospital>();
            this.MedicalRecords1 = new HashSet<MedicalRecord>();
            this.Patients = new HashSet<Patient>();
            this.AppointmentSlots = new HashSet<AppointmentSlot>();
            this.DoctorAppointmentSchedules = new HashSet<DoctorAppointmentSchedule>();
        }
    
        public int DoctorID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Specialization { get; set; }
        public Nullable<int> RoleId { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public Nullable<int> FailedLoginAttempts { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsLocked { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public Nullable<int> ZipCode { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<int> HospitalId { get; set; }
        public string Gender { get; set; }
        public Nullable<int> Intervels { get; set; }
    
        public virtual ICollection<Appointment> Appointments { get; set; }
        public virtual ICollection<DoctorNotification> DoctorNotifications { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
        public virtual ICollection<Prescription> Prescriptions { get; set; }
        public virtual ICollection<Hospital> Hospitals { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords1 { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
        public virtual ICollection<AppointmentSlot> AppointmentSlots { get; set; }
        public virtual ICollection<DoctorAppointmentSchedule> DoctorAppointmentSchedules { get; set; }
    }
}
