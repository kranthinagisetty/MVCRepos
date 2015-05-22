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
using System.Dynamic;

namespace CareAPI.Controllers
{
    public class DoctorController : ApiController
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

                Doctor person = db.Doctors.FirstOrDefault(x => ((x.UserName == userKey || x.Phone == userKey) && x.Password == password));


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

        #region Hospitals
        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<Hospital> GetAllHospitals()
        {
            log.Info(Constants.InfoPrefix + "Getting all Hospitals for Doctor");
            return db.Hospitals.Where(x => x.HospitalId > 0).ToList();
        }

        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<Hospital> GetMyHospitals()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            return db.Hospitals.Where(x => x.Doctors.Any(a => a.DoctorID == currentUser.DoctorID)).ToList();
        }

        [HttpPost]
        [DoctorAuthorize]
        public Hospital RegisterWithHospital(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Hospital hospital = db.Hospitals.FirstOrDefault(x => x.HospitalId == id && x.IsActive == true);
            log.Info(Constants.InfoPrefix + "Joining Hospital for Doctor");

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            if (!currentUser.Hospitals.Any(x => x.HospitalId == id))
            {
                currentUser.Hospitals.Add(hospital);
                db.SaveChanges();
            }

            return hospital;
        }


        [HttpDelete]
        [DoctorAuthorize]
        public HttpResponseMessage UnregisterWithHospital(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Hospital hospital = db.Hospitals.FirstOrDefault(x => x.HospitalId == id);
            log.Info(Constants.InfoPrefix + "Joining Hospital for Doctor");

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            if (currentUser.Hospitals.Any(x => x.HospitalId == id))
            {
                currentUser.Hospitals.Remove(hospital);
                db.SaveChanges();
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Unregistered");
        }
        #endregion        
        
        #region Appointments
        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<Appointment> GetApprovedAppointments()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            var appointments = db.Appointments.Where(a => a.DoctorId == currentUser.DoctorID && a.IsApproved == true && a.IsCancelled == false).ToList();
            return appointments;
        }

        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<AppointmentVM> GetAllAppointments()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            var appointments = db.Appointments.Include(x => x.Patient).Include(x => x.Doctor)
                .Where(a => a.DoctorId == currentUser.DoctorID && a.IsCancelled == false)
                .Select(row => new AppointmentVM { AppointmentId = row.AppointmentId, PatientId = row.PatientId, PatientName = row.Patient.FullName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName, HospitalName = row.Hospital.Name, AppointmentDate = row.AppointmentDate })
                .ToList();
            return appointments;
        }

        [HttpGet]
        public List<AppointmentVM> GetTempAppointments()
        {
            var appointments = db.Appointments.Include(x => x.Patient).Include(x=>x.Doctor)
                .Select(row => new AppointmentVM { PatientId = row.PatientId, PatientName = row.Patient.FullName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName, HospitalName = row.Hospital.Name, AppointmentDate = row.AppointmentDate  })
                .ToList();
            return appointments;
        }

        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<Appointment> GetAppointmentsPendingApproval()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            var appointments = db.Appointments.Where(a => a.DoctorId == currentUser.DoctorID && a.IsApproved == false && a.IsCancelled == false).ToList();
            return appointments;
        }

        [HttpGet]
        [DoctorAuthorize]
        public Appointment GetAppointment(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Appointment appointment = db.Appointments.FirstOrDefault(x => x.AppointmentId == id && x.DoctorId == currentUser.DoctorID);

            if (appointment == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.NotFound));
            }

            return appointment;
        }

        [HttpDelete]
        [DoctorAuthorize]
        public HttpResponseMessage CancelAppointment(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Appointment appointment = db.Appointments.FirstOrDefault(x => x.AppointmentId == id && x.DoctorId == currentUser.DoctorID);

            if (appointment == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (currentUser != null && appointment != null)
            {
                appointment.IsCancelled = true;
                db.Entry(appointment).State = EntityState.Modified;
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, appointment);
        }

        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage AcceptAppointment(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Appointment appointment = db.Appointments.FirstOrDefault(x => x.AppointmentId == id && x.DoctorId == currentUser.DoctorID);

            if (appointment == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (currentUser != null && appointment != null)
            {
                appointment.IsApproved = true;
                appointment.IsCancelled = false;
                db.Entry(appointment).State = EntityState.Modified;
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, appointment);
        } 
        #endregion

        #region Feedback
        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<FeedbackVM> GetAllFeedbacks()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            var feedbacks = db.Feedbacks.Include(a => a.Patient).Include(a=>a.Doctor)
                .Where(x => x.DoctorId == currentUser.DoctorID)
                .Select(row => new FeedbackVM { FeedbackId = row.FeedbackId, FeedbackText = row.FeedbackText, PatientId = row.PatientId, PatientName = row.Patient.FirstName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName  })
                .ToList();
            return feedbacks;
        }

        [HttpGet]
        [DoctorAuthorize]
        public FeedbackVM GetFeedback(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Feedback feedback = db.Feedbacks
                .Include(a => a.Patient).Include(a => a.Doctor)
                .FirstOrDefault(x => x.DoctorId == currentUser.DoctorID);

            FeedbackVM feedbackVM = new FeedbackVM();

            if(feedback != null)
            {
                feedbackVM.FeedbackId = feedback.FeedbackId;
                feedbackVM.PatientId = feedback.PatientId;
                feedbackVM.PatientName = feedback.Patient.FullName;
                feedbackVM.DoctorId = feedback.DoctorId;
                feedbackVM.DoctorName = feedback.Doctor.FullName;
                feedbackVM.FeedbackText = feedback.FeedbackText;
            }
            else
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.NotFound));
            }

            return feedbackVM;
        } 
        #endregion

        #region Patients
        /// <summary>
        /// Modified By: Harikrishna allpatients
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<PatientVM> GetAllPatients()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            return db.Patients.Join(db.DoctorAppointments, p => p.PatientID, da => da.PatientId,
               (p, da) => new { p, da }).
               Join(db.DoctorAppointmentSchedules, r => r.da.ScheduleId, das => das.ScheduleId, (r, das) => new { r, das })
               .Select(m => new PatientVM
               {
                   PatientId = m.r.p.PatientID,
                   PatientName = m.r.p.FirstName,
                   DoctorId = (int) m.das.DoctorID
               }).Where(x => x.DoctorId == currentUser.DoctorID).Distinct().Distinct().ToList();
        }

        [HttpGet]
        [DoctorAuthorize]
        public PatientVM GetPatient(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Patient patient = db.Patients
                .FirstOrDefault(x => x.Appointments.Any(a => a.DoctorId == currentUser.DoctorID));

            PatientVM patientVM = new PatientVM() { PatientId = patient.PatientID, PatientName = patient.FullName };

            if (patient == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return patientVM;
        } 
        #endregion

        #region Prescriptions
        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage UploadPrescription(Prescription prescription)
        {
            Doctor doctor = Users.GetCurrentDoctor(db);
            if (ModelState.IsValid)
            {
                if (string.IsNullOrEmpty(prescription.PrescriptionName))
                {
                    prescription.PrescriptionName = "Prescription - " + DateTime.Now.ToShortDateString();
                } 
                prescription.DoctorId = doctor.DoctorID;
                prescription.HospitalId = Convert.ToInt32(doctor.HospitalId);
                prescription.AddedBy = doctor.UserName;
                db.Prescriptions.Add(prescription);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, prescription);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = prescription.PrescriptionId }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<PrescriptionVM> GetAllPrescriptionsOfPatient(int id)
        {
            Doctor doctor = Users.GetCurrentDoctor(db);
            var prescriptions = db.Prescriptions.Include(a => a.Patient).Include(a => a.Doctor).Where(x => x.DoctorId == doctor.DoctorID && x.PatientId == id)
                .Select(row => new PrescriptionVM() { PrescriptionId = row.PrescriptionId, PrescriptionName = row.PrescriptionName,PrescriptionText=row.PrescriptionText, DoctorId  = row.DoctorId, DoctorName = row.Doctor.FullName, PatientId = row.PatientId, PatientName = row.Patient.FullName, PrescriptionDate = row.AddedOn})
                .ToList();
            return prescriptions;
        }

        [HttpGet]
        [DoctorAuthorize]
        public PrescriptionVM GetPrescription(int id)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            Prescription prescription = db.Prescriptions.Include(a => a.Patient).Include(a => a.Doctor).FirstOrDefault(x => x.PrescriptionId == id && x.DoctorId == currentUser.DoctorID);
            PrescriptionVM prescriptionVM = new PrescriptionVM();
            
            if(prescription != null)
            {
                prescriptionVM.PrescriptionId = prescription.PrescriptionId;
                prescriptionVM.PrescriptionName = prescription.PrescriptionName;
                prescriptionVM.PatientId = prescription.PatientId;
                prescriptionVM.PatientName = prescription.Patient.FullName;
                prescriptionVM.DoctorId = prescription.DoctorId;
                prescriptionVM.DoctorName = prescription.Doctor.FullName;
                prescriptionVM.PrescriptionDate = prescription.AddedOn;
                if (prescription.PrescriptionText == null || prescription.PrescriptionText == "")
                {
                    prescriptionVM.PrescriptionText = "";
                }
                else
                {
                    prescriptionVM.PrescriptionText = prescription.PrescriptionText;
                }

                if (prescription.PrescriptionImage == null)//added by Hari on Oct 31 
                {
                    prescription.PrescriptionImage = null;
                }
                else
                {
                    prescriptionVM.PrescriptionImage = prescription.PrescriptionImage;
                }
            }
            else            
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return prescriptionVM;
        } 
        #endregion
        
        [HttpGet]
        [DoctorAuthorize]
        public List<Video> GetAllVideos()
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            currentUser = db.Doctors.Include(a => a.Hospitals).FirstOrDefault(x => x.DoctorID == currentUser.DoctorID);
            List<int> hospitals = currentUser.Hospitals.Select(a => a.HospitalId).ToList();
            
            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            List<Video> videos = db.Videos.Where(a => hospitals.Contains(a.HospitalId ?? -100)).ToList();
            return videos;
        }

        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage AssignVideoToPatient(int firstId, int secondId)
        {
            Doctor currentUser = Users.GetCurrentDoctor(db);
            //firstId:VideoId, secondId:PatientId

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            Video video = db.Videos.FirstOrDefault(x => x.VideoId == firstId);
            Patient patient = db.Patients.Include(a => a.Videos).FirstOrDefault(x => x.PatientID == secondId);
            
            if (video != null && patient != null && !patient.Videos.Any(a => a.VideoId == video.VideoId))
            {
                try
                {
                    patient.Videos.Add(video);
                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK);
                }
                catch(Exception ex)
                {
                    log.Error("Error : " + ex);
                }
            }

            if (video != null && patient != null && patient.Videos.Any(a => a.VideoId == video.VideoId))
            {
                return Request.CreateResponse(HttpStatusCode.OK);
            }

            return Request.CreateResponse(HttpStatusCode.BadRequest);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        } 
        /// <summary>
        /// Changed by: Harikrishna Bura,
        /// Description: Response code and Addresline2 added.
        /// </summary>
        /// <param name="changePwdObj"></param>
        /// <returns></returns>
        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage DoctorChangePassword(Doctor changePwdObj )//int doctorId, string password
        { 
            try
            {
                Doctor docObj = db.Doctors.FirstOrDefault(item => item.DoctorID == changePwdObj.DoctorID);
                if (docObj != null)
                {
                    docObj.AddressLine2 = "1";
                    db.Entry(docObj).State = EntityState.Modified;
                    db.SaveChanges(); 
                    docObj.Password = changePwdObj.Email;
                    docObj.UpdatedOn = DateTime.UtcNow;
                    db.Doctors.Attach(docObj);
                    db.Entry(docObj).State = EntityState.Modified;
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
        /// <summary>
        /// Added By: Harikrishna
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [DoctorAuthorize]
        public IEnumerable<MedicalRecordVM> GetMyMedicalRecords(int DoctorID, int PatientID)
        {
            //Patient patient = Users.GetCurrentPatient(db);
            //Doctor currentDoctor = Users.GetCurrentDoctor(db);
            var medicalrecords = db.MedicalRecords
                            .Where(x => x.PatientId == PatientID && x.DoctorID == DoctorID)
                            .Select(row => new MedicalRecordVM() { MedicalRecordId = row.MedicalRecordId, MedicalRecordName = row.MedicalRecordName, PatientId = row.PatientId, PatientName = row.Patient.FullName, MedicalRecordDate = row.AddedOn ?? DateTime.Now })
                            .ToList();
            return medicalrecords;
        }

        [HttpGet]
        [DoctorAuthorize]
        public MedicalRecord GetRecord(int id)
        {
            MedicalRecord medicalRecord = db.MedicalRecords.FirstOrDefault(x => x.MedicalRecordId == id);
            return medicalRecord;
        }  
    }
}
