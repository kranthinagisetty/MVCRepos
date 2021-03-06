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
    
    [MetadataType(typeof(VideosandPictureMetaData))]
    public partial class VideosandPicture
    {
    internal sealed class VideosandPictureMetaData
    {
    public int PictureId { get; set; }
    
    public byte[] PictureContent { get; set; }
    
    [StringLength(255, ErrorMessage="Description should be less than 255 characters")]
    public string Description { get; set; }
    
    public Nullable<int> HospitalId { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> AddedOn { get; set; }
    
    [StringLength(20, ErrorMessage="AddedBy should be less than 20 characters")]
    public string AddedBy { get; set; }
    
    [DataType(DataType.DateTime)]
    public Nullable<System.DateTime> UpdatedOn { get; set; }
    
    [StringLength(20, ErrorMessage="UpdatedBy should be less than 20 characters")]
    public string UpdatedBy { get; set; }
    
    }
    }
}
