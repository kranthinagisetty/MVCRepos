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
    
    public partial class PatientNotification
    {
        public PatientNotification()
        {
            this.Staffs = new HashSet<Staff>();
        }
    
        public int PatientNotificationId { get; set; }
        public string NotificationText { get; set; }
        public System.DateTime NotificationTime { get; set; }
        public int PatientId { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
    
        public virtual ICollection<Staff> Staffs { get; set; }
        public virtual Patient Patient { get; set; }
    }
}