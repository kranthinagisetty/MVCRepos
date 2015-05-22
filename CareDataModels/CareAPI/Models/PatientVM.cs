using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class PatientVM
    {
        public int PatientId;
        public string PatientName;
        public int DoctorId; //Added by Harikrishna Bura
    }
}