using CareDataModels.Appointments;
using CareDataModels.Models;
using CareWeb.Models;
using CareWeb.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Controllers
{
    public class StaffController : Controller
    {
        [StaffAuthorize]
        public ActionResult StaffHome()
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            return View();
        }        

        #region Doctors
        [StaffAuthorize]
        public ViewResult CreateDoctor()
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                using (CareEntities dbContext = new CareEntities())
                { 
                    foreach (var country in dbContext.Countries)
                    {
                        AvailableCountries.Add(new SelectListItem()
                        {
                            Text = country.CountryName,
                            Value = country.CountryId.ToString()
                        });
                    }

                    ViewBag.Country = AvailableCountries;
                    ViewBag.State = AvailableStates;
                    ViewBag.City = Availablecities;
                }
                return View();
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Modified On: Oct 22 2014,
        /// Description: Added RoleId, UserName.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [StaffAuthorize]
        [HttpPost]
        public ActionResult CreateDoctor(Doctor user)
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                Hospital hospital = null;

                string fromTime = Request.Form["txtFrom"].Replace(" ", String.Empty);
                string toTime = Request.Form["txtto"].Replace(" ", String.Empty); 
                //if (ModelState.IsValid)
                //{
                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> existDoctor = dbContext.Doctors.Where(x => x.Phone == user.Phone).ToList();

                    if (existDoctor.Count == 0)
                            {
                                ViewBag.Country = dbContext.Countries.ToList();
                                hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == staff.HospitalID);
                                user.UserName = user.Phone;
                                user.RoleId = 8;
                                user.HospitalId = hospital.HospitalId;
                                user.AddedOn = DateTime.UtcNow;
                                user.IsActive = true;
                                user.Hospitals.Add(hospital);
                                dbContext.Doctors.Add(user);
                                dbContext.SaveChanges();
                                AppointmentSlot _appointmentSlots = new AppointmentSlot();
                                DoctorAppointmentSchedule _doctorAppointmentSchedule = new DoctorAppointmentSchedule();

                                if (fromTime != "" || toTime != "")
                                {
                                    if (user.DoctorID > 0)
                                    {

                                        var fTimeArray = Request.Form["txtFrom"].Split(':');

                                        DateTime startTime = Convert.ToDateTime(fromTime);
                                        DateTime endtime = Convert.ToDateTime(toTime);


                                        _appointmentSlots.SlotFromDateTime = startTime;
                                        _appointmentSlots.SlotToDateTime = endtime;

                                        _appointmentSlots.DoctorID = user.DoctorID;
                                        _appointmentSlots.SlotFrom = fromTime;
                                        _appointmentSlots.SlotTo = toTime;
                                        var aid = dbContext.AppointmentSlots.Add(_appointmentSlots);
                                        dbContext.SaveChanges();

                                        TimeSpan duration = endtime - startTime;
                                        double intMin = Convert.ToDouble(user.Intervels);
                                        double mins = duration.TotalMinutes;
                                        double intervels = mins / intMin;

                                        dynamic Intervalendtime = null;

                                        for (int i = 0; i < intervels; i++)
                                        {

                                            Intervalendtime = startTime.AddMinutes(intMin);
                                            var dat = startTime.ToShortTimeString() + "-" + Intervalendtime.ToShortTimeString();

                                            _doctorAppointmentSchedule.SlotFromDateTime = startTime;
                                            _doctorAppointmentSchedule.SlotToDateTime = Intervalendtime;

                                            startTime = Intervalendtime;
                                            //Inserting to AppointSchedules
                                            _doctorAppointmentSchedule.DoctorID = user.DoctorID;
                                            _doctorAppointmentSchedule.AppointmentSlotID = aid.AppointmentSlotsID;
                                            _doctorAppointmentSchedule.Timings_Slot = dat;
                                            _doctorAppointmentSchedule.isdeleted = false;
                                            dbContext.DoctorAppointmentSchedules.Add(_doctorAppointmentSchedule);
                                            dbContext.SaveChanges();

                                        }
                                    }
                                }
                                return RedirectToAction("DoctorInfo", new { id = user.DoctorID });
                            }
                            else
                            {

                                foreach (var country in dbContext.Countries)
                                {
                                    AvailableCountries.Add(new SelectListItem()
                                    {
                                        Text = country.CountryName,
                                        Value = country.CountryId.ToString()
                                    });
                                }

                                ViewBag.Country = AvailableCountries;
                                if (user.State != "")
                                {
                                    var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                                    foreach (var State in States)
                                    {
                                        AvailableStates.Add(new SelectListItem()
                                        {
                                            Text = State.StateName,
                                            Value = State.StateId.ToString(),
                                            Selected = (State.StateId.ToString() == user.State)
                                        });
                                    }
                                    ViewBag.State = AvailableStates;
                                }
                                if (user.City != "")
                                {
                                    var Cities = dbContext.Districts.
                                                    Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                                        (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(user.State)).ToList();

                                    foreach (var City in Cities)
                                    {
                                        Availablecities.Add(new SelectListItem()
                                        {
                                            Text = City.SubRegionName,
                                            Value = City.SubRegionId.ToString(),
                                            Selected = (City.SubRegionId.ToString() == user.City)

                                        });
                                    }
                                    ViewBag.City = Availablecities;
                                }
                                ModelState.AddModelError("", "Mobile number already exist");
                                return View();

                            }
                }
                /*}
                else
                {

                    using (CareEntities dbContext = new CareEntities())
                    {
                        ViewBag.Country = dbContext.Countries.ToList();
                    }
                }*/

            }
            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {
                Exception ErrorRaise = ex;
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string errorMessage = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);

                        ErrorRaise = new InvalidOperationException(errorMessage, ErrorRaise);
                    }
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }



            return View(user);
        }
        [HttpGet]
        public JsonResult AppointmentsValidation(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 

            List<CareDataModels.Appointments.Appointments> appointments = new List<CareDataModels.Appointments.Appointments>();
                if (id != 0)
                {
                    try
                    {
                        
                       
                        using (CareEntities dbContext = new CareEntities())
                        {
                            appointments = dbContext.DoctorAppointmentSchedules.Join
                                             (
                                             dbContext.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new CareDataModels.Appointments.Appointments
                                             {
                                                 ScheduleId = das.ScheduleId,
                                                 Timings_Slot = das.Timings_Slot,
                                                 AppointmentSlotID = (int)das.AppointmentSlotID,
                                                 DoctorsID = (int)das.DoctorID,
                                                 AppointmentDate = (DateTime)da.AppointmentDate,
                                                 IsBooked = (bool)da.IsSlotBooked,
                                                 patientID = (int)da.PatientId,
                                                 IsDeleted = (bool)das.isdeleted,
                                                 AppointmentId = da.Id

                                             }).Where(x => x.AppointmentSlotID == id && x.IsDeleted == false).ToList();
                        }
                    }
                    catch (Exception Ex)
                    {

                    }
                    if (appointments.Count > 0)
                    {
                        return Json("Sucess", JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json("NoAppointments", JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json("Response from Get", JsonRequestBehavior.AllowGet);
                }
            
            

        }
        /// <summary>
        /// Added By: Harikrishna Bura,
        /// Modified On: Jan 19 2014,
        /// Description: Deleting the TimeSlot of Perticular.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var doctorId = "";
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 

                using (CareEntities dbContext = new CareEntities())
                {
                    //SodtDeletion of Appointment Slots
                    var slotId = dbContext.AppointmentSlots.Where(x => x.AppointmentSlotsID == id).FirstOrDefault();
                    doctorId = slotId.DoctorID.ToString();
                    if (slotId != null)
                    {
                        slotId.isdeleted = true;
                        dbContext.Entry(slotId).State = EntityState.Modified;
                        dbContext.SaveChanges();

                        var slotsList = dbContext.DoctorAppointmentSchedules.Where(x => x.AppointmentSlotID == id).ToList();

                        foreach (var slots in slotsList)
                        {
                            slots.isdeleted = true;
                            dbContext.SaveChanges();

                            var delDocApp = dbContext.DoctorAppointments.Where(x => x.ScheduleId == slots.ScheduleId).FirstOrDefault();
                            if (delDocApp != null)
                            {
                                //delDocApp.isdeleted = true;
                                dbContext.Entry(delDocApp).State = EntityState.Deleted;
                                dbContext.SaveChanges();
                            }


                        }

                    }
                    //

                }
                // return true;
                return RedirectToAction("EditDoctor", new { id = doctorId });
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

        }
        public ActionResult CancelMultipleAppointment(string strid)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            DoctorAppointment appointment = null;

            char[] commaSeparator = new char[] { ',' };
       
            string[] result;
            try
            {

                using (CareEntities dbContext = new CareEntities())
                {

                    try
                    {
                        result = strid.Split(commaSeparator, StringSplitOptions.RemoveEmptyEntries);

                        foreach (var item in result)
                        {
                            var id = Convert.ToInt32(item);
                            appointment = dbContext.DoctorAppointments.FirstOrDefault(x => x.Id == id);
                            if (appointment != null)
                            {
                                var app = dbContext.DoctorAppointments.Remove(appointment);
                            }

                        }

                        dbContext.SaveChanges();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {

                    }

                }
                return RedirectToAction("AppointmentsList", "Staff");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        [StaffAuthorize]
        public ActionResult DoctorInfo(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                //Doctor doctor = null;
                /*using (CareEntities dbContext = new CareEntities())
                {
                    doctor = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                    int Sid = Convert.ToInt32(doctor.State);
                    var state = dbContext.States.Where(x => x.StateId == Sid).FirstOrDefault();
                    doctor.State = state.StateName;
                    int cid = Convert.ToInt32(doctor.City);
                    var City = dbContext.SubRegions.Where(x => x.SubRegionId == cid).FirstOrDefault();
                    doctor.City = City.SubRegionName;

                

                     DoctoInfo = dbContext.Doctors.Join
                       (
                       dbContext.AppointmentSlots, d => d.DoctorID, das => das.DoctorID, (d, das) => new CareDataModels.DoctorInfo.DoctorInfo
                       {
                           AppointmentSlotVM = das,
                           DoctorVM =  d 
                       }).Where(x=>x.DoctorVM.DoctorID==id).ToList();
             
                }*/

                // 
                List<AppointmentSlot> appSlot = new List<AppointmentSlot>();
                CareDataModels.DoctorInfo.DoctorInfo DoctoInfo = new CareDataModels.DoctorInfo.DoctorInfo();
                using (CareEntities db = new CareEntities())
                {
                    appSlot = db.AppointmentSlots.Where(x => x.DoctorID == id && x.isdeleted == false).OrderBy(x => x.SlotFromDateTime).ToList();
                    
                    DoctoInfo.DoctorVM = db.Doctors.FirstOrDefault(x => x.DoctorID == id);
                    DoctoInfo.AppointmentSlotVM = appSlot;
                    int Sid = Convert.ToInt32(DoctoInfo.DoctorVM.State);
                    var state = db.States.Where(x => x.StateId == Sid).FirstOrDefault();
                    DoctoInfo.DoctorVM.State = state.StateName;
                    int cid = Convert.ToInt32(DoctoInfo.DoctorVM.City);
                    var City = db.SubRegions.Where(x => x.SubRegionId == cid).FirstOrDefault();
                    DoctoInfo.DoctorVM.City = City.SubRegionName;

                }
                //
                return View("DoctorInfo", DoctoInfo);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ViewResult DoctorsList()
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 

            IEnumerable<Doctor> listDoctors = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
                }

                ViewData["FullName"] = staff.FirstName;

                return View(listDoctors);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        /// <summary>
        /// Modified By: HarikrishnaBura,
        /// Modified on: Jan 28 2015,
        /// Description: Validating the Null Values.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [StaffAuthorize]
        public ActionResult DoctorsList(string id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 

            List<Doctor> listDoctors = new List<Doctor>();
            string searchString = Request.Form["SearchBox"];
            try
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        listDoctors = dbContext.Doctors.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString))
                            && x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList();
                    }
                    return View(listDoctors);
                }
                else
                {
                    return RedirectToAction("DoctorsList");

                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpGet]
        [StaffAuthorize]
        public ViewResult EditDoctor(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
           // Doctor doctorToEdit = null;
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            //
            List<AppointmentSlot> appSlot = new List<AppointmentSlot>();
            CareDataModels.DoctorInfo.DoctorInfo DoctoInfo = new CareDataModels.DoctorInfo.DoctorInfo();

            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    // doctorToEdit = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                    appSlot = dbContext.AppointmentSlots.Where(x => x.DoctorID == id && x.isdeleted == false).ToList();
                    DoctoInfo.DoctorVM = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                    DoctoInfo.AppointmentSlotVM = appSlot;
                    foreach (var country in dbContext.Countries)
                    {
                        AvailableCountries.Add(new SelectListItem()
                        {
                            Text = country.CountryName,
                            Value = country.CountryId.ToString()
                        });
                    }

                    var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                    foreach (var State in States)
                    {
                        AvailableStates.Add(new SelectListItem()
                        {
                            Text = State.StateName,
                            Value = State.StateId.ToString(),
                            Selected = (State.StateId.ToString() == DoctoInfo.DoctorVM.State)
                        });
                    }

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(DoctoInfo.DoctorVM.State)).ToList();

                    foreach (var City in Cities)
                    {
                        Availablecities.Add(new SelectListItem()
                        {
                            Text = City.SubRegionName,
                            Value = City.SubRegionId.ToString(),
                            Selected = (City.SubRegionId.ToString() == DoctoInfo.DoctorVM.City)

                        });
                    }



                    ViewBag.Country = AvailableCountries;
                    ViewBag.States = AvailableStates;
                    ViewBag.Cities = Availablecities;

                }
                return View("EditDoctor", DoctoInfo);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult EditDoctor(CareDataModels.DoctorInfo.DoctorInfo user)
        {
            /*if (!ModelState.IsValid)
            {
                return View(user);
            }*/
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            AppointmentSlot _appointmentSlots = new AppointmentSlot();
            DoctorAppointmentSchedule _doctorAppointmentSchedule = new DoctorAppointmentSchedule();
            using (CareEntities dbContext = new CareEntities())
            {
                try
                {
                    //
                    string fromTime = Request.Form["txtFrom"].Replace(" ", String.Empty); 
                    string toTime = Request.Form["txtto"].Replace(" ", String.Empty);

                    _appointmentSlots.DoctorID = user.DoctorVM.DoctorID;
                    


                    if (fromTime != "")
                    {
                        var fTimeArray = Request.Form["txtFrom"].Split(':');

                        DateTime startTime = Convert.ToDateTime(fromTime);
                        DateTime endtime = Convert.ToDateTime(toTime);

                        var appSlot = dbContext.AppointmentSlots.Where(x => x.DoctorID == user.DoctorVM.DoctorID && x.isdeleted == false).ToList();

                        var Slot = appSlot.Where(r => r.SlotFromDateTime <= endtime && r.SlotToDateTime >= startTime).Count();

                        if (Slot == 0)
                        {
                            #region _appointmentSlots
                           
                            _appointmentSlots.SlotFrom = fromTime;
                            _appointmentSlots.SlotTo = toTime;
                            _appointmentSlots.SlotFromDateTime = startTime;
                            _appointmentSlots.SlotToDateTime = endtime;
                            
                            var aid = dbContext.AppointmentSlots.Add(_appointmentSlots);
                            dbContext.SaveChanges();

                            TimeSpan duration = endtime - startTime;
                            double intMin = Convert.ToDouble(user.DoctorVM.Intervels);
                            double mins = duration.TotalMinutes;
                            double intervels = mins / intMin;

                            dynamic Intervalendtime = null;

                            for (int i = 0; i < intervels; i++)
                            {

                                var _doctorAppointment = new DoctorAppointmentSchedule();

                                Intervalendtime = startTime.AddMinutes(intMin);
                                var dat = startTime.ToShortTimeString() + "-" + Intervalendtime.ToShortTimeString();
                                startTime = Intervalendtime;
                                _doctorAppointment.Timings_Slot = dat;
                                _doctorAppointmentSchedule.DoctorID = user.DoctorVM.DoctorID;
                                _doctorAppointmentSchedule.AppointmentSlotID = aid.AppointmentSlotsID;
                                _doctorAppointmentSchedule.Timings_Slot = dat;
                                _doctorAppointmentSchedule.SlotFromDateTime = startTime;
                                _doctorAppointmentSchedule.SlotToDateTime = Intervalendtime;
                                dbContext.DoctorAppointmentSchedules.Add(_doctorAppointmentSchedule);
                                dbContext.SaveChanges();

                            }

                            #endregion _appointmentSlots

                            CareDataModels.Utility.UpdateDoctor(dbContext, user.DoctorVM);                          

                            return RedirectToAction("DoctorInfo", new { id = user.DoctorVM.DoctorID });
                        }
                        else
                        {
                            ViewBag.msgSlot ="Slot already exists";
                            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
                            List<SelectListItem> AvailableStates = new List<SelectListItem>();
                            List<SelectListItem> Availablecities = new List<SelectListItem>();
                            //
                           
                            CareDataModels.DoctorInfo.DoctorInfo DoctoInfo = new CareDataModels.DoctorInfo.DoctorInfo();

                            
                               
                                    // doctorToEdit = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                                    appSlot = dbContext.AppointmentSlots.Where(x => x.DoctorID == user.DoctorVM.DoctorID && x.isdeleted == false).ToList();
                                    DoctoInfo.DoctorVM = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == user.DoctorVM.DoctorID);
                                    DoctoInfo.AppointmentSlotVM = appSlot;
                                    foreach (var country in dbContext.Countries)
                                    {
                                        AvailableCountries.Add(new SelectListItem()
                                        {
                                            Text = country.CountryName,
                                            Value = country.CountryId.ToString()
                                        });
                                    }

                                    var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                                    foreach (var State in States)
                                    {
                                        AvailableStates.Add(new SelectListItem()
                                        {
                                            Text = State.StateName,
                                            Value = State.StateId.ToString(),
                                            Selected = (State.StateId.ToString() == DoctoInfo.DoctorVM.State)
                                        });
                                    }

                                    var Cities = dbContext.Districts.
                                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(DoctoInfo.DoctorVM.State)).ToList();

                                    foreach (var City in Cities)
                                    {
                                        Availablecities.Add(new SelectListItem()
                                        {
                                            Text = City.SubRegionName,
                                            Value = City.SubRegionId.ToString(),
                                            Selected = (City.SubRegionId.ToString() == DoctoInfo.DoctorVM.City)

                                        });
                                    }

                                    ViewBag.Country = AvailableCountries;
                                    ViewBag.States = AvailableStates;
                                    ViewBag.Cities = Availablecities;

                                
                                return View("EditDoctor", DoctoInfo);
                            
                            
                        }

                    }
                    else
                    {
                        CareDataModels.Utility.UpdateDoctor(dbContext, user.DoctorVM);                  

                       

                        return RedirectToAction("DoctorInfo", new { id = user.DoctorVM.DoctorID });

                    }
                }
                catch (Exception Ex)
                {
                    return View("Error");
                }
                return RedirectToAction("EditDoctor", new { id = user.DoctorVM.DoctorID });
            }
        }
          #endregion appointmentSlot

        #region Patients
        [HttpGet]
        [StaffAuthorize]
        public ViewResult EditPatient(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 

            Patient PatientToEdit = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    PatientToEdit = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);

                    List<SelectListItem> AvailableCountries = new List<SelectListItem>();
                    List<SelectListItem> AvailableStates = new List<SelectListItem>();
                    List<SelectListItem> Availablecities = new List<SelectListItem>();

                    foreach (var country in dbContext.Countries)
                    {
                        AvailableCountries.Add(new SelectListItem()
                        {
                            Text = country.CountryName,
                            Value = country.CountryId.ToString()
                        });
                    }

                    var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                    foreach (var State in States)
                    {
                        AvailableStates.Add(new SelectListItem()
                        {
                            Text = State.StateName,
                            Value = State.StateId.ToString(),
                            Selected = (State.StateId.ToString() == PatientToEdit.State)
                        });
                    }

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(PatientToEdit.State)).ToList();

                    foreach (var City in Cities)
                    {
                        Availablecities.Add(new SelectListItem()
                        {
                            Text = City.SubRegionName,
                            Value = City.SubRegionId.ToString(),
                            Selected = (City.SubRegionId.ToString() == PatientToEdit.City)

                        });
                    }




                    ViewBag.Country = AvailableCountries;
                    ViewBag.States = AvailableStates;
                    ViewBag.Cities = Availablecities;
                }

                return View("EditPatient", PatientToEdit);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult EditPatient(Patient user)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 

                if (!ModelState.IsValid)
                {
                    return RedirectToAction("PatientInfo", new { id = user.PatientID });
                }
                using (CareEntities dbContext = new CareEntities())
                {
                    try
                    {
                        foreach (string upload in Request.Files)
                        {
                            string mimeType = Request.Files[upload].ContentType;
                            Stream fileStream = Request.Files[upload].InputStream;
                            string fileName = Path.GetFileName(Request.Files[upload].FileName);
                            int fileLength = Request.Files[upload].ContentLength;
                            byte[] fileData = new byte[fileLength];
                            fileStream.Read(fileData, 0, fileLength);
                            if (fileData.Length > 0)
                                user.ImageContent = fileData;
                        }
                        CareDataModels.Utility.UpdatePatient(dbContext, user);
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {

                    }
                    return RedirectToAction("PatientInfo", new { id = user.PatientID });
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ViewResult PatientsList()
        {
            //List<Patient> patients = new List<Patient>();
            //return View(patients);
            //
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 

            IEnumerable<Patient> listPatients = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listPatients = dbContext.Patients.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
                }

                ViewData["FullName"] = staff.FirstName;
                return View(listPatients);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            //
        }

        [HttpPost]
        [StaffAuthorize]
        public ViewResult PatientsList(string id)
        {
            string searchString = Request.Form["SearchBox"];
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            List<Patient> listPatients = new List<Patient>();
            try
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        listPatients = dbContext.Patients.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString)) &&
                             x.Hospitals.Any(a => a.Staffs.Any(s => s.StaffID == staff.StaffID))).ToList();
                    }
                }
                if (listPatients.Count > 0)
                    ViewBag.Norecords = "";
                else
                    ViewBag.Norecords = "No records found";
                return View(listPatients);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ViewResult CreatePatient()
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                using (CareEntities dbContext = new CareEntities())
                {
                    foreach (var country in dbContext.Countries)
                    {
                        AvailableCountries.Add(new SelectListItem()
                        {
                            Text = country.CountryName,
                            Value = country.CountryId.ToString()
                        });
                    }
                    ViewBag.Country = AvailableCountries;
                    ViewBag.State = AvailableStates;
                    ViewBag.City = Availablecities;
                }
                return View();
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetStates(Int32 id)
        {
            dynamic AvailableStates = "";
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    var States = dbContext.States.Where(x => x.CountryId == id).OrderBy(x=>x.StateName).ToList();

                    AvailableStates = (from s in States
                                       select new
                                       {
                                           id = s.StateId,
                                           name = s.StateName

                                       }).ToList();



                }

                return Json(AvailableStates, JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

        }



        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetCities(Int32 id)
        {
            dynamic Availablecities = "";
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == id).OrderBy(x => x.SubRegionName).ToList();

                    Availablecities = (from s in Cities
                                       select new
                                       {
                                           id = s.SubRegionId,
                                           name = s.SubRegionName

                                       }).ToList();



                }

                return Json(Availablecities, JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Description: Added Role, AddedOn.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        [StaffAuthorize]
        public ActionResult CreatePatient(Patient user, string Country, string State, string City)
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            Hospital hospital = null;
            try
            {
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        List<Patient> existPatient = dbContext.Patients.Where(x => x.Phone == user.Phone).ToList();
                        if (existPatient.Count == 0)
                         {
                             if (user.DOB != null)
                             {
                                 user.DOB = DateTime.ParseExact(Request.Form["DOB"], "dd/MMM/yyyy", CultureInfo.InvariantCulture);
                             }

                             hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == staff.HospitalID);
                             user.UserName = user.Phone;
                             user.AddedOn = DateTime.UtcNow;
                             user.RoleId = 16;
                             user.IsActive = true;
                             user.Hospitals.Add(hospital);

                             foreach (string upload in Request.Files)
                             {
                                 string mimeType = Request.Files[upload].ContentType;
                                 Stream fileStream = Request.Files[upload].InputStream;
                                 string fileName = Path.GetFileName(Request.Files[upload].FileName);
                                 int fileLength = Request.Files[upload].ContentLength;
                                 byte[] fileData = new byte[fileLength];
                                 fileStream.Read(fileData, 0, fileLength);
                                 user.ImageContent = fileData;
                             }

                             dbContext.Patients.Add(user);
                             dbContext.SaveChanges();
                             return RedirectToAction("PatientInfo", new { id = user.PatientID });
                         }
                         else
                        {

                            foreach (var country in dbContext.Countries)
                            {
                                AvailableCountries.Add(new SelectListItem()
                                {
                                    Text = country.CountryName,
                                    Value = country.CountryId.ToString()
                                });
                            }

                            ViewBag.Country = AvailableCountries;
                            if (user.State != "")
                            {
                                var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                                foreach (var State1 in States)
                                {
                                    AvailableStates.Add(new SelectListItem()
                                    {
                                        Text = State1.StateName,
                                        Value = State1.StateId.ToString(),
                                        Selected = (State1.StateId.ToString() == user.State)
                                    });
                                }
                                ViewBag.State = AvailableStates;
                            }
                            if (user.City != "")
                            {
                                var Cities = dbContext.Districts.
                                                Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                                    (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                                Cities = Cities.Where(x => x.StateId == Convert.ToInt32(user.State)).ToList();

                                foreach (var City1 in Cities)
                                {
                                    Availablecities.Add(new SelectListItem()
                                    {
                                        Text = City1.SubRegionName,
                                        Value = City1.SubRegionId.ToString(),
                                        Selected = (City1.SubRegionId.ToString() == user.City)

                                    });
                                }
                                ViewBag.City = Availablecities;
                            }
                            ModelState.AddModelError("", "Mobile number already exist");
                            return View();

                         }
                    }
                }
                else
                {

                    using (CareEntities dbContext = new CareEntities())
                    { 

                        foreach (var country in dbContext.Countries)
                        {
                            AvailableCountries.Add(new SelectListItem()
                            {
                                Text = country.CountryName,
                                Value = country.CountryId.ToString()
                            });
                        }

                        ViewBag.Country = AvailableCountries;
                    }
                }

                return View(user);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        //[StaffAuthorize]
        //public ActionResult PatientInfo(int id)
        //{
        //    Patient patient = null;
        //    using (CareEntities dbContext = new CareEntities())
        //    {
        //        patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
        //    }

        //    return View("PatientInfo", patient);
        //}

        [StaffAuthorize]
        public ActionResult PatientInfo(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            Patient patient = null;
            IList<MedicalRecord> medicalRecords = new List<MedicalRecord>();
            CareDataModels.PatientMedicalRecordsVM.PatientMedicalRecordsVM vm = new CareDataModels.PatientMedicalRecordsVM.PatientMedicalRecordsVM();
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
                    medicalRecords = dbContext.MedicalRecords.Where(x => x.PatientId == id).ToList();
                    //
                    //var query = (from MedicalRecords in dbContext.MedicalRecords
                    //             join Doctor in dbContext.Doctors
                    //             on MedicalRecords.DoctorID equals Doctor.DoctorID
                    //             where MedicalRecords.DoctorID == Doctor.DoctorID && MedicalRecords.PatientId == id
                    //             select new
                    //             {
                    //                 ImageExtension = MedicalRecords.ImageExtension,
                    //                 AddedOn = MedicalRecords.AddedOn,
                    //                 DoctorName = Doctor.FullName,
                    //                 MedicalRecordImage = MedicalRecords.MedicalRecordImage,
                    //                 MedicalRecordName = MedicalRecords.MedicalRecordName
                    //             }
                    //            );
                    //ViewData["medicalRecords"] = query;

                    string docName = string.Empty;

                    if (medicalRecords.Count > 0)
                    {
                        int docID = Convert.ToInt32(medicalRecords.FirstOrDefault().DoctorID);
                        docName = dbContext.Doctors.Where(x => x.DoctorID == docID).FirstOrDefault().FullName;
                    }

                    ViewData["doctor"] = docName;

                var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                var Cities = dbContext.Districts.
                           Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                               (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                Cities = Cities.Where(x => x.StateId == Convert.ToInt32(patient.State)).ToList();

                foreach (var State in States)
                {
                       if(State.StateId.ToString() == patient.State)
                       {
                          patient.State = State.StateName;
                       }                    
                }
                foreach (var City in Cities)
                {
                     if(City.SubRegionId.ToString() == patient.City)
                       {
                           patient.City = City.SubRegionName;
                       }                  
                }
            }
                vm.patient = patient;
                vm.medicalRecords = medicalRecords;

                return View("PatientInfo", vm);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        #endregion

        #region Appointments
        /// <summary>
        /// Added by: Harikrishna Bura,
        /// Added on: Jan 23 2015,
        /// Description: Fecthing the timeslots basedon timePeriods.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult GetSlotsBasedonTime(Int32 id, string doctorID, string SelectedDate)        
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 

                IEnumerable<SelectListItem> selectlistDoctors = null;
                IEnumerable<SelectListItem> TimingSlots = null;

                List<Appointments> _listAppointments = new List<Appointments>();
                List<Appointments> _appointments = new List<Appointments>();

                List<AppointmentSlot> appSlot = new List<AppointmentSlot>();
                DateTime crrdate = DateTime.ParseExact(DateTime.Now.ToString("dd/M/yyyy"), "dd/M/yyyy", CultureInfo.InvariantCulture);
                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                    int selectedDoctor = 0;
                    selectedDoctor = Convert.ToInt32(doctorID);

                    try
                    {
                        crrdate = DateTime.ParseExact(SelectedDate, "dd/M/yyyy", CultureInfo.InvariantCulture);//MMM
                        ViewBag.SelectedDate = DateTime.ParseExact(SelectedDate, "dd/M/yyyy", CultureInfo.InvariantCulture).ToShortDateString();
                        _appointments = dbContext.DoctorAppointmentSchedules.Join
                                         (
                                         dbContext.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new Appointments
                                         {
                                             ScheduleId = das.ScheduleId,
                                             Timings_Slot = das.Timings_Slot,
                                             AppointmentSlotID = (int)das.AppointmentSlotID,
                                             DoctorsID = (int)das.DoctorID,
                                             AppointmentDate = (DateTime)da.AppointmentDate,
                                             IsBooked = (bool)da.IsSlotBooked,
                                             patientID = (int)da.PatientId,
                                             // IsDeleted = (bool)da.isdeleted,
                                             AppointmentId = da.Id

                                         }).Where(x => x.DoctorsID == selectedDoctor && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate).ToList();

                        _listAppointments = dbContext.DoctorAppointmentSchedules.Select(x => new Appointments
                        {
                            AppointmentDate = crrdate,
                            AppointmentSlotID = (Int32)x.AppointmentSlotID,
                            ScheduleId = x.ScheduleId,
                            Timings_Slot = x.Timings_Slot,
                            IsBooked = false,
                            DoctorsID = (int)x.DoctorID

                        }).Where(x => x.DoctorsID == selectedDoctor && x.AppointmentSlotID == id).ToList<Appointments>();

                        foreach (var items in _listAppointments)
                        {
                            foreach (var aItem in _appointments)
                            {
                                if (aItem.ScheduleId == items.ScheduleId)
                                {
                                    Patient obj = dbContext.Patients.Where(x => x.PatientID == aItem.patientID).FirstOrDefault();
                                    items.IsBooked = aItem.IsBooked;
                                    items.AppointmentDate = crrdate;
                                    items.patientName = obj.FirstName;
                                    items.AppointmentId = aItem.AppointmentId;
                                }


                            }

                        }
                        appSlot = dbContext.AppointmentSlots.Where(x => x.DoctorID == selectedDoctor && x.isdeleted == false).ToList();

                        List<SelectListItem> AvailableSlots = new List<SelectListItem>();

                        var AppSlots = dbContext.AppointmentSlots.Where(x => x.DoctorID == selectedDoctor && x.isdeleted == false);

                        foreach (var slots in AppSlots)
                        {
                            AvailableSlots.Add(new SelectListItem()
                            {
                                Text = slots.SlotFrom + "-" + slots.SlotTo,
                                Value = slots.AppointmentSlotsID.ToString(),
                                Selected = (slots.AppointmentSlotsID.ToString() == id.ToString())
                            });
                        }
                        ViewBag.AppointmentSlotsID = AvailableSlots;

                    }
                    catch (System.Data.Entity.Validation.DbEntityValidationException ex)
                    {
                        Exception ErrorRaise = ex;
                        foreach (var validationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in validationErrors.ValidationErrors)
                            {
                                string errorMessage = string.Format("{0}:{1}",
                                    validationErrors.Entry.Entity.ToString(),
                                    validationError.ErrorMessage);

                                ErrorRaise = new InvalidOperationException(errorMessage, ErrorRaise);
                            }
                        }
                    }  
                    selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                    ViewBag.DoctorID = selectlistDoctors;
                }
                return View("AppointmentsList", _listAppointments);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult AppointmentInfo(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                Appointment appointment = null;

                using (CareEntities dbContext = new CareEntities())
                {
                    appointment = dbContext.Appointments.Include("Patient").Include("Doctor").FirstOrDefault(x => x.AppointmentId == id && x.HospitalId == staff.HospitalID);
                }

                return View("AppointmentInfo", appointment);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult RegisterAppointment(int doctorID, int? ScheduleId,string date)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 

                IEnumerable<SelectListItem> listDoctors = null;
                IEnumerable<SelectListItem> listPatients = null;
                DoctorAppointmentSchedule timeSlot = new DoctorAppointmentSchedule();
                Appointment app = new Appointment();
                using (CareEntities dbContext = new CareEntities())
                {
                    listDoctors = new SelectList(dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID) && x.DoctorID == doctorID).ToList(), "DoctorID", "FullName", 0);
                    listPatients = new SelectList(dbContext.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList(), "PatientID", "FullName", 0);
                    timeSlot = dbContext.DoctorAppointmentSchedules.Where(x => x.ScheduleId == ScheduleId).FirstOrDefault();
                }
                app.AddedBy = timeSlot.Timings_Slot;
                app.AppointmentId = timeSlot.ScheduleId;
                app.AppointmentDate = DateTime.ParseExact(date, @"M/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                ViewBag.DoctorID = listDoctors;
                ViewBag.PatientID = listPatients;
                return View("RegisterAppointment", app);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult RegisterAppointment(Appointment appointment)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                if (ModelState.IsValid)
                {

                  
                    DoctorAppointment docApp = new DoctorAppointment();
                    docApp.Hospitald = staff.HospitalID;
                    docApp.PatientId = appointment.PatientId;
                    docApp.ScheduleId = appointment.AppointmentId;
                    docApp.AppointmentDate = appointment.AppointmentDate;
                    // docApp.isdeleted = false;
                    docApp.IsSlotBooked = true;
                    using (CareEntities dbContext = new CareEntities())
                    {
                        // appointment.AppointmentDate = DateTime.ParseExact(Request.Form["AppointmentDate"], "dd/MMM/yyyy hh:mm tt", CultureInfo.InvariantCulture);

                        dbContext.DoctorAppointments.Add(docApp);
                        dbContext.SaveChanges();
                    

                   // return RedirectToAction("AppointmentsList");
                        /***/
                        List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                        List<CareDataModels.Appointments.Appointments> appointments = new List<CareDataModels.Appointments.Appointments>();
                        List<CareDataModels.Appointments.Appointments> listAppointments = new List<CareDataModels.Appointments.Appointments>();
                        List<SelectListItem> AvailableSlots = new List<SelectListItem>();
                        DateTime selectedDate = Convert.ToDateTime(appointment.AppointmentDate);
                        DateTime crrdate = selectedDate;
                        int selectedDoctor = 0;
                        selectedDoctor = 75;
                        IEnumerable<SelectListItem> selectlistDoctors = null;
                        selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                        ViewBag.DoctorID = selectlistDoctors;
                        ViewBag.SelectedDate = string.Format("{0:M/dd/yyyy}", appointment.AppointmentDate);
                        //New Code
                        appointments = dbContext.DoctorAppointmentSchedules.Join
                                     (
                                     dbContext.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new CareDataModels.Appointments.Appointments
                                     {
                                         ScheduleId = das.ScheduleId,
                                         Timings_Slot = das.Timings_Slot,
                                         AppointmentSlotID = (int)das.AppointmentSlotID,
                                         DoctorsID = (int)das.DoctorID,
                                         AppointmentDate = (DateTime)da.AppointmentDate,
                                         IsBooked = (bool)da.IsSlotBooked,
                                         patientID = (int)da.PatientId,
                                         IsDeleted = (bool)das.isdeleted,
                                         AppointmentId = da.Id

                                     }).Where(x => x.DoctorsID == selectedDoctor && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate && x.IsDeleted == false).ToList();

                        listAppointments = dbContext.DoctorAppointmentSchedules.Select(x => new CareDataModels.Appointments.Appointments
                        {
                            AppointmentDate = crrdate,
                            AppointmentSlotID = (Int32)x.AppointmentSlotID,
                            ScheduleId = x.ScheduleId,
                            Timings_Slot = x.Timings_Slot,
                            IsBooked = false,
                            DoctorsID = (int)x.DoctorID,
                            IsDeleted = (bool)x.isdeleted

                        }).Where(x => x.DoctorsID == selectedDoctor && x.IsDeleted == false).ToList<CareDataModels.Appointments.Appointments>();

                        foreach (var items in listAppointments)
                        {
                            foreach (var aItem in appointments)
                            {
                                if (aItem.ScheduleId == items.ScheduleId)
                                {
                                    Patient obj = dbContext.Patients.Where(x => x.PatientID == aItem.patientID).FirstOrDefault();
                                    items.IsBooked = aItem.IsBooked;
                                    items.AppointmentDate = crrdate;
                                    items.patientName = obj.FirstName;
                                    items.AppointmentId = aItem.AppointmentId;
                                }
                            }

                        }

                        var AppSlots = dbContext.AppointmentSlots.Where(x => x.DoctorID == selectedDoctor && x.isdeleted == false).OrderBy(x => x.SlotFromDateTime).ToList();

                        foreach (var slots in AppSlots)
                        {
                            AvailableSlots.Add(new SelectListItem()
                            {
                                Text = slots.SlotFrom + "-" + slots.SlotTo,
                                Value = slots.AppointmentSlotsID.ToString()
                            });
                        }
                        ViewBag.AppointmentSlotsID = AvailableSlots;
                        //
                        return View("AppointmentsList", listAppointments);
                    }
                    /**/
                }

                return View(appointment);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ViewResult CreateAppointmentForPatient(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            IEnumerable<SelectListItem> selectlistDoctors = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                    int selectedDoctor = 0;
                    if (listDoctors != null)
                    {
                        selectedDoctor = listDoctors[0].DoctorID;
                    }

                    selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                }

                ViewBag.DoctorID = selectlistDoctors;
                return View("CreateAppointmentForPatient");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult CreateAppointmentForPatient(int id, Appointment appointment)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                if (ModelState.IsValid)
                {
                  
                    using (CareEntities dbContext = new CareEntities())
                    {
                        appointment.AppointmentDate = DateTime.ParseExact(Request.Form["AppointmentDate"], "dd/MMM/yyyy hh:mm tt", CultureInfo.InvariantCulture);
                        appointment.HospitalId = staff.HospitalID;
                        appointment.PatientId = id;
                        dbContext.Appointments.Add(appointment);
                        dbContext.SaveChanges();
                    }

                    return RedirectToAction("AppointmentsList");
                }

                return View(appointment);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        //[StaffAuthorize]
        //public ViewResult AppointmentsList()
        //{
        //    Staff staff = Session["Staff"] as Staff;
        //    IEnumerable<SelectListItem> selectlistDoctors = null;
        //    List<Appointment> listAppointments = new List<Appointment>();
        //    int doctorId = -1;

        //    using (CareEntities dbContext = new CareEntities())
        //    {
        //        List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
        //        int selectedDoctor = 0;

        //        if (listDoctors.Count > 0)
        //        {
        //            selectedDoctor = listDoctors[0].DoctorID;
        //        }

        //        if (!string.IsNullOrEmpty(Request.Form["DoctorList"]) && !string.IsNullOrEmpty(Request.Form["DoctorList"]))
        //        {
        //            DateTime selectedDate;
        //            int.TryParse(Request.Form["DoctorList"], out doctorId);

        //            try
        //            {
        //                selectedDate = DateTime.ParseExact(Request.Form["SelectedDate"], "dd/M/yyyy", CultureInfo.InvariantCulture);//MMM
        //                listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
        //                    .Where(x => x.DoctorId == doctorId && x.Patient.Hospitals.Any(a => a.HospitalId == staff.HospitalID)
        //                    && x.AppointmentDate.Year == selectedDate.Year && x.AppointmentDate.Month == selectedDate.Month && x.AppointmentDate.Day == selectedDate.Day
        //                    ).ToList();
        //                selectedDoctor = doctorId;
        //                ViewBag.SelectedDate = string.Format("{0:dd/M/yyyy}", Request.Form["SelectedDate"]);//MMM
        //            }
        //            catch (Exception ex)
        //            {

        //            }
        //        }
        //        else
        //        {
        //            listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
        //                   .Where(x => x.DoctorId == selectedDoctor && x.Patient.Hospitals.Any(a => a.HospitalId == staff.HospitalID)
        //                   && x.AppointmentDate.Year == DateTime.Now.Year && x.AppointmentDate.Month == DateTime.Now.Month && x.AppointmentDate.Day == DateTime.Now.Day
        //                   ).ToList();
        //            ViewBag.SelectedDate = string.Format("{0:dd/M/yyyy}", DateTime.Now);
        //        }

        //        selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
        //        ViewBag.DoctorID = selectlistDoctors;
        //    }
        //    return View("AppointmentsList", listAppointments);
        //}
        [StaffAuthorize]
        public ViewResult AppointmentsList()        
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                IEnumerable<SelectListItem> selectlistDoctors = null;
                IEnumerable<SelectListItem> TimingSlots = null;
                List<CareDataModels.Appointments.Appointments> listAppointments = new List<CareDataModels.Appointments.Appointments>();
                List<CareDataModels.Appointments.Appointments> appointments = new List<CareDataModels.Appointments.Appointments>();
                List<AppointmentSlot> appSlot = new List<AppointmentSlot>();
                List<SelectListItem> AvailableSlots = new List<SelectListItem>();
                int doctorId = -1;
                DateTime crrdate = DateTime.ParseExact(DateTime.Now.AddDays(1).ToString("dd/M/yyyy"), "dd/M/yyyy", CultureInfo.InvariantCulture);
                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                    int selectedDoctor = 0;

                    if (listDoctors.Count > 0)
                    {
                        selectedDoctor = listDoctors[0].DoctorID;
                    }
                    try
                    {
                        selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                        if (!string.IsNullOrEmpty(Request.Form["DoctorList"]) && !string.IsNullOrEmpty(Request.Form["DoctorList"]))
                        {
                            DateTime selectedDate = Convert.ToDateTime(Request.Form["SelectedDate"]);
                            crrdate = selectedDate;
                            //crrdate = selectedDate = DateTime.ParseExact(Request.Form["SelectedDate"], "dd/M/yyyy", CultureInfo.InvariantCulture);//MMM
                            int.TryParse(Request.Form["DoctorList"], out doctorId);
                            selectedDoctor = doctorId;
                            selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                            ViewBag.DoctorID = selectlistDoctors;
                            ViewBag.SelectedDate = string.Format("{0:dd/M/yyyy}", Request.Form["SelectedDate"]);//MMM
                            //New Code
                            appointments = dbContext.DoctorAppointmentSchedules.Join
                                         (
                                         dbContext.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new CareDataModels.Appointments.Appointments
                                         {
                                             ScheduleId = das.ScheduleId,
                                             Timings_Slot = das.Timings_Slot,
                                             AppointmentSlotID = (int)das.AppointmentSlotID,
                                             DoctorsID = (int)das.DoctorID,
                                             AppointmentDate = (DateTime)da.AppointmentDate,
                                             IsBooked = (bool)da.IsSlotBooked,
                                             patientID = (int)da.PatientId,
                                             IsDeleted = (bool)das.isdeleted,
                                             AppointmentId = da.Id

                                         }).Where(x => x.DoctorsID == selectedDoctor && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate && x.IsDeleted == false).ToList();

                            listAppointments = dbContext.DoctorAppointmentSchedules.Select(x => new CareDataModels.Appointments.Appointments
                            {
                                AppointmentDate = crrdate,
                                AppointmentSlotID = (Int32)x.AppointmentSlotID,
                                ScheduleId = x.ScheduleId,
                                Timings_Slot = x.Timings_Slot,
                                IsBooked = false,
                                DoctorsID = (int)x.DoctorID,
                                IsDeleted = (bool)x.isdeleted

                            }).Where(x => x.DoctorsID == selectedDoctor && x.IsDeleted == false).ToList<CareDataModels.Appointments.Appointments>();

                            foreach (var items in listAppointments)
                            {
                                foreach (var aItem in appointments)
                                {
                                    if (aItem.ScheduleId == items.ScheduleId)
                                    {
                                        Patient obj = dbContext.Patients.Where(x => x.PatientID == aItem.patientID).FirstOrDefault();
                                        items.IsBooked = aItem.IsBooked;
                                        items.AppointmentDate = crrdate;
                                        items.patientName = obj.FirstName;
                                        items.AppointmentId = aItem.AppointmentId;
                                    }
                                }

                            }
                            
                            var AppSlots = dbContext.AppointmentSlots.Where(x => x.DoctorID == selectedDoctor && x.isdeleted == false).OrderBy(x => x.SlotFromDateTime).ToList();

                            foreach (var slots in AppSlots)
                            {
                                AvailableSlots.Add(new SelectListItem()
                                {
                                    Text = slots.SlotFrom + "-" + slots.SlotTo,
                                    Value = slots.AppointmentSlotsID.ToString()
                                });
                            }
                            ViewBag.AppointmentSlotsID = AvailableSlots;
                            //
                            return View("AppointmentsList", listAppointments);
                        }
                        else
                        {
                            ViewBag.AppointmentSlotsID = AvailableSlots;
                            ViewBag.DoctorID = selectlistDoctors;
                            ViewBag.SelectedDate = string.Format("{0:M/dd/yyyy}", DateTime.Now.AddDays(1));
                            return View("AppointmentsList", listAppointments);
                        }


                    }
                    catch (System.Data.Entity.Validation.DbEntityValidationException ex)
                    {
                        Exception ErrorRaise = ex;
                        foreach (var validationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in validationErrors.ValidationErrors)
                            {
                                string errorMessage = string.Format("{0}:{1}",
                                    validationErrors.Entry.Entity.ToString(),
                                    validationError.ErrorMessage);

                                ErrorRaise = new InvalidOperationException(errorMessage, ErrorRaise);
                            }
                        }
                    }
                    return View("AppointmentsList", listAppointments);
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ViewResult TodaysAppointments()
        {
            try
            {
                IEnumerable<Appointment> listAppointments = null;
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 

                using (CareEntities dbContext = new CareEntities())
                {
                    listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
                        .Where(x => x.Patient.Hospitals.Any(a => a.HospitalId == staff.HospitalID)
                        && x.AppointmentDate.Year == DateTime.Now.Year && x.AppointmentDate.Month == DateTime.Now.Month && x.AppointmentDate.Day == DateTime.Now.Day).ToList();
                }
                return View("TodaysAppointments", listAppointments);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpGet]
        [StaffAuthorize]
        public ViewResult EditAppointment(int id, int ScheduleId,int DoctorId)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                IEnumerable<SelectListItem> listDoctors = null;
                IEnumerable<SelectListItem> listPatients = null;
                DoctorAppointmentSchedule timeSlot = new DoctorAppointmentSchedule();
                Appointment app = new Appointment();
                DoctorAppointment DocApps = new DoctorAppointment();
                using (CareEntities dbContext = new CareEntities())
                {
                    listDoctors = new SelectList(dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID) && x.DoctorID == DoctorId).ToList(), "DoctorID", "FullName", 0);
                    listPatients = new SelectList(dbContext.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList(), "PatientID", "FullName", 0);
                    timeSlot = dbContext.DoctorAppointmentSchedules.Where(x => x.ScheduleId == ScheduleId).FirstOrDefault();
                    DocApps = dbContext.DoctorAppointments.Where(x => x.ScheduleId == ScheduleId && x.Id == id).FirstOrDefault();
                }
                app.AddedBy = timeSlot.Timings_Slot;
                app.AppointmentId = timeSlot.ScheduleId;
                app.UpdatedBy = id.ToString();//Used for DoctorAppointment ID
                ViewBag.DoctorID = listDoctors;
                ViewBag.PatientID = listPatients;
                app.AppointmentDate = (DateTime)DocApps.AppointmentDate;
                return View("EditAppointment", app);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Modified on: Jan 22 2015
        /// </summary>
        /// <param name="appointment"></param>
        /// <returns></returns>
        [HttpPost]
        [StaffAuthorize]
        public ActionResult EditAppointment(Appointment appointment)
        {
            DoctorAppointment docApp = new DoctorAppointment();
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        try
                        {
                            docApp = dbContext.DoctorAppointments.Where(x => x.ScheduleId == appointment.AppointmentId).FirstOrDefault();
                            docApp.PatientId = appointment.PatientId;
                            docApp.UpdatedOn = DateTime.UtcNow;
                            docApp.IsSlotBooked = true;
                            dbContext.Entry(docApp).State = EntityState.Modified;
                            dbContext.SaveChanges();
                            /***/
                            List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                            List<CareDataModels.Appointments.Appointments> appointments = new List<CareDataModels.Appointments.Appointments>();
                            List<CareDataModels.Appointments.Appointments> listAppointments = new List<CareDataModels.Appointments.Appointments>();
                            List<SelectListItem> AvailableSlots = new List<SelectListItem>();
                            DateTime selectedDate = Convert.ToDateTime(appointment.AppointmentDate);
                            DateTime crrdate = selectedDate;
                            int selectedDoctor = 0;
                            selectedDoctor = 75;
                            IEnumerable<SelectListItem> selectlistDoctors = null;
                            selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                            ViewBag.DoctorID = selectlistDoctors;
                            ViewBag.SelectedDate = appointment.AppointmentDate.ToShortDateString();
                            //New Code
                            appointments = dbContext.DoctorAppointmentSchedules.Join
                                         (
                                         dbContext.DoctorAppointments, das => das.ScheduleId, da => da.ScheduleId, (das, da) => new CareDataModels.Appointments.Appointments
                                         {
                                             ScheduleId = das.ScheduleId,
                                             Timings_Slot = das.Timings_Slot,
                                             AppointmentSlotID = (int)das.AppointmentSlotID,
                                             DoctorsID = (int)das.DoctorID,
                                             AppointmentDate = (DateTime)da.AppointmentDate,
                                             IsBooked = (bool)da.IsSlotBooked,
                                             patientID = (int)da.PatientId,
                                             IsDeleted = (bool)das.isdeleted,
                                             AppointmentId = da.Id

                                         }).Where(x => x.DoctorsID == selectedDoctor && EntityFunctions.TruncateTime(x.AppointmentDate) == crrdate && x.IsDeleted == false).ToList();

                            listAppointments = dbContext.DoctorAppointmentSchedules.Select(x => new CareDataModels.Appointments.Appointments
                            {
                                AppointmentDate = crrdate,
                                AppointmentSlotID = (Int32)x.AppointmentSlotID,
                                ScheduleId = x.ScheduleId,
                                Timings_Slot = x.Timings_Slot,
                                IsBooked = false,
                                DoctorsID = (int)x.DoctorID,
                                IsDeleted = (bool)x.isdeleted

                            }).Where(x => x.DoctorsID == selectedDoctor && x.IsDeleted == false).ToList<CareDataModels.Appointments.Appointments>();

                            foreach (var items in listAppointments)
                            {
                                foreach (var aItem in appointments)
                                {
                                    if (aItem.ScheduleId == items.ScheduleId)
                                    {
                                        Patient obj = dbContext.Patients.Where(x => x.PatientID == aItem.patientID).FirstOrDefault();
                                        items.IsBooked = aItem.IsBooked;
                                        items.AppointmentDate = crrdate;
                                        items.patientName = obj.FirstName;
                                        items.AppointmentId = aItem.AppointmentId;
                                    }
                                }

                            }

                            var AppSlots = dbContext.AppointmentSlots.Where(x => x.DoctorID == selectedDoctor && x.isdeleted == false).OrderBy(x => x.SlotFromDateTime).ToList();

                            foreach (var slots in AppSlots)
                            {
                                AvailableSlots.Add(new SelectListItem()
                                {
                                    Text = slots.SlotFrom + "-" + slots.SlotTo,
                                    Value = slots.AppointmentSlotsID.ToString()
                                });
                            }
                            ViewBag.AppointmentSlotsID = AvailableSlots;
                            //
                            return View("AppointmentsList", listAppointments);
                        }
                        /**/ 
                        catch (DbUpdateConcurrencyException ex)
                        {

                        }

                        //return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
                        return RedirectToAction("AppointmentsList");

                    }

                }

                return View(appointment);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        /// <summary>
        /// Added by: Harikrishna Bura,
        /// Added on: Jan 23 2015,
        /// Description: deleting the Appointment of single.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [StaffAuthorize]
        public ActionResult DeleteAppointment(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                DoctorAppointment appointment = null;
                using (CareEntities dbContext = new CareEntities())
                {
                    appointment = dbContext.DoctorAppointments.FirstOrDefault(x => x.Id == id);
                    if (appointment != null)
                    {
                        try
                        {
                            dbContext.Entry(appointment).State = EntityState.Deleted;
                            dbContext.SaveChanges();
                        }
                        catch (DbUpdateConcurrencyException ex)
                        {

                        }
                    }

                }
                return RedirectToAction("AppointmentsList");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult ApproveAppointment(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                Appointment appointment = null;
                using (CareEntities dbContext = new CareEntities())
                {
                    appointment = dbContext.Appointments.FirstOrDefault(x => x.AppointmentId == id);
                    if (appointment != null)
                    {
                        try
                        {
                            appointment.IsApproved = true;
                            dbContext.SaveChanges();
                        }
                        catch (DbUpdateConcurrencyException ex)
                        {

                        }
                    }

                }

                return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult CancelAppointment(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                Appointment appointment = null;
                using (CareEntities dbContext = new CareEntities())
                {
                    appointment = dbContext.Appointments.FirstOrDefault(x => x.AppointmentId == id);
                    if (appointment != null)
                    {
                        try
                        {
                            appointment.IsCancelled = true;
                            dbContext.SaveChanges();
                        }
                        catch (DbUpdateConcurrencyException ex)
                        {

                        }
                    }

                }

                return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        #endregion

        [HttpPost]
        [StaffAuthorize]
        public ActionResult AddVideo()
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                Video video = new Video();

                string url = Request.Form["VideoURL"].ToString();
                string[] urlParts;
                if (url != "")
                {
                    if (url.Contains("youtube"))
                    {
                        urlParts = url.Split(new[] { "v=" }, StringSplitOptions.RemoveEmptyEntries);
                        url = "http://www.youtube.com/v/" + urlParts[1];
                    }

                    video.VideoLink = url;
                    video.HospitalId = staff.HospitalID;
                    video.AddedBy = staff.UserName;

                    using (CareEntities db = new CareEntities())
                    {
                        db.Videos.Add(video);
                        db.SaveChanges();
                    }
                }
                return RedirectToAction("VideosList");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult VideosList()
        {
            try
            {
                //Staff staff = Session["Staff"] as Staff;
                //List<Video> listVideos = new List<Video>();

                //using(CareEntities db = new CareEntities())
                //{
                //    listVideos = db.Videos.Where(x => x.HospitalId == staff.HospitalID).ToList();
                //}

                //return View("VideosList", listVideos);
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                List<Video> listVideos = new List<Video>();
                List<Picture> listPictures = new List<Picture>();
                CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM picAndVideos = new CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM();
                using (CareEntities db = new CareEntities())
                {
                    listVideos = db.Videos.Where(x => x.HospitalId == staff.HospitalID).ToList();
                    listPictures = db.Pictures.Where(x => x.HospitalId == staff.HospitalID).ToList();
                    picAndVideos.listPictures = listPictures;
                    picAndVideos.listVideos = listVideos;

                }
                return View("VideosList", picAndVideos);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult CategoriesList()
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                List<Video> listVideos = new List<Video>();
                List<Picture> listPictures = new List<Picture>();
                CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM picAndVideos = new CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM();
                using (CareEntities db = new CareEntities())
                {
                    listVideos = db.Videos.Where(x => x.HospitalId == staff.HospitalID).ToList();
                    listPictures = db.Pictures.Where(x => x.HospitalId == staff.HospitalID).ToList();
                    picAndVideos.listPictures = listPictures;
                    picAndVideos.listVideos = listVideos;

                }
                return View("Categories", picAndVideos);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }




        [StaffAuthorize]
        public ActionResult AssignVideo(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                List<Video> listVideos = new List<Video>();
                CareEntities db = new CareEntities();
                string userParam = Request.QueryString["userId"];
                int userId = -1;

                if (!string.IsNullOrEmpty(userParam))
                {
                    userId = int.Parse(userParam);

                    Patient patient = db.Patients.FirstOrDefault(x => x.PatientID == userId);
                    Video video = db.Videos.FirstOrDefault(x => x.VideoId == id);

                    if (patient != null && video != null)
                    {
                        video.Patients.Add(patient);
                        db.SaveChanges();
                    }

                    id = userId;
                }

                listVideos = db.Videos.Include("Hospital").Where(x => x.HospitalId == staff.HospitalID && !x.Patients.Any(a => a.PatientID == id)).ToList();
                ViewBag.PatientId = id;

                return View("AssignVideo", listVideos);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public ActionResult AddPrescription(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                IEnumerable<SelectListItem> selectlistDoctors = null;

                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
                    int selectedDoctor = 0;
                    if (listDoctors != null)
                    {
                        selectedDoctor = listDoctors[0].DoctorID;
                    }

                    selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                }

                ViewBag.DoctorID = selectlistDoctors;
                return View("AddPrescription");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult AddPrescription(int id, Prescription pre, HttpPostedFileBase file)
        {
            try
            {
               
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                if (file.ContentLength > 0)
                {
                    Prescription prescription = new Prescription();
                    prescription.ImageExtension = file.ContentType;
                    prescription.PrescriptionName = "Prescription - " + DateTime.Now.ToShortDateString();
                    prescription.PrescriptionImage = ConvertToBytes(file);
                    prescription.PatientId = id;
                    prescription.DoctorId = pre.DoctorId;
                    prescription.HospitalId = staff.HospitalID;

                    using (CareEntities db = new CareEntities())
                    {
                        db.Prescriptions.Add(prescription);
                        db.SaveChanges();
                    }
                }

                return RedirectToAction("PatientInfo", new { id = id });
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public FileContentResult GetPrescription(int id)
        {

            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName;
                Prescription prescription = null;
                try
                {
                     using (CareEntities db = new CareEntities())
                     {
                         prescription = db.Prescriptions.FirstOrDefault(x => x.PrescriptionId == id && x.HospitalId == staff.HospitalID);
                     }
                }
                catch (Exception Ex)
                {

                }

                return new FileContentResult(prescription.PrescriptionImage, prescription.ImageExtension);
           
        }

        [StaffAuthorize]
        public ActionResult GetAllPrescriptions(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                IEnumerable<Prescription> listPrescriptions;

                using (CareEntities db = new CareEntities())
                {
                    listPrescriptions = db.Prescriptions.Where(x => x.PatientId == id && x.HospitalId == staff.HospitalID).ToList();
                }

                return View("GetAllPrescriptions", listPrescriptions);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// Description: Uploading Medical Records
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //[StaffAuthorize]
        //public ActionResult AddMedicalRecords(int id)
        //{
        //    ViewBag.PatientId = id;
        //    Staff staff = Session["Staff"] as Staff;
        //    UploadMedicalRecordsWithDoctorsVM resultData = new UploadMedicalRecordsWithDoctorsVM();
        //    //List<Doctor> listDoctors = null;
        //    IEnumerable<SelectListItem> DoctorsList = null;
        //    // 
        //    Patient patient = null;
        //    using (CareEntities dbContext = new CareEntities())
        //    {
        //        patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
        //        //listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
        //        DoctorsList = new SelectList(dbContext.Doctors.Where(x => x.HospitalId == staff.HospitalID).ToList(), "DoctorID", "FullName", 1);
        //    }
        //    //

        //    //
        //    //resultData.DoctorsList = DoctorsList;

        //    ViewBag.DoctorID = DoctorsList;
        //    resultData.patientInfo = patient;
        //    return View("AddMedicalRecords", resultData); 
        //}
        [StaffAuthorize]
        public ActionResult AddMedicalRecords(int id)
        {
            try
            {
                ViewBag.PatientId = id;
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                UploadMedicalRecordsWithDoctorsVM resultData = new UploadMedicalRecordsWithDoctorsVM();
                //List<Doctor> listDoctors = null;
                IEnumerable<SelectListItem> DoctorsList = null;
                // 
                Patient patient = null;
                using (CareEntities dbContext = new CareEntities())
                {
                    patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
                    //listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
                    DoctorsList = new SelectList(dbContext.Doctors.Where(x => x.HospitalId == staff.HospitalID).ToList(), "DoctorID", "FullName", 1);
                }
                //

                //
                //resultData.DoctorsList = DoctorsList;

                ViewBag.DoctorID = DoctorsList;
                resultData.patientInfo = patient;
                return View("AddMedicalRecords", resultData);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        [HttpPost]
        [StaffAuthorize]
        public ActionResult AddMedicalRecords(string DoctorID, int id, UploadMedicalRecordsWithDoctorsVM vm, IEnumerable<HttpPostedFileBase> files)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;

                using (CareEntities db = new CareEntities())
                {
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            if (file.ContentType == "image/jpeg")
                            {
                                MedicalRecord record = new MedicalRecord();
                                record.ImageExtension = vm.patientInfo.Gender;//file.ContentType;
                                record.MedicalRecordName = "MedicalRecord - " + DateTime.Now.ToShortDateString();
                                record.MedicalRecordImage = ConvertToBytes(file);
                                record.PatientId = id;
                                record.HospitalId = staff.HospitalID;
                                record.AddedBy = staff.UserName;
                                record.DoctorID = Convert.ToInt32(DoctorID);
                                db.MedicalRecords.Add(record);
                            }
                            else
                            {
                                return RedirectToAction("AddMedicalRecords", new { id = id });
                            }
                        }
                    }

                    db.SaveChanges();
                }


                return RedirectToAction("PatientInfo", new { id = id });
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [StaffAuthorize]
        public FileContentResult GetMedicalRecord(int id)
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName;
            MedicalRecord record = null;
            try
            {
                

                using (CareEntities db = new CareEntities())
                {
                    record = db.MedicalRecords.FirstOrDefault(x => x.MedicalRecordId == id && x.HospitalId == staff.HospitalID);
                }

               
            }
            catch (Exception Ex)
            {
                //return View("Error");
            }
            return new FileContentResult(record.MedicalRecordImage, record.ImageExtension);
        }

        [StaffAuthorize]
        public ActionResult GetAllMedicalRecords(int id)
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName;
                IEnumerable<MedicalRecord> listMedicalRecords;

                using (CareEntities db = new CareEntities())
                {
                    listMedicalRecords = db.MedicalRecords.Where(x => x.PatientId == id && x.HospitalId == staff.HospitalID).ToList();
                }

                return View("GetAllMedicalRecords", listMedicalRecords);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        private byte[] ConvertToBytes(HttpPostedFileBase image)
        {
            byte[] imageBytes = null;
            try
            {
              
                BinaryReader reader = new BinaryReader(image.InputStream);
                imageBytes = reader.ReadBytes((int)image.ContentLength);
               
            }
            catch (Exception Ex)
            {
               // return View("Error");
            }
            return imageBytes;
        }

        [StaffAuthorize]
        public ActionResult StaffChangePassword()
        {
            Staff currentStaff = Session["Staff"] as Staff;
            ViewData["FullName"] = currentStaff.FirstName;
            return View();
        }
        [HttpPost]
        [StaffAuthorize]
        public ActionResult StaffChangePassword(Staff staff, string ConfirmPassword, string NewPassword)
        {
            try
            {
                Staff currentStaff = Session["Staff"] as Staff;
                ViewData["FullName"] = currentStaff.FirstName;

                if (!string.IsNullOrEmpty(ConfirmPassword) && !string.IsNullOrEmpty(NewPassword))
                {
                    if (ConfirmPassword == NewPassword)
                    {
                        if (currentStaff.Password == staff.Password)
                        {
                            using (CareEntities dbContext = new CareEntities())
                            {
                                currentStaff.Password = NewPassword;
                                dbContext.Entry(currentStaff).State = EntityState.Modified;
                                dbContext.SaveChanges();
                                ModelState.Clear();
                                ModelState.AddModelError("", "Password Changed Successfully");
                                return View();
                            }
                        }
                        else
                        {
                            ModelState.Clear();
                            ModelState.AddModelError("", "Please enter valid Current Password");
                        }
                    }
                    else
                    {
                        ModelState.Clear();
                        ModelState.AddModelError("", "New and confirm password mismatch");
                    }
                }  
                else 
                {
                    ModelState.Clear();
                   // ModelState.AddModelError("", "New and confirm password should not be blank ");
                }
                
                if (string.IsNullOrEmpty(NewPassword))
                {
                   // ModelState.Clear();
                    ModelState.AddModelError("", "New password should not be blank ");
                }
                
                if (string.IsNullOrEmpty(ConfirmPassword))
                {
                   // ModelState.Clear();
                    ModelState.AddModelError("", "Confirm password should not be blank ");
                }
                
                
                return View();
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        /// <summary>
        /// Created By: Harirkishna Bura,
        /// Description: for Videos and Pictures partialview(modeldialog).
        /// </summary>
        /// <returns></returns>
        public ActionResult UploadVideosAndPictures()
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName;
            return View();

        }
        //public static bool HasFile(this HttpPostedFileBase file)
        //{
        //    return (file != null && file.ContentLength > 0) ? true : false;
        //}
        //[HttpPost]
        [StaffAuthorize]
        public ActionResult UploadPictures()
        {
            try
            {
                Staff staff = Session["Staff"] as Staff;
                ViewData["FullName"] = staff.FirstName; 
                if (Request.Form["VideoURL"] != null)
                {
                    Video video = new Video();

                    string url = Request.Form["VideoURL"].ToString();
                    string[] urlParts;
                    if (url != "")
                    {
                        //Creating the HttpWebRequest
                        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
                        //Setting the Request method HEAD, you can also use GET too.
                        request.Method = "HEAD";
                        //Getting the Web Response.
                        HttpWebResponse response = request.GetResponse() as HttpWebResponse;
                        //Returns TRUE if the Status code == 200
                        if (response.StatusCode == HttpStatusCode.OK)
                        {

                            if (url.Contains("youtube"))
                            {
                                urlParts = url.Split(new[] { "v=" }, StringSplitOptions.RemoveEmptyEntries);
                                url = "http://www.youtube.com/v/" + urlParts[1];
                            }

                            video.VideoLink = url;
                            video.HospitalId = staff.HospitalID;
                            video.AddedBy = staff.UserName;

                            using (CareEntities db = new CareEntities())
                            {
                                db.Videos.Add(video);
                                db.SaveChanges();
                            }
                        }
                    }
                }

                Picture picObj = new Picture();
                foreach (string upload in Request.Files)
                {
                    //if (!Request.Files[upload].HasFile()) continue;                                
                    string mimeType = Request.Files[upload].ContentType;
                    Stream fileStream = Request.Files[upload].InputStream;
                    string fileName = Path.GetFileName(Request.Files[upload].FileName);
                    int fileLength = Request.Files[upload].ContentLength;
                    if (fileLength != 0)
                    {
                        byte[] fileData = new byte[fileLength];
                        fileStream.Read(fileData, 0, fileLength);

                        picObj.PictureContent = fileData;
                        picObj.HospitalId = staff.HospitalID;
                        picObj.AddedBy = staff.UserName;

                        using (CareEntities db = new CareEntities())
                        {
                            db.Pictures.Add(picObj);
                            db.SaveChanges();
                        }
                    }
                    else
                    {

                    }
                }
                return RedirectToAction("VideosList");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }


        }
        /// <summary>
        /// Added By:Harikrishna Bura,
        /// Description: Populating the Model Popup for Assifn to the Patient.
        /// </summary>
        /// <returns></returns>
        public ActionResult AssignPicturesAndVideos()
        {
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            List<Patient> patients = new List<Patient>();

            return View(patients);

        }

        [HttpGet]
        [StaffAuthorize]
        public ViewResult AssignPicturesAndVideos(string id)
        {
            string searchString = Request.Form["Patienttxt"];
            Staff staff = Session["Staff"] as Staff;
            ViewData["FullName"] = staff.FirstName; 
            List<Patient> listPatients = new List<Patient>();
            try
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        listPatients = dbContext.Patients.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString)) &&
                             x.Hospitals.Any(a => a.Staffs.Any(s => s.StaffID == staff.StaffID))).ToList();
                    }
                }
                return View(listPatients);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View();
        }

    }
}
