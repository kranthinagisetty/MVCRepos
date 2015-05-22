using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class PrescriptionVM
    {
        public int PrescriptionId;
        public int PatientId;
        public string PatientName;
        public int DoctorId;
        public string DoctorName;
        public DateTime? PrescriptionDate;
        public string PrescriptionText;
        public byte[] PrescriptionImage;
        public string PrescriptionName;
    }
}