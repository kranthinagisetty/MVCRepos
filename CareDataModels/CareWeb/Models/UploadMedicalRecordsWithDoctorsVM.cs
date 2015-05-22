using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Models
{
    public class UploadMedicalRecordsWithDoctorsVM
    {
        public CareDataModels.Models.Doctor DoctorsList { get; set; }
        public CareDataModels.Models.Patient patientInfo { get; set; } 
        public CareDataModels.Models.MedicalRecord medicalRecords { get; set; }
    }
}