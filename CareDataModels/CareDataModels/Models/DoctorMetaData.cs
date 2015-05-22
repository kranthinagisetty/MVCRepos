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
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    
    [MetadataType(typeof(DoctorMetaData))]
    public partial class Doctor
    {
    internal sealed class DoctorMetaData
    {
    public int DoctorID { get; set; }
    
    [StringLength(100, ErrorMessage="FirstName should be less than 100 characters")]
    [Required(ErrorMessage="First Name is required")]
    public string FirstName { get; set; }
    
    [StringLength(100, ErrorMessage="LastName should be less than 100 characters")]
    public string LastName { get; set; }
    
    [StringLength(205, ErrorMessage="FullName should be less than 205 characters")]
    public string FullName { get; set; }
    
    [StringLength(20, ErrorMessage="UserName should be less than 20 characters")]
    public string UserName { get; set; }
    
    [StringLength(20, ErrorMessage="Password should be less than 20 characters")]
    [Required(ErrorMessage="Password is required")]
    public string Password { get; set; }
    
    [StringLength(50, ErrorMessage="Specialization should be less than 50 characters")]
    [Required(ErrorMessage = "Specialization is required")]
    public string Specialization { get; set; }
    
    public Nullable<int> RoleId { get; set; }

    [RegularExpression(@"^\d+$", ErrorMessage = "Invalid Mobile Number")]
    [StringLength(10, ErrorMessage = " Mobile should be less than 10 characters")]
    [Required(ErrorMessage = " Mobile is required")]
    [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid Mobile Number")]
     public string Phone { get; set; }
    
    [StringLength(50, ErrorMessage="Email should be less than 50 characters")]
    [DataType(DataType.EmailAddress)]
    public string Email { get; set; }
    
    public Nullable<int> FailedLoginAttempts { get; set; }
    
    public Nullable<bool> IsActive { get; set; }
    
    public Nullable<bool> IsLocked { get; set; }
    
    [StringLength(100, ErrorMessage="Address should be less than 100 characters")]
    [Required(ErrorMessage = "Address is required")]
    public string AddressLine1 { get; set; }

     [Required(ErrorMessage = "Country is required")]
    [Display(Name = "Country")]
    public string AddressLine2 { get; set; }
    
    [StringLength(20, ErrorMessage="City should be less than 20 characters")]
    [Required(ErrorMessage = "City is required")]
    public string City { get; set; }
    
    [StringLength(20, ErrorMessage="State should be less than 20 characters")]
    [Required(ErrorMessage = "State is required")]
    public string State { get; set; }
    
    [DataType(DataType.PostalCode)]
    [Required(ErrorMessage = "ZipCode is required")]
    public Nullable<int> ZipCode { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> AddedOn { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> UpdatedOn { get; set; }
    
    public Nullable<int> HospitalId { get; set; }
    
    [StringLength(20, ErrorMessage="Gender should be less than 20 characters")]
    public string Gender { get; set; }
    
    public Nullable<int> Intervels { get; set; }
    
    }
    }
}
