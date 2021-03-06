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
    
    [MetadataType(typeof(PrescriptionMetaData))]
    public partial class Prescription
    {
    internal sealed class PrescriptionMetaData
    {
    public int PrescriptionId { get; set; }
    
    [StringLength(50, ErrorMessage="PrescriptionName should be less than 50 characters")]
    public string PrescriptionName { get; set; }
    
    [StringLength(500, ErrorMessage="PrescriptionText should be less than 500 characters")]
    public string PrescriptionText { get; set; }
    
    public byte[] PrescriptionImage { get; set; }
    
    [StringLength(50, ErrorMessage="ImageExtension should be less than 50 characters")]
    public string ImageExtension { get; set; }
    
    public int DoctorId { get; set; }
    
    public int PatientId { get; set; }
    
    public int HospitalId { get; set; }
    
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
