using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class FeedbackVM
    {
        public int FeedbackId;
        public int PatientId;
        public string PatientName;
        public int DoctorId;
        public string DoctorName;
        public string FeedbackText;
    }
}