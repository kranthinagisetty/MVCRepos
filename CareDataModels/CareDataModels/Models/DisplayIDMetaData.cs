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
    
    [MetadataType(typeof(DisplayIDMetaData))]
    public partial class DisplayID
    {
    internal sealed class DisplayIDMetaData
    {
    [StringLength(30, ErrorMessage="PropertyName should be less than 30 characters")]
    [Required(ErrorMessage="Property Name is required")]
    public string PropertyName { get; set; }
    
    [Required(ErrorMessage="Property Value is required")]
    public int PropertyValue { get; set; }
    
    }
    }
}