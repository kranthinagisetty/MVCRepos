using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 
using CareDataModels.Models;

namespace CareDataModels.PatientMedicalRecordsVM
{
    public class PatientMedicalRecordsVM
    {
        public Patient patient { get; set; }
        public IEnumerable<MedicalRecord> medicalRecords { get; set; }
        public Doctor doctor { get; set; }
    }
}
