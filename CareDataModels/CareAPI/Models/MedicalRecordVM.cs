using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Models
{
    public class MedicalRecordVM
    {
        public int MedicalRecordId;
        public string MedicalRecordName;
        public int PatientId;
        public string PatientName;
        public DateTime? MedicalRecordDate;
        public byte[] MedicalRecordImage;
    }
}