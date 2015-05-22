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
    
    using System.ComponentModel.DataAnnotations;
    
    [MetadataType(typeof(AppointmentMetaData))]
    public partial class Appointment
    {
    internal sealed class AppointmentMetaData
    {
    public int AppointmentId { get; set; }
    
    [Required(ErrorMessage="Appointment Date is required")]
    [DataType(DataType.DateTime)]
    public System.DateTime AppointmentDate { get; set; }
    
    public int PatientId { get; set; }
    
    public int DoctorId { get; set; }
    
    public int HospitalId { get; set; }
    
    public Nullable<bool> IsApproved { get; set; }
    
    public Nullable<bool> IsCancelled { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> AddedOn { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> UpdatedOn { get; set; }
    
    [StringLength(20, ErrorMessage="AddedBy should be less than 20 characters")]
    public string AddedBy { get; set; }
    
    [StringLength(20, ErrorMessage="UpdatedBy should be less than 20 characters")]
    public string UpdatedBy { get; set; }
    
    }
    }
}