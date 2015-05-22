using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class CreateAppointment
    {
      
        public int PatientId;      
        public int DoctorId;       
        public int HospitalId;
        public int ScheduleId;
        public int AppointmentSlotID; 
        public DateTime AppointmentDate;

       
    }
}