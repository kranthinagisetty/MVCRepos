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
using System.Net.Mail;
using System.Configuration;
using System.Data.Objects;

namespace CareAPI.Controllers
{
    public class PatientController : ApiController
    {
        private CareEntities db = new CareEntities();
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);


        #region Registeration & Login
        [HttpPost]
        public HttpResponseMessage Login()
        {
            log.Info(Constants.InfoPrefix + "Authenticating Patient");

            try
            {
                string authHeader = HttpContext.Current.Request.Headers["Authorization"];

                foreach (var x in HttpContext.Current.Request.Headers)
                {
                    log.Info(Constants.InfoPrefix + x.ToString());
                }
                log.Info(Constants.ErrorPrefix + authHeader);
                string base64Credentials = authHeader.Substring(6);
                log.Info(Constants.ErrorPrefix + base64Credentials);
                string[] credentials = Encoding.ASCII.GetString(Convert.FromBase64String(base64Credentials)).Split(new char[] { ':' });
                log.Info("Credentials Supplied : " + credentials[0] + " Password: " + credentials[1]);

                string userKey = credentials[0];
                string password = credentials[1];

                Patient person = db.Patients.FirstOrDefault(x => ((x.UserName == userKey || x.Phone == userKey) && x.Password == password));


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

        [HttpPut]
        [PatientAuthorize]
        public HttpResponseMessage Update(int id, Patient patient)
        {
            log.Info(Constants.InfoPrefix + "Updating Patient Profile");
            if (!ModelState.IsValid)
            {
                log.Error(Constants.ErrorPrefix + "Invalid Model State");
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            GenericPrincipal principal = HttpContext.Current.User as GenericPrincipal;
            string currentUserName = string.Empty;

            if (principal != null)
            {
                currentUserName = principal.Identity.Name;
                log.Info(Constants.InfoPrefix + "User Name: " + principal.Identity.Name);
            }

            if (id != patient.PatientID || currentUserName != patient.UserName)
            {
                log.Error(Constants.ErrorPrefix + "Unauthorized");
                return Request.CreateResponse(HttpStatusCode.Unauthorized);
            }

            db.Entry(patient).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK);
        }

        /// <summary>
        /// Added by:Hari
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        [PatientAuthorize]
        public HttpResponseMessage PatientChangePassword(Patient pObj)
        {
            try
            {
                Patient patientObj = db.Patients.FirstOrDefault(item => item.PatientID == pObj.PatientID);
                if (patientObj != null)
                { 
                    patientObj.AddressLine2 = "1"; 
                    db.Entry(patientObj).State = EntityState.Modified;
                    db.SaveChanges(); 
                    patientObj.Password = pObj.Email;
                    patientObj.UpdatedOn = DateTime.UtcNow;                   
                    db.Entry(patientObj).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            //return Request.CreateResponse(HttpStatusCode.OK, "Password Changed Successfully");
            return Request.CreateErrorResponse(HttpStatusCode.OK, "Password Changed Successfully");
           
        }


        [HttpPost]
        public HttpResponseMessage Register(Patient patient)
        {
            log.Info(Constants.InfoPrefix + "Registering Patient");

            try
            {
                //
                Patient patientObj = db.Patients.FirstOrDefault(item => item.Phone == patient.Phone);//added by hari
                if (patientObj == null)
                {
                    //
                    /*if (ModelState.IsValid)
                    {*/
                        patient.Password = patient.FullName;
                        patient.RoleId = 16;
                        patient.AddedOn = DateTime.UtcNow;
                        patient.IsActive = true;
                        patient.DOB=DateTime.UtcNow;
                        db.Patients.Add(patient);
                        try
                        {
                            db.SaveChanges();
                            db.Entry(patient).Reload();
                            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, patient);
                            string htmlBody = "<html><body>Hi,<br><br>Thanks you " + patient.FirstName + " for Registering to the CareApp</body></html>";
                            SendEmailWithContent("CareApp Registration completed successfully", patient.Email, htmlBody);
                            response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = patient.PatientID }));
                            return response;
                        }
                        catch (Exception ex)
                        {
                            log.Error(Constants.ErrorPrefix, ex);
                            log.Error(Constants.InnerExceptionPrefix, ex.InnerException);
                            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                        }
                    /*}
                    else
                    {

                        return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                    }*/
                }
                else
                {//If patient already exist.
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Record already exist");
                }
            }
            catch (Exception ex)
            {
                log.Error(Constants.ErrorPrefix, ex);
            }
            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
        }
        /// <summary>
        /// Added by: Harikrishna Bura,
        /// Added On: Nov 28 2014,
        /// Description: This method will send the emails.
        /// </summary>
        /// <param name="subjectContent"></param>
        /// <param name="toEmail"></param>
        /// <param name="bodyContent"></param>
        public void SendEmailWithContent(string subjectContent, string toEmail, string bodyContent)
        {
            MailMessage msg = new MailMessage();

            string fromEmailAddress = ConfigurationManager.AppSettings["FromEmailAddress"].ToString();
            msg.From = new MailAddress(fromEmailAddress);//sender email address
            msg.To.Add(toEmail);// reciever email address
            msg.Subject = subjectContent;
            msg.IsBodyHtml = true;
            msg.BodyEncoding = Encoding.ASCII;
            msg.Body = bodyContent;//"Your Complaint is " + btnCompletedComplaint.Text;
            SendEmail(msg);
        }
        public void SendEmail(MailMessage msg)
        {
            try
            {

                string username = ConfigurationManager.AppSettings["SMTPUserName"].ToString();  //email address or domain user for exchange authentication
                string password = ConfigurationManager.AppSettings["SMTPPassword"].ToString();   //password
                SmtpClient mClient = new SmtpClient();
                mClient.Host = ConfigurationManager.AppSettings["SMTPHost"].ToString(); //Host
                mClient.Credentials = new NetworkCredential(username, password);
                mClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                mClient.EnableSsl = true;
                mClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPortNumber"].ToString()); //465;
                mClient.Timeout = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPMailTimeOut"].ToString());
                mClient.Send(msg);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }

        }

        #endregion

        #region Hospitals
        [HttpGet]
        [PatientAuthorize]
        public IEnumerable<Hospital> GetAllHospitals()
        {
            return db.Hospitals.Where(x => x.HospitalId > 0).ToList();
        }

        [HttpGet]
        [PatientAuthorize]
        public Hospital GetHospital(int id)
        {
            Hospital hospital = db.Hospitals.Find(id);

            if (hospital == null || id < 1)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.NotFound));
            }

            return hospital;
        }
        #endregion

        #region Doctors
        [HttpGet]
        [PatientAuthorize]
        public IEnumerable<Doctor> GetDoctorsByHospital(int id)
        {
            log.Info(Constants.InfoPrefix + "Getting all Doctors");
            return db.Doctors.Where(x => x.Hospitals.Any(a => a.Doctors.Any(y => y.Hospitals.Any(z => z.HospitalId == id)))).ToList();
        }
        #endregion

        #region patient Appointments

        [HttpGet]
        [PatientAuthorize]
        public List<Appointments> GetAllAppointmentsByPatient(int doctorID)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            List<Appointments> appointments = new List<Appointments>();         

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            appointments = db.DoctorAppointmentSchedules.Join
                             (
                             db.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new Appointments
                             {
                                 ScheduleId = das.ScheduleId,
                                 Timings_Slot = das.Timings_Slot,
                                 AppointmentSlotID = (int)das.AppointmentSlotID,
                                 DoctorsID = (int)das.DoctorID,
                                 AppointmentDate = (DateTime)da.AppointmentDate,
                                 IsBooked = (bool)da.IsSlotBooked,
                                 patientID = (int)da.PatientId,
                                 patientName = da.Patient.FirstName

                             }).Where(x => x.DoctorsID == doctorID && x.patientID == currentUser.PatientID).ToList();
            
            return appointments.OrderBy(x=>x.AppointmentDate).ToList();
        }        

        [HttpGet]
        [PatientAuthorize]        
        public List<Appointments> GetAllAppointmentsByDoctor(int doctorID, string Date)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
           
            DateTime crrdate = Convert.ToDateTime(Date);
            List<Appointments> appointments = new List<Appointments>();
            List<Appointments> appointmentsList = new List<Appointments>();
            
            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            if (crrdate.Date <= DateTime.Now.Date)
            {
                return appointmentsList;
            }          


             appointments = db.DoctorAppointmentSchedules.Join
                             (
                             db.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new Appointments
                             {
                               ScheduleId =  das.ScheduleId,
                               Timings_Slot =   das.Timings_Slot,
                               AppointmentSlotID =  (int)das.AppointmentSlotID,             
                               DoctorsID = (int)das.DoctorID,
                               AppointmentDate =  (DateTime)da.AppointmentDate,
                               IsBooked =  (bool)da.IsSlotBooked,
                               patientID = currentUser.PatientID,
                               patientName = currentUser.FirstName

                             }).Where(x => x.DoctorsID == doctorID && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date ).ToList();

             appointmentsList = db.DoctorAppointmentSchedules.Select(x => new Appointments
                                 {
                                     AppointmentDate = crrdate,
                                     AppointmentSlotID = (Int32)x.AppointmentSlotID,
                                     ScheduleId = x.ScheduleId,
                                     Timings_Slot = x.Timings_Slot,
                                     IsBooked = false,
                                     patientID = currentUser.PatientID,
                                     patientName = currentUser.FirstName,
                                     DoctorsID = (int)x.DoctorID,
                    
                                 }).Where(x => x.DoctorsID == doctorID).ToList<Appointments>();

             foreach (var itemQ in appointmentsList)
              {
                  foreach (var itemb in appointments)
                  {
                      if (itemb.ScheduleId == itemQ.ScheduleId)
                      {
                          itemQ.IsBooked = itemb.IsBooked;
                          itemQ.AppointmentDate = crrdate;
                      }
                     

                  }
                  
              }


             return appointmentsList;
        }        

        [HttpPost]
        [PatientAuthorize]       
        public HttpResponseMessage CreateAppointment(CreateAppointment app)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
           
            if (currentUser != null )
            {
                var docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId).Count();
                if (docAppointmentNew > 0)
                {
                   // return ErrorResponse.Get(this, HttpStatusCode.Conflict);
                    return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
                }
                //var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
                //schID.IsSlotBooked = true;               
                //db.Entry(schID).State = EntityState.Modified;
                //db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = currentUser.PatientID;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
               
               
                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }


        [HttpPost]
        [PatientAuthorize]        
        public HttpResponseMessage ResheduleAppointment(CreateAppointment app, int prevScheduleId, string PrevAppDate)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            
            DateTime crrdate = Convert.ToDateTime(PrevAppDate);

            DoctorAppointment docAppointment = db.DoctorAppointments.FirstOrDefault(x => x.ScheduleId == prevScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date);
           
            var  docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == app.AppointmentDate.Date).ToList().Count;

            if (docAppointmentNew > 0)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
            }

            if (docAppointment == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (app.PatientId != currentUser.PatientID)
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            if (currentUser != null && docAppointment != null)
            {
                db.DoctorAppointments.Remove(docAppointment);   
               
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            if (currentUser != null )
            {


               // var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
               // schID.IsSlotBooked = true;
               // db.Entry(schID).State = EntityState.Modified;
               // db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = currentUser.PatientID;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
               

                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }

        [HttpDelete]
        [PatientAuthorize]        
        public HttpResponseMessage CancelAppointment(int Schid,string Date)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
           
            DateTime crrdate = Convert.ToDateTime(Date);


            var delDocApp = db.DoctorAppointments.Where(x => x.ScheduleId == Schid && x.PatientId == currentUser.PatientID && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date).FirstOrDefault();
            
            if (delDocApp == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (currentUser != null && delDocApp != null)
            {
                db.DoctorAppointments.Remove(delDocApp);
                
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

            return Request.CreateResponse(HttpStatusCode.OK, delDocApp);
        }
        #endregion patient Appointments

        #region Doctor Appointments
        [HttpGet]
        [DoctorAuthorize]
        public List<Appointments> GetAllPatientAppointmentsByDoctor(int doctorID, string Date)
        {
            
            Doctor doctorUser = Users.GetCurrentDoctor(db);
            DateTime crrdate = Convert.ToDateTime(Date);
            List<Appointments> appointments = new List<Appointments>();
            List<Appointments> appointmentsList = new List<Appointments>();

            if ( doctorUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            if (crrdate.Date <= DateTime.Now.Date)
            {
                return appointmentsList;
            }   

            appointments = db.DoctorAppointmentSchedules.Join
                            (
                            db.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new Appointments
                            {
                                ScheduleId = das.ScheduleId,
                                Timings_Slot = das.Timings_Slot,
                                AppointmentSlotID = (int)das.AppointmentSlotID,
                                DoctorsID = (int)das.DoctorID,
                                AppointmentDate = (DateTime)da.AppointmentDate,
                                IsBooked = (bool)da.IsSlotBooked  ,                     
                                DoctorName = doctorUser.FirstName,
                                patientID = (int)da.PatientId,
                                patientName = db.Patients.Where(x => x.PatientID == (int)da.PatientId).FirstOrDefault().FirstName

                            }).Where(x => x.DoctorsID == doctorID && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date ).ToList();

            appointmentsList = db.DoctorAppointmentSchedules.Select(x => new Appointments
            {
                AppointmentDate = crrdate,
                AppointmentSlotID = (Int32)x.AppointmentSlotID,
                ScheduleId = x.ScheduleId,
                Timings_Slot = x.Timings_Slot,
                IsBooked = false,
                DoctorName = doctorUser.FirstName,
                DoctorsID = (int)x.DoctorID,
                patientID = 0
                

            }).Where(x => x.DoctorsID == doctorID).ToList<Appointments>();

            foreach (var itemQ in appointmentsList)
            {
                foreach (var itemb in appointments)
                {
                    if (itemb.ScheduleId == itemQ.ScheduleId)
                    {
                        itemQ.IsBooked = itemb.IsBooked;
                        itemQ.AppointmentDate = crrdate;
                        itemQ.patientID = itemb.patientID;
                        itemQ.patientName = itemb.patientName;
                    }


                }

            }


            return appointmentsList;
        }

        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage CreateAppointmentByDoctor(CreateAppointment app)
        {
            
            Doctor doctorUser = Users.GetCurrentDoctor(db);

            if ( doctorUser != null)
            {
                var docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId).Count();
                if (docAppointmentNew > 0)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
                }

                //var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
                //schID.IsSlotBooked = true;               
                //db.Entry(schID).State = EntityState.Modified;
                //db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = app.PatientId;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
               

                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }


        [HttpPost]
        [DoctorAuthorize]
        public HttpResponseMessage ResheduleAppointmentByDoctor(CreateAppointment app, int prevScheduleId, string PrevAppDate)
        {
           
            Doctor doctorUser = Users.GetCurrentDoctor(db);
            DateTime crrdate = Convert.ToDateTime(PrevAppDate);

            DoctorAppointment docAppointment = db.DoctorAppointments.FirstOrDefault(x => x.ScheduleId == prevScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date);

            var docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == app.AppointmentDate.Date).ToList().Count;

            if (docAppointmentNew > 0)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
            }

            if (docAppointment == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            //if (app.PatientId != doctorUser.PatientID)
            //{
            //    return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            //}

            if (doctorUser != null && docAppointment != null)
            {
                db.DoctorAppointments.Remove(docAppointment);              
               
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            if ( doctorUser != null)
            {


                // var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
                // schID.IsSlotBooked = true;
                // db.Entry(schID).State = EntityState.Modified;
                // db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = app.PatientId;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
                //doctorAppointment.isdeleted = false;

                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }

        [HttpDelete]
        [DoctorAuthorize]
        public HttpResponseMessage CancelAppointmentByDoctor(int Schid, string Date, int PatientId)
        {
           
            Doctor doctorUser = Users.GetCurrentDoctor(db);
            DateTime crrdate = Convert.ToDateTime(Date);


            var delDocApp = db.DoctorAppointments.Where(x => x.ScheduleId == Schid && x.PatientId == PatientId && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date).FirstOrDefault();

            if (delDocApp == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (doctorUser != null && delDocApp != null)
            {
                db.DoctorAppointments.Remove(delDocApp);   
               
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

            return Request.CreateResponse(HttpStatusCode.OK, delDocApp);
        }
        #endregion Doctor Appointments

        #region Staff Appointments
        [HttpGet]
        [StaffAuthorize]
        public List<Appointments> GetAllPatientAppointmentsByStaff(int doctorID, string Date)
        {
           
            Staff staffUser = Users.GetCurrentStaff(db);
          
            DateTime crrdate = Convert.ToDateTime(Date);
            List<Appointments> appointments = new List<Appointments>();
            List<Appointments> appointmentsList = new List<Appointments>();

            if ( staffUser == null )
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }
            if (crrdate.Date == DateTime.Now.Date)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.NotFound));
            }

            if (crrdate.Date <= DateTime.Now.Date)
            {
                return appointmentsList;
            } 

            appointments = db.DoctorAppointmentSchedules.Join
                            (
                            db.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new Appointments
                            {
                                ScheduleId = das.ScheduleId,
                                Timings_Slot = das.Timings_Slot,
                                AppointmentSlotID = (int)das.AppointmentSlotID,
                                DoctorsID = (int)das.DoctorID,
                                AppointmentDate = (DateTime)da.AppointmentDate,
                                IsBooked = (bool)da.IsSlotBooked,  
                                StaffID = staffUser.StaffID,
                                StaffName = staffUser.FirstName,
                                patientID = (int)da.PatientId,
                                patientName = db.Patients.Where(x => x.PatientID == (int)da.PatientId).FirstOrDefault().FirstName

                            }).Where(x => x.DoctorsID == doctorID && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date ).ToList();

            appointmentsList = db.DoctorAppointmentSchedules.Select(x => new Appointments
            {
                AppointmentDate = crrdate,
                AppointmentSlotID = (Int32)x.AppointmentSlotID,
                ScheduleId = x.ScheduleId,
                Timings_Slot = x.Timings_Slot,
                IsBooked = false,
                StaffID = staffUser.StaffID,
                StaffName = staffUser.FirstName,
                DoctorsID = (int)x.DoctorID,
                patientID=0

            }).Where(x => x.DoctorsID == doctorID).ToList<Appointments>();

            foreach (var itemQ in appointmentsList)
            {
                foreach (var itemb in appointments)
                {
                    if (itemb.ScheduleId == itemQ.ScheduleId)
                    {
                        itemQ.IsBooked = itemb.IsBooked;
                        itemQ.AppointmentDate = crrdate;
                        itemQ.patientID = itemb.patientID;
                        itemQ.patientName = itemb.patientName;
                    }


                }

            }


            return appointmentsList;
        }

        [HttpPost]
        [StaffAuthorize]
        public HttpResponseMessage CreateAppointmentByStaff(CreateAppointment app)
        {
          
            Staff staffUser = Users.GetCurrentStaff(db);
          

            if ( staffUser != null )
            {
                var docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId).Count();
                if (docAppointmentNew > 0)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
                }
                //var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
                //schID.IsSlotBooked = true;               
                //db.Entry(schID).State = EntityState.Modified;
                //db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = app.PatientId;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
               

                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }


        [HttpPost]
        [StaffAuthorize]
        public HttpResponseMessage ResheduleAppointmentByStaff(CreateAppointment app, int prevScheduleId, string PrevAppDate)
        {
          
            Staff staffUser = Users.GetCurrentStaff(db);
           
            DateTime crrdate = Convert.ToDateTime(PrevAppDate);

            DoctorAppointment docAppointment = db.DoctorAppointments.FirstOrDefault(x => x.ScheduleId == prevScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date);

            var docAppointmentNew = db.DoctorAppointments.Where(x => x.ScheduleId == app.ScheduleId && EntityFunctions.TruncateTime(x.AppointmentDate) == app.AppointmentDate.Date).ToList().Count;

            if (docAppointmentNew > 0)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Already existed");
            }

            if (docAppointment == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            //if (app.PatientId != currentUser.PatientID)
            //{
            //    return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            //}

            if (staffUser != null && docAppointment != null)
            {
                db.DoctorAppointments.Remove(docAppointment);   
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }

            if ( staffUser != null)
            {


                // var schID = db.DoctorAppointmentSchedules.Where(x => x.DoctorID == app.DoctorId && x.ScheduleId == app.ScheduleId).FirstOrDefault();
                // schID.IsSlotBooked = true;
                // db.Entry(schID).State = EntityState.Modified;
                // db.SaveChanges();

                DoctorAppointment doctorAppointment = new DoctorAppointment();
                doctorAppointment.AppointmentDate = app.AppointmentDate;
                doctorAppointment.PatientId = app.PatientId;
                doctorAppointment.ScheduleId = app.ScheduleId;
                doctorAppointment.Hospitald = app.HospitalId;
                doctorAppointment.IsSlotBooked = true;
                doctorAppointment.AddedOn = DateTime.UtcNow;
               

                if (ModelState.IsValid)
                {
                    //Change this reloading part

                    var DoctAppointment = db.DoctorAppointments.Add(doctorAppointment);
                    db.SaveChanges();

                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, app);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = DoctAppointment.Id }));
                    return response;
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
            }
            else
            {
                return ErrorResponse.Get(this, HttpStatusCode.Unauthorized);
            }
        }

        [HttpDelete]
        [StaffAuthorize]
        public HttpResponseMessage CancelAppointmentByStaff(int Schid, string Date,int PatientId)
        {
          
            Staff staffUser = Users.GetCurrentStaff(db);
          
            DateTime crrdate = Convert.ToDateTime(Date);


            var delDocApp = db.DoctorAppointments.Where(x => x.ScheduleId == Schid && x.PatientId ==  PatientId && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate.Date).FirstOrDefault();

            if (delDocApp == null)
            {
                return ErrorResponse.Get(this, HttpStatusCode.NotFound);
            }

            if (staffUser != null && delDocApp != null)
            {
                db.DoctorAppointments.Remove(delDocApp);
               
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

            return Request.CreateResponse(HttpStatusCode.OK, delDocApp);
        }
        #endregion Staff Appointments

        #region Feedback

        [HttpGet]
        [PatientAuthorize]
        public IEnumerable<FeedbackVM> GetAllFeedbacks()
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            var feedbacks = db.Feedbacks.Include(a => a.Patient).Include(a => a.Doctor)
                .Where(x => x.DoctorId == currentUser.PatientID)
                .Select(row => new FeedbackVM { FeedbackId = row.FeedbackId, FeedbackText = row.FeedbackText, PatientId = row.PatientId, PatientName = row.Patient.FirstName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName })
                .ToList();
            return feedbacks;
        }

        [HttpGet]
        [PatientAuthorize]
        public FeedbackVM GetFeedback(int id)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            Feedback feedback = db.Feedbacks
                .Include(a => a.Patient).Include(a => a.Doctor)
                .FirstOrDefault(x => x.DoctorId == currentUser.PatientID);

            FeedbackVM feedbackVM = new FeedbackVM();

            if (feedback != null)
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

        [HttpPost]
        [PatientAuthorize]
        public HttpResponseMessage PostFeedback(Feedback feedback)
        {
            Patient currentUser = Users.GetCurrentPatient(db);

            if (ModelState.IsValid)
            {
                feedback.PatientId = currentUser.PatientID;
                db.Feedbacks.Add(feedback);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, feedback);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = feedback.FeedbackId }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        [HttpPut]
        [PatientAuthorize]
        public HttpResponseMessage UpdateFeedback(int id, Feedback feedback)
        {
            Patient currentUser = Users.GetCurrentPatient(db);

            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != feedback.FeedbackId)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            try
            {
                if (db.Feedbacks.Any(x => x.FeedbackId == id && x.PatientId == currentUser.PatientID))
                {
                    db.Entry(feedback).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK);
        }

        [HttpDelete]
        [PatientAuthorize]
        public HttpResponseMessage DeleteFeedback(int id)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            Feedback feedback = db.Feedbacks.FirstOrDefault(x => x.PatientId == currentUser.PatientID && x.FeedbackId == id);

            if (feedback == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Feedbacks.Remove(feedback);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, feedback);
        }
        #endregion

        #region Prescription
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Modified On: Oct 21 2014,
        /// Description: Added HospitalId and DoctorId.
        /// </summary>
        /// <param name="HospitalId"></param>
        /// <param name="DoctorId"></param>
        /// <returns></returns>
        [HttpGet]
        [PatientAuthorize]
        public List<PrescriptionVM> GetAllPrescriptions(int firstId, int secondId)
        {//DoctorId:firstId & HospitalId:secondId
            Patient currentUser = Users.GetCurrentPatient(db);
            var prescriptions = db.Prescriptions.Include(p => p.Doctor).Include(a => a.Patient)
                .Where(x => x.PatientId == currentUser.PatientID && x.DoctorId == firstId && x.HospitalId == secondId)
                .Select(row => new PrescriptionVM() { PrescriptionId = row.PrescriptionId, PrescriptionName = row.PrescriptionName, DoctorId = row.DoctorId, DoctorName = row.Doctor.FullName, PatientId = row.PatientId, PatientName = row.Patient.FullName, PrescriptionDate = row.AddedOn ?? DateTime.Now })
                .ToList();
            return prescriptions;
        }
        [HttpGet]
        [PatientAuthorize]
        public Prescription GetPrescription(int id)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            //Doctor currentDoctor = Users.GetCurrentDoctor(db);
            Prescription prescription = db.Prescriptions.FirstOrDefault(x => x.PrescriptionId == id && x.PatientId == currentUser.PatientID);//Added by Harikrishna

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

        [HttpPost]
        [PatientAuthorize]
        public HttpResponseMessage UploadPrescription(Prescription prescription)
        {
            Patient currentUser = Users.GetCurrentPatient(db);
            prescription.PatientId = currentUser.PatientID;
            prescription.HospitalId = -1;

            log.Info("File Extension : " + prescription.ImageExtension);

            if (string.IsNullOrEmpty(prescription.PrescriptionName))
            {
                prescription.PrescriptionName = "Prescription - " + DateTime.Now.ToShortDateString();
            }

            if (ModelState.IsValid)
            {
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

        #endregion

        #region Videos
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Modified On: Oct 21 2014,
        /// Description: Added HospitalId and DoctorId.
        /// </summary>
        /// <param name="HospitalId"></param>
        /// <param name="DoctorId"></param>
        /// <returns></returns>
        [HttpGet]
        [PatientAuthorize]
        public List<Video> GetAllVideos(int id)
        {
            Patient currentUser = Users.GetCurrentPatient(db);

            if (currentUser == null)
            {
                throw new HttpResponseException(ErrorResponse.Get(this, HttpStatusCode.Unauthorized));
            }

            List<Video> videos = db.Videos.Where(x=> x.HospitalId == id).ToList();
            return videos;
        }
        #endregion

        #region Medical Records

        [HttpPost]
        [PatientAuthorize]
        public HttpResponseMessage UploadMedicalRecord(MedicalRecord medicalRecord)
        {
            Patient patient = Users.GetCurrentPatient(db);
            if (ModelState.IsValid)
            {
                try
                {
                    if (string.IsNullOrEmpty(medicalRecord.MedicalRecordName))
                    {
                        medicalRecord.MedicalRecordName = "MedicalRecord - " + DateTime.Now.ToShortDateString();
                    }
                    medicalRecord.PatientId = patient.PatientID;
                    //medicalRecord.HospitalId = medicalRecord.HospitalId;//-1
                    medicalRecord.AddedBy = patient.UserName;
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
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Modified On: Oct 21 2014,
        /// Description: Added HospitalId and DoctorId.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [PatientAuthorize]
        public List<MedicalRecordVM> GetMyMedicalRecords(int firstId, int secondId)
        {//DoctorId:firstId & HospitalId:secondId
            Patient patient = Users.GetCurrentPatient(db);

            var medicalrecords = db.MedicalRecords
                            .Where(x => x.PatientId == patient.PatientID && x.HospitalId == secondId && x.DoctorID == firstId)
                            .Select(row => new MedicalRecordVM() { MedicalRecordId = row.MedicalRecordId, MedicalRecordName = row.MedicalRecordName, PatientId = row.PatientId, PatientName = row.Patient.FullName, MedicalRecordDate = row.AddedOn ?? DateTime.Now })
                            .ToList();
            return medicalrecords;
        }

        [HttpGet]
        [PatientAuthorize]
        public MedicalRecord GetRecord(int id)
        {
            Patient patient = Users.GetCurrentPatient(db);
            MedicalRecord medicalRecord = db.MedicalRecords.FirstOrDefault(x => x.MedicalRecordId == id && x.PatientId == patient.PatientID);

            return medicalRecord;
        }

        #endregion

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
       

    }
}