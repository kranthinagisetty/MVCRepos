using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareDataModels.Appointments
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
        public int AppointmentId;

    }
}