using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class AppointmentVM
    {
        public int AppointmentId;
        public int PatientId;
        public string PatientName;
        public int DoctorId;
        public string DoctorName;
        public int HospitalId;
        public string HospitalName;
        public DateTime AppointmentDate;
        public int ScheduleId;
        public string   Timings_Slot;
        public int AppointmentSlotID;
        public bool IsBooked;
        
    }
}