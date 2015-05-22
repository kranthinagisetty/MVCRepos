using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareDataModels.DoctorInfo
{
   public class DoctorInfo
    {
        public Doctor DoctorVM { get; set; }
        public List<CareDataModels.Models.AppointmentSlot> AppointmentSlotVM { get; set; }
    }
}
