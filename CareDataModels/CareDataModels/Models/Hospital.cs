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
    
    public partial class Hospital
    {
        public Hospital()
        {
            this.Appointments = new HashSet<Appointment>();
            this.MedicalRecords = new HashSet<MedicalRecord>();
            this.Prescriptions = new HashSet<Prescription>();
            this.Videos = new HashSet<Video>();
            this.Pictures = new HashSet<Picture>();
            this.Admins = new HashSet<Admin>();
            this.Staffs = new HashSet<Staff>();
            this.Doctors = new HashSet<Doctor>();
            this.Patients = new HashSet<Patient>();
            this.VideosandPictures = new HashSet<VideosandPicture>();
        }
    
        public int HospitalId { get; set; }
        public string HospitalDisplayId { get; set; }
        public string Name { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public Nullable<int> ZipCode { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public byte[] ImageContent { get; set; }
    
        public virtual ICollection<Appointment> Appointments { get; set; }
        public virtual ICollection<MedicalRecord> MedicalRecords { get; set; }
        public virtual ICollection<Prescription> Prescriptions { get; set; }
        public virtual ICollection<Video> Videos { get; set; }
        public virtual ICollection<Picture> Pictures { get; set; }
        public virtual ICollection<Admin> Admins { get; set; }
        public virtual ICollection<Staff> Staffs { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
        public virtual ICollection<VideosandPicture> VideosandPictures { get; set; }
    }
}
