using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using CareDataModels.Models;
using CareAPI.Utility;
using System.Web.Security;
using System.Text;
using System.Threading;
using System.Security.Principal;
using CareAPI.Models;

namespace CareAPI.Controllers
{
    public class StaffController : ApiController
    {
        private CareEntities db = new CareEntities();
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        [HttpPost]
        public HttpResponseMessage Login()
        {
            log.Info(Constants.InfoPrefix + "Authenticating Doctor");

            try
            {
                string authHeader = HttpContext.Current.Request.Headers["Authorization"];
                string base64Credentials = authHeader.Substring(6);
                string[] credentials = Encoding.ASCII.GetString(Convert.FromBase64String(base64Credentials)).Split(new char[] { ':' });
                log.Info("Credentials Supplied : " + credentials[0] + " Password: " + credentials[1]);

                string userKey = credentials[0];
                string password = credentials[1];

                Staff person = db.Staffs.FirstOrDefault(x => ((x.UserName == userKey || x.Phone == userKey) && x.Password == password));


                if (person != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, person);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "Unauthorized");
                }
            }
            catch (Exception ex)
            {
                log.Error(Constants.ErrorPrefix, ex);
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "Unauthorized");
            }
        }

        #region Patients
        [HttpGet]
        [StaffAuthorize]
        public IEnumerable<Patient> GetAllPatients()
        {
            Staff staff = Users.GetCurrentStaff(db);
            return db.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList();
        }

        [HttpGet]
        [StaffAuthorize]
        public Patient GetPatient(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);
            Patient patient = db.Patients.FirstOrDefault(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID));

            if (patient == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return patient;
        }
        #endregion

        #region Doctors
        [HttpGet]
        [StaffAuthorize]
        public IEnumerable<Doctor> GetAllDoctors()
        {
            Staff staff = Users.GetCurrentStaff(db);
            return db.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList();
        }

        [HttpGet]
        [StaffAuthorize]
        public Doctor GetDoctor(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);
            Doctor doctor = db.Doctors.FirstOrDefault(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID));

            if (doctor == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return doctor;
        }
        #endregion

        #region Prescriptions
        [HttpPost]
        [StaffAuthorize]
        public HttpResponseMessage UploadPrescription(Prescription prescription)
        {
            Staff staff = Users.GetCurrentStaff(db);
            if (ModelState.IsValid)
            {
                try
                {
                    if (string.IsNullOrEmpty(prescription.PrescriptionName))
                    {
                        prescription.PrescriptionName = "Prescription - " + DateTime.Now.ToShortDateString();
                    }
                    prescription.HospitalId = staff.HospitalID;
                    prescription.AddedBy = staff.UserName;
                    db.Prescriptions.Add(prescription);
                    db.SaveChanges();


                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, prescription);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = prescription.PrescriptionId }));
                    return response;
                }
                catch (Exception ex)
                {
                    log.Error("Error :" + ex);
                }

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        [HttpGet]
        [StaffAuthorize]
        public IEnumerable<PrescriptionVM> GetPatientPrescriptions(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);

            var prescriptions = db.Prescriptions.Include(a => a.Patient).Include(a => a.Doctor)
                            .Where(x => x.PatientId == id && x.HospitalId == staff.HospitalID)
                            .Select(row => new PrescriptionVM() { PrescriptionId = row.PrescriptionId, PrescriptionName = row.PrescriptionName, PatientId = row.PatientId, PatientName = row.Patient.FullName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName, PrescriptionDate = row.AddedOn ?? DateTime.Now })
                            .ToList();
            return prescriptions;
        }

        [HttpGet]
        [StaffAuthorize]
        public Prescription GetPrescription(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);
            Prescription prescription = db.Prescriptions.FirstOrDefault(x => x.PrescriptionId == id && x.HospitalId == staff.HospitalID);
            if (prescription == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
            else
            {
                if (prescription.PrescriptionText == null || prescription.PrescriptionText == "")
                {
                    prescription.PrescriptionText = "";
                }
                if (prescription.PrescriptionImage == null)//added by Hari on Oct 31 
                {
                    prescription.PrescriptionImage = null;
                }

            }

            return prescription;
        }

        #endregion

        #region MedicalRecords

        [HttpPost]
        [StaffAuthorize]
        public HttpResponseMessage UploadMedicalRecord(MedicalRecord medicalRecord)
        {
            Staff staff = Users.GetCurrentStaff(db);
            if (ModelState.IsValid)
            {
                try
                {
                    if (string.IsNullOrEmpty(medicalRecord.MedicalRecordName))
                    {
                        medicalRecord.MedicalRecordName = "MedicalRecord - " + DateTime.Now.ToShortDateString();
                    }
                    medicalRecord.HospitalId = staff.HospitalID;
                    medicalRecord.AddedBy = staff.UserName;
                    db.MedicalRecords.Add(medicalRecord);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, medicalRecord);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = medicalRecord.MedicalRecordId }));
                    return response;
                }
                catch (Exception ex)
                {
                    log.Error("Error :" + ex);
                }

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        [HttpGet]
        [StaffAuthorize]
        public IEnumerable<MedicalRecordVM> GetPatientRecords(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);

            var medicalrecords = db.MedicalRecords.Include(a => a.Patient)
                            .Where(x => x.HospitalId == staff.HospitalID && x.PatientId == id)
                            .Select(row => new MedicalRecordVM() { MedicalRecordId = row.MedicalRecordId, MedicalRecordName = row.MedicalRecordName, PatientId = row.PatientId, PatientName = row.Patient.FullName, MedicalRecordDate = row.AddedOn ?? DateTime.Now })
                            .ToList();
            return medicalrecords;
        }

        [HttpGet]
        [StaffAuthorize]
        public MedicalRecord GetRecord(int id)
        {
            Staff staff = Users.GetCurrentStaff(db);
            MedicalRecord medicalRecord = db.MedicalRecords.FirstOrDefault(x => x.MedicalRecordId == id && x.HospitalId == staff.HospitalID);

            return medicalRecord;
        }

        #endregion

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
        /// <summary> 
        /// Changed by: Harikrishna Bura,
        /// Description: Response code and Addresline2 added.
        /// </summary>
        /// <param name="sObj"></param>
        /// <returns></returns>
        [HttpPost]
        [StaffAuthorize]
        public HttpResponseMessage StaffChangePassword(Staff sObj)
        {
            try
            {
                Staff staffObj = db.Staffs.FirstOrDefault(item => item.StaffID == sObj.StaffID);
                if (staffObj != null)
                {
                    staffObj.AddressLine2 = "1";
                    db.Entry(staffObj).State = EntityState.Modified;
                    db.SaveChanges(); 
                    staffObj.Password = sObj.Email;
                    staffObj.UpdatedOn = DateTime.UtcNow;
                    db.Staffs.Attach(staffObj);
                    db.Entry(staffObj).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            // return Request.CreateResponse(HttpStatusCode.OK, "Password Changed Successfully");
            //return Request.CreateResponse(HttpStatusCode.OK, "Password Changed Successfully");
            return Request.CreateErrorResponse(HttpStatusCode.OK, "Password Changed Successfully");
        }
    }
}
