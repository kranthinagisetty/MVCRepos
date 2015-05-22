using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class Appointments
    {
        public DateTime AppointmentDate;
        public int ScheduleId;
        public string Timings_Slot;
        public int AppointmentSlotID;
        public bool IsBooked;
        public bool IsDeleted;
        public int patientID;      
        public string patientName;
        public int DoctorsID;
        public string StaffName;
        public int StaffID;
        public string DoctorName;

    }
}