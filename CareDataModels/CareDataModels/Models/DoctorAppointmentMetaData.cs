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
    
    [MetadataType(typeof(DoctorAppointmentMetaData))]
    public partial class DoctorAppointment
    {
    internal sealed class DoctorAppointmentMetaData
    {
    [Required(ErrorMessage="Id is required")]
    public int Id { get; set; }
    
    public Nullable<int> Hospitald { get; set; }
    
    public Nullable<int> ScheduleId { get; set; }
    
    public Nullable<int> PatientId { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> AppointmentDate { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> AddedOn { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> UpdatedOn { get; set; }
    
    public Nullable<bool> IsSlotBooked { get; set; }
    
    }
    }
}
