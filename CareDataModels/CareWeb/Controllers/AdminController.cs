using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CareDataModels.Models;
using CareWeb.Utility;
using System.Data.Entity.Infrastructure;
using System.Globalization;
using System.IO;
using System.Data.Objects;
using CareDataModels.Appointments;
using CareWeb.Models;
using System.Net;

namespace CareWeb.Controllers
{
    public class AdminController : Controller
    {
        #region Commented
        //private CareEntities db = new CareEntities();

        ////
        //// GET: /Admin/

        //public ActionResult Index()
        //{
        //    var admins = db.Admins.Include(a => a.Hospital);
        //    return View(admins.ToList());
        //}

        ////
        //// GET: /Admin/Details/5

        //public ActionResult Details(int id = 0)
        //{
        //    Admin admin = db.Admins.Find(id);
        //    if (admin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(admin);
        //}

        ////
        //// GET: /Admin/Create

        //public ActionResult Create()
        //{
        //    ViewBag.HospitalID = new SelectList(db.Hospitals, "HospitalId", "HospitalDisplayId");
        //    return View();
        //}

        ////
        //// POST: /Admin/Create

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create(Admin admin)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Admins.Add(admin);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.HospitalID = new SelectList(db.Hospitals, "HospitalId", "HospitalDisplayId", admin.HospitalID);
        //    return View(admin);
        //}

        ////
        //// GET: /Admin/Edit/5

        //public ActionResult Edit(int id = 0)
        //{
        //    Admin admin = db.Admins.Find(id);
        //    if (admin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.HospitalID = new SelectList(db.Hospitals, "HospitalId", "HospitalDisplayId", admin.HospitalID);
        //    return View(admin);
        //}

        ////
        //// POST: /Admin/Edit/5

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit(Admin admin)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(admin).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.HospitalID = new SelectList(db.Hospitals, "HospitalId", "HospitalDisplayId", admin.HospitalID);
        //    return View(admin);
        //}

        ////
        //// GET: /Admin/Delete/5

        //public ActionResult Delete(int id = 0)
        //{
        //    Admin admin = db.Admins.Find(id);
        //    if (admin == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(admin);
        //}

        ////
        //// POST: /Admin/Delete/5

        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Admin admin = db.Admins.Find(id);
        //    db.Admins.Remove(admin);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //} 
        #endregion

        static List<Admin> Users = null;

        public AdminController()
        {
            using (CareEntities dbContext = new CareEntities())
            {
                Users = dbContext.Admins.ToList();
            }
        }

        [SuperAdminAuthorize]
        public ViewResult SuperAdminHome()
        {
            IEnumerable<Admin> listAdmins = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listAdmins = dbContext.Admins.ToList();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("SuperAdminHome", listAdmins);
        }
        [AdminAuthorize]
        public ViewResult CreateDoctor()
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
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
        [AdminAuthorize]
        [HttpPost]
        public ActionResult CreateDoctor(Doctor user)
        {
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
                Hospital hospital = null;

                string fromTime = Request.Form["txtFrom"].Replace(" ", String.Empty);
                string toTime = Request.Form["txtto"].Replace(" ", String.Empty);
                using (CareEntities dbContext = new CareEntities())
                {

                    List<Doctor> existDoctor = dbContext.Doctors.Where(x => x.Phone == user.Phone).ToList();
                    if (existDoctor.Count == 0)
                    {
                        ViewBag.Country = dbContext.Countries.ToList();
                        hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == currentUser.HospitalID);
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
        [SuperAdminAuthorize]
        [HttpGet]
        public ViewResult Edit(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Admin adminToEdit = new Admin();
            try
            {
                 adminToEdit = Users.FirstOrDefault(x => x.AdminID == id);
                IEnumerable<SelectListItem> listHospitals = null;
                List<SelectListItem> AvailableCountries = new List<SelectListItem>();
                List<SelectListItem> AvailableStates = new List<SelectListItem>();
                List<SelectListItem> Availablecities = new List<SelectListItem>();


                using (CareEntities dbContext = new CareEntities())
                {
                    listHospitals = new SelectList(dbContext.Hospitals.ToList(), "HospitalID", "Name", adminToEdit.HospitalID);
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
                            Selected = (State.StateId.ToString() == adminToEdit.State)
                        });
                    }

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(adminToEdit.State)).ToList();

                    foreach (var City in Cities)
                    {
                        Availablecities.Add(new SelectListItem()
                        {
                            Text = City.SubRegionName,
                            Value = City.SubRegionId.ToString(),
                            Selected = (City.SubRegionId.ToString() == adminToEdit.City)

                        });
                    }



                    ViewBag.Country = AvailableCountries;
                    ViewBag.States = AvailableStates;
                    ViewBag.Cities = Availablecities;
                }

                ViewBag.HospitalID = listHospitals;
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("Edit", adminToEdit);
        }

        [SuperAdminAuthorize]
        [HttpPost]
        public ActionResult Edit(Admin user)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            using (CareEntities dbContext = new CareEntities())
            {
                try
                {                    
                    CareDataModels.Utility.UpdateAdmin(dbContext, user);
                }
                catch (Exception Ex)
                {
                    return View("Error");
                }
                //return View("SuperAdminHome", dbContext.Admins.ToList());
                return RedirectToAction("Info", new { id = user.AdminID });
            }
        }

        /// <summary>
        /// Created By: Harirkishna Bura,
        /// Description: for Videos and Pictures partialview(modeldialog).
        /// </summary>
        /// <returns></returns>
        public ActionResult UploadVideosAndPictures()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;
            return View();

        }
        /// <summary>
        /// Added By:Harikrishna Bura,
        /// Description: Populating the Model Popup for Assifn to the Patient.
        /// </summary>
        /// <returns></returns>
        public ActionResult AssignPicturesAndVideos()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;
            List<Patient> patients = new List<Patient>();

            return View(patients);

        }

        [AdminAuthorize]
        public ActionResult UploadPictures()
        {
            try
            {
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
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
                            video.HospitalId = currentUser.HospitalID;
                            video.AddedBy = currentUser.UserName;

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
                        picObj.HospitalId = currentUser.HospitalID;
                        picObj.AddedBy = currentUser.UserName;

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
        [AdminAuthorize]
        public ActionResult VideosList()
        {
            try
            {
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
                List<Video> listVideos = new List<Video>();
                List<Picture> listPictures = new List<Picture>();
                CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM picAndVideos = new CareDataModels.PicturesAndVideosVM.PicturesAndVideosVM();
                using (CareEntities db = new CareEntities())
                {
                    listVideos = db.Videos.Where(x => x.HospitalId == currentUser.HospitalID).ToList();
                    listPictures = db.Pictures.Where(x => x.HospitalId == currentUser.HospitalID).ToList();
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
        [SuperAdminAuthorize]
        public ViewResult Create()
        {
            IEnumerable<SelectListItem> listHospitals = null;
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
             List<SelectListItem> AvailableCountries = new List<SelectListItem>();
             List<SelectListItem> AvailableStates = new List<SelectListItem>();
             List<SelectListItem> Availablecities = new List<SelectListItem>();

             try
             {
                 using (CareEntities dbContext = new CareEntities())
                 {
                     listHospitals = new SelectList(dbContext.Hospitals.Where(x => x.HospitalId > 0).ToList(), "HospitalID", "Name", 1);


                     foreach (var country in dbContext.Countries)
                     {
                         AvailableCountries.Add(new SelectListItem()
                         {
                             Text = country.CountryName,
                             Value = country.CountryId.ToString()
                         });
                     }
                 }

                 ViewBag.HospitalID = listHospitals;
                 ViewBag.Country = AvailableCountries;
                 ViewBag.State = AvailableStates;
                 ViewBag.City = Availablecities;


             }
             catch (Exception Ex)
             {
                 return View("Error");
             }
            return View();
        }

    

        [SuperAdminAuthorize]
        public ViewResult CreateHospital()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;


            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();          
            
            try
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
                }
               
                ViewBag.State = AvailableStates;
                ViewBag.Country = AvailableCountries;
                ViewBag.City = Availablecities;


            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("CreateHospital");
        }

        [SuperAdminAuthorize]
        [HttpPost]
        public ViewResult CreateHospital(Hospital hospital)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            if (ModelState.IsValid)
            {
                try
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        //
                        foreach (string upload in Request.Files)
                        {
                            string mimeType = Request.Files[upload].ContentType;
                            Stream fileStream = Request.Files[upload].InputStream;
                            string fileName = Path.GetFileName(Request.Files[upload].FileName);
                            int fileLength = Request.Files[upload].ContentLength;
                            byte[] fileData = new byte[fileLength];
                            fileStream.Read(fileData, 0, fileLength);
                            hospital.ImageContent = fileData;
                        }
                        //

                        if (hospital.HospitalId == -1 )
                        {
                          
                            dbContext.Hospitals.Attach(hospital);
                            dbContext.Entry(hospital).State = EntityState.Modified;
                            dbContext.SaveChanges();
                        }
                        else
                        {
                            dbContext.Hospitals.Add(hospital);
                            dbContext.SaveChanges();
                        }
                        List<Admin> listAdmins = new List<Admin>();
                        ViewBag.Admins = listAdmins;
                    }
                }
                catch (Exception Ex)
                {
                    return View("Error");
                }
                return View("HospitalInfo", hospital);
            }
            return View(hospital);
        }

        [SuperAdminAuthorize]
        public ViewResult HospitalsList()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            List<Hospital> listHospitals = null;

            try
            {

                using (CareEntities dbContext = new CareEntities())
                {
                    listHospitals = dbContext.Hospitals.ToList();

                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View("HospitalsList", listHospitals);
        }

        [SuperAdminAuthorize]
        public ViewResult AdminsList()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            List<Admin> listAdmins= null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listAdmins = dbContext.Admins.Include("Hospital").Where(x => x.RoleId != 1).ToList();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View("AdminsList", listAdmins);
        }
        /// <summary>
        /// Modified By: Harikrishna Bura,
        /// DEscription: added Role Id.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [SuperAdminAuthorize]
        [HttpPost]
        public ActionResult Create(Admin user)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        user.RoleId = 2;//for Admin
                        user.UserName = user.Phone;//Need to Removed
                        dbContext.Admins.Add(user);
                        dbContext.SaveChanges();
                        return RedirectToAction("Info", new { id = user.AdminID });
                    }
                }
                else
                {
                    IEnumerable<SelectListItem> listHospitals = null; 

                    using (CareEntities dbContext = new CareEntities())
                    {
                        listHospitals = new SelectList(dbContext.Hospitals.Where(x => x.HospitalId > 0).ToList(), "HospitalID", "Name", 1);
                    }

                    ViewBag.HospitalID = listHospitals;

                    return View();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [SuperAdminAuthorize]
        public ActionResult Info(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Admin admin = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    admin = dbContext.Admins.Include(x => x.Hospital).FirstOrDefault(x => x.AdminID == id);

                    int Sid = Convert.ToInt32(admin.State);
                    var state = dbContext.States.Where(x => x.StateId == Sid).FirstOrDefault();
                    admin.State = state.StateName;
                    int cid = Convert.ToInt32(admin.City);
                    var City = dbContext.SubRegions.Where(x => x.SubRegionId == cid).FirstOrDefault();
                    admin.City = City.SubRegionName;

                    ViewBag.HospitalName = admin.Hospital.Name;
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
                        
            return View("Info", admin);
        }
        
        [AdminAuthorize]
        public ViewResult AdminHome()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            IEnumerable<Staff> lstStaff = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    lstStaff = dbContext.Staffs.Include(x => x.Hospital).ToList();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("AdminHome", lstStaff);
        }

        [AdminAuthorize]
        public ViewResult CreateStaff()
        {
           // IEnumerable<SelectListItem> listHospitals = null;
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 

            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                   // listHospitals = new SelectList(dbContext.Hospitals.ToList(), "HospitalID", "Name", 0);

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

                    ViewBag.Country = AvailableCountries;
                    ViewBag.State = AvailableStates;
                    ViewBag.City = Availablecities;
                }

               // ViewBag.HospitalID = listHospitals;
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View();
        }


        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetStates(Int32 id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            dynamic AvailableStates = "";
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    var States = dbContext.States.Where(x => x.CountryId == id).ToList();

                    AvailableStates = (from s in States
                                       select new
                                       {
                                           id = s.StateId,
                                           name = s.StateName

                                       }).ToList();



                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return Json(AvailableStates, JsonRequestBehavior.AllowGet);

        }



        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult GetCities(Int32 id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            dynamic Availablecities = "";
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == id).ToList();

                    Availablecities = (from s in Cities
                                       select new
                                       {
                                           id = s.SubRegionId,
                                           name = s.SubRegionName

                                       }).ToList();



                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return Json(Availablecities, JsonRequestBehavior.AllowGet);

        }

        
        [HttpPost]
        [AdminAuthorize]
        public ActionResult CreateStaff(Staff staff)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
            try
            {
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        try
                        {
                            List<Staff> existStaff = dbContext.Staffs.Where(x => x.Phone == staff.Phone).ToList();
                           
                            if (existStaff.Count==0)
                            {
                                staff.HospitalID = currentUser.HospitalID;//staff.HospitalID;
                                staff.UserName = staff.Phone;
                                dbContext.Staffs.Add(staff);
                                dbContext.SaveChanges();
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
                                if (staff.State != "")
                                {
                                    var States = dbContext.States.Where(x => x.CountryId == 1).ToList();

                                    foreach (var State in States)
                                    {
                                        AvailableStates.Add(new SelectListItem()
                                        {
                                            Text = State.StateName,
                                            Value = State.StateId.ToString(),
                                            Selected = (State.StateId.ToString() == staff.State)
                                        });
                                    }
                                    ViewBag.State = AvailableStates;
                                }
                                if (staff.City != "")
                                {
                                    var Cities = dbContext.Districts.
                                                    Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                                        (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(staff.State)).ToList();

                                    foreach (var City in Cities)
                                    {
                                        Availablecities.Add(new SelectListItem()
                                        {
                                            Text = City.SubRegionName,
                                            Value = City.SubRegionId.ToString(),
                                            Selected = (City.SubRegionId.ToString() == staff.City)

                                        });
                                    }
                                    ViewBag.City = Availablecities;
                                }
                                ModelState.AddModelError("", "Mobile number already exist");
                                return View();
                            }
                            return RedirectToAction("StaffInfo", new { id = staff.StaffID });
                        }
                        catch (Exception ex)
                        {
                            return View("Error");
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
           // return View(staff);
            return RedirectToAction("CreateStaff", "Admin");
        }

        //[AdminAuthorize]
        public ActionResult StaffInfo(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Staff staff = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    staff = dbContext.Staffs.Include(x => x.Hospital).FirstOrDefault(x => x.StaffID == id);

                    int Sid = Convert.ToInt32(staff.State);
                    var state = dbContext.States.Where(x => x.StateId == Sid).FirstOrDefault();
                    staff.State = state.StateName;
                    int cid = Convert.ToInt32(staff.City);
                    var City = dbContext.SubRegions.Where(x => x.SubRegionId == cid).FirstOrDefault();
                    staff.City = City.SubRegionName;

                    ViewBag.HospitalName = staff.Hospital.Name;
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("StaffInfo", staff);
        }

        [AdminAuthorize]
        public ViewResult EditStaff(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Staff staffToEdit = null;
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();

            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    staffToEdit = dbContext.Staffs.FirstOrDefault(x => x.StaffID == id);

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
                            Selected = (State.StateId.ToString() == staffToEdit.State)
                        });
                    }

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(staffToEdit.State)).ToList();

                    foreach (var City in Cities)
                    {
                        Availablecities.Add(new SelectListItem()
                        {
                            Text = City.SubRegionName,
                            Value = City.SubRegionId.ToString(),
                            Selected = (City.SubRegionId.ToString() == staffToEdit.City)

                        });
                    }



                    ViewBag.Country = AvailableCountries;
                    ViewBag.States = AvailableStates;
                    ViewBag.Cities = Availablecities;
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("EditStaff", staffToEdit);
        }
        /// <summary>
        /// Added by: Harikrishna Bura
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [AdminAuthorize]
        [HttpPost]
        public ActionResult EditStaff(Staff user)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    try
                    {
                        CareDataModels.Utility.UpdateStaff(dbContext, user);
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {

                    }
                    //return View("AdminHome", dbContext.Staffs.ToList());
                    return RedirectToAction("StaffInfo", new { id = user.StaffID });
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [SuperAdminAuthorize]
        public ActionResult HospitalInfo(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Hospital hospital = null;
            List<Admin> listAdmins = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == id);

                    int Sid = Convert.ToInt32(hospital.State);
                    var state = dbContext.States.Where(x => x.StateId == Sid).FirstOrDefault();
                    hospital.State = state.StateName;
                    int cid = Convert.ToInt32(hospital.City);
                    var City = dbContext.SubRegions.Where(x => x.SubRegionId == cid).FirstOrDefault();
                    hospital.City = City.SubRegionName;
                    var Address = hospital.AddressLine1;

                    listAdmins = dbContext.Admins.Include("Hospital").Where(x => x.RoleId != 1).ToList();
                    ViewBag.Admins = listAdmins;
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("HospitalInfo", hospital);
        }

        [HttpGet]
        [SuperAdminAuthorize]
        public ViewResult EditHospital(int id)
        {
            Hospital HospitalToEdit = null;
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();

            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    HospitalToEdit = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == id);
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
                            Selected = (State.StateId.ToString() == HospitalToEdit.State)
                        });
                    }

                    var Cities = dbContext.Districts.
                                     Join(dbContext.SubRegions, c => c.DistrictId, o => o.DistrictId,
                                         (c, o) => new { o.SubRegionId, o.SubRegionName, c.StateId }).ToList();

                    Cities = Cities.Where(x => x.StateId == Convert.ToInt32(HospitalToEdit.State)).ToList();

                    foreach (var City in Cities)
                    {
                        Availablecities.Add(new SelectListItem()
                        {
                            Text = City.SubRegionName,
                            Value = City.SubRegionId.ToString(),
                            Selected = (City.SubRegionId.ToString() == HospitalToEdit.City)

                        });
                    }
                    ViewBag.Country = AvailableCountries;
                    ViewBag.States = AvailableStates;
                    ViewBag.Cities = Availablecities;
                }

            }
            catch (Exception Ex)
            {
                return View("Error");
            }
           

            return View("EditHospital", HospitalToEdit);
        }

        [HttpPost]
        [SuperAdminAuthorize]
        public ActionResult EditHospital(Hospital hospital)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            using (CareEntities dbContext = new CareEntities())
            {
                try
                {
                    //
                    foreach (string upload in Request.Files)
                    {
                        string mimeType = Request.Files[upload].ContentType;
                        Stream fileStream = Request.Files[upload].InputStream;
                        string fileName = Path.GetFileName(Request.Files[upload].FileName);
                        int fileLength = Request.Files[upload].ContentLength;
                        byte[] fileData = new byte[fileLength];
                        fileStream.Read(fileData, 0, fileLength);
                        if (fileData.Length > 0)
                        hospital.ImageContent = fileData;
                    }
                    //
                    CareDataModels.Utility.UpdateHospital(dbContext, hospital);
                }
                catch (Exception Ex)
                {
                    return View("Error");
                }
                //return View("HospitalInfo", hospital);
                return RedirectToAction("HospitalInfo", new { id = hospital.HospitalId });
            }
        }
        /// <summary>
        /// Added by: Harikrishna Bura
        /// </summary>
        /// <returns></returns>
        [AdminAuthorize]
        public ViewResult StaffList()
        {
            List<Staff> listStaff = null;
            Admin admin = Session["Admin"] as Admin; 
            ViewData["FullName"] = admin.FullName;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listStaff = dbContext.Staffs.ToList();
                    //listStaff = dbContext.Staffs.Where(x => x.HospitalID == admin.HospitalID).ToList();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            if (listStaff.Count > 0)
                ViewBag.Norecords = "";
            else
                ViewBag.Norecords = "No records found";
               
            return View("StaffList", listStaff);
        }
        /// <summary>
        /// Created By: Harikrishna Bura,
        /// creatdd on: Feb 09 2015,
        /// Decription: search Implementaion in Staff.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [AdminAuthorize]
        public ActionResult StaffList(string id)
        {
            Admin admin = Session["Admin"] as Admin;
            ViewData["FullName"] = admin.FullName;

            List<Staff> ListStaff = new List<Staff>();
            string searchString = Request.Form["SearchBox"];
            try
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        ListStaff = dbContext.Staffs.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString))
                            && x.HospitalID == admin.HospitalID).ToList();
                    }

                    if (ListStaff.Count > 0)
                        ViewBag.Norecords = "";
                    else
                        ViewBag.Norecords = "No records found";
                    return View(ListStaff);
                }
                else
                {
                    return RedirectToAction("StaffList");

                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        #region Patient

        [AdminAuthorize]
        public ViewResult PatientsList()
        { 
            Admin admin = Session["Admin"] as Admin;
            ViewData["FullName"] = admin.FullName;

            IEnumerable<Patient> listPatients = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listPatients = dbContext.Patients.Where(a => a.Hospitals.Any(x => x.HospitalId == admin.HospitalID)).ToList();
                }

                ViewData["FullName"] = admin.FullName;
                return View(listPatients);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            //
        }
        /// <summary>
        /// Created by: Harikrishna Bura,
        /// Created on Feb 03 2015
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [AdminAuthorize]
        public ViewResult PatientsList(string id)
        {
            string searchString = Request.Form["SearchBox"];
            Admin admin = Session["Admin"] as Admin;
            ViewData["FullName"] = admin.FullName;
            List<Patient> listPatients = new List<Patient>();
            try
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        listPatients = dbContext.Patients.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString)) &&
                             x.Hospitals.Any(a => a.Admins.Any(s => s.AdminID == admin.AdminID))).ToList();
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
        /// <summary>
        /// Created By: Harikrishna Bura,
        /// Created On: Oct 15 2014,
        /// Description: Create Mode of patient.
         /// </summary>
         /// <returns></returns>
        public ActionResult addPatient()
        { 
            return View();
        }
        /// <summary>
        /// Created By: Harikrishna Bura,
        /// Created On: Oct 15 2014,
        /// Description: Saving New Patient.
        /// </summary>
        /// <param name="patientObj"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult addPatient(Patient patientObj)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {
                ModelState.Remove("FullName");
                ModelState.Remove("UserName");
                ModelState.Remove("Password");
                ModelState.Remove("RoleId");
                ModelState.Remove("Profession");
                ModelState.Remove("DOB");
                ModelState.Remove("Age");
                ModelState.Remove("Gender");
                ModelState.Remove("FaildLoginAttempts");
                ModelState.Remove("IsActive");
                ModelState.Remove("IsLocked");
                ModelState.Remove("AddedOn");
                ModelState.Remove("UpdatedOn");
                patientObj.Password = patientObj.FirstName;
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        dbContext.Patients.Add(patientObj);
                        dbContext.SaveChanges();
                        //return RedirectToAction("PatientInfo", new { id = patientObj.PatientID });
                    }
                }
                return View(patientObj);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            
        }
        [AdminAuthorize]
        public ActionResult PatientInfo(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;
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
                        if (State.StateId.ToString() == patient.State)
                        {
                            patient.State = State.StateName;
                        }
                    }
                    foreach (var City in Cities)
                    {
                        if (City.SubRegionId.ToString() == patient.City)
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
        [HttpPost]
        [AdminAuthorize]
        public ActionResult CreatePatient(Patient user, string Country, string State, string City)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;
            Hospital hospital = null;
            List<SelectListItem> AvailableCountries = new List<SelectListItem>();
            List<SelectListItem> AvailableStates = new List<SelectListItem>();
            List<SelectListItem> Availablecities = new List<SelectListItem>();
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

                             hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == currentUser.HospitalID);
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

                             foreach (var country in dbContext.Countries)
                             {
                                 AvailableCountries.Add(new SelectListItem()
                                 {
                                     Text = country.CountryName,
                                     Value = country.CountryId.ToString()
                                 });
                             }

                             //ViewBag.Country = AvailableCountries;
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

                                 Cities = Cities.Where(x => x.StateId == Convert.ToInt32(currentUser.State)).ToList();

                                 foreach (var City1 in Cities)
                                 {
                                     Availablecities.Add(new SelectListItem()
                                     {
                                         Text = City1.SubRegionName,
                                         Value = City1.SubRegionId.ToString(),
                                         Selected = (City1.SubRegionId.ToString() == currentUser.City)

                                     });
                                 }
                                 ViewBag.City = Availablecities;
                             }

                             ViewBag.Country = AvailableCountries;
                             ModelState.AddModelError("", "Mobile number already exist");
                             return View();

                         }
                    }
                }
                else
                {

                    using (CareEntities dbContext = new CareEntities())
                    {

                       // List<SelectListItem> AvailableCountries = new List<SelectListItem>();

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
        /// <summary>
        /// Added by: Hari
        /// </summary>
        /// <returns></returns>
        [AdminAuthorize]
        public ViewResult CreatePatient()
        {
            try
            {
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
                List<SelectListItem> AvailableStates = new List<SelectListItem>();
                List<SelectListItem> Availablecities = new List<SelectListItem>();
                using (CareEntities dbContext = new CareEntities())
                {
                    List<SelectListItem> AvailableCountries = new List<SelectListItem>();

                    foreach (var country in dbContext.Countries)
                    {
                        AvailableCountries.Add(new SelectListItem()
                        {
                            Text = country.CountryName,
                            Value = country.CountryId.ToString()
                        });
                    }

                    ViewBag.State = AvailableStates;
                    ViewBag.Country = AvailableCountries;
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
        /// Created By: Harikrishna Bura,
        /// Created On: Oct 15 2014,
        /// Description: View Mode of Patient.
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
      /*  public ActionResult PatientInfo(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Patient patient = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View("PatientInfo", patient);
        }*/
        #endregion
        #region Appointments

        [StaffAuthorize]
        public ActionResult AppointmentInfo(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Staff staff = Session["Staff"] as Staff;
            Appointment appointment = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    appointment = dbContext.Appointments.Include("Patient").Include("Doctor").FirstOrDefault(x => x.AppointmentId == id && x.HospitalId == staff.HospitalID);
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View("AppointmentInfo", appointment);
        }

        /* [StaffAuthorize]
        public ViewResult RegisterAppointment()
        {
            Staff staff = Session["Staff"] as Staff;
            IEnumerable<SelectListItem> listDoctors = null;
            IEnumerable<SelectListItem> listPatients = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listDoctors = new SelectList(dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList(), "DoctorID", "FullName", 0);
                    listPatients = new SelectList(dbContext.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList(), "PatientID", "FullName", 0);
                }

                ViewBag.DoctorID = listDoctors;
                ViewBag.PatientID = listPatients;
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("RegisterAppointment");
        }

       [HttpPost]
        [StaffAuthorize]
        public ActionResult RegisterAppointment(Appointment appointment)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    Staff staff = Session["Staff"] as Staff;
                    using (CareEntities dbContext = new CareEntities())
                    {
                        appointment.AppointmentDate = DateTime.ParseExact(Request.Form["AppointmentDate"], "dd/MMM/yyyy hh:mm tt", CultureInfo.InvariantCulture);
                        appointment.HospitalId = staff.HospitalID;
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
        }*/

        [StaffAuthorize]
        public ViewResult CreateAppointmentForPatient(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Staff staff = Session["Staff"] as Staff;
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
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("CreateAppointmentForPatient");
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult CreateAppointmentForPatient(int id, Appointment appointment)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {
                if (ModelState.IsValid)
                {
                    Staff staff = Session["Staff"] as Staff;
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
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View(appointment);
        }
        //Commented By: Harikrishna Bura
        //[StaffAuthorize]
        /*public ViewResult AppointmentsList()
        {
            Staff staff = Session["Staff"] as Staff;
            IEnumerable<SelectListItem> selectlistDoctors = null;
            List<Appointment> listAppointments = new List<Appointment>();
            int doctorId = -1;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == 2)).OrderBy(a => a.FullName).ToList();
                    int selectedDoctor = 0;

                    if (listDoctors != null)
                    {
                        selectedDoctor = listDoctors[0].DoctorID;
                    }

                    if (!string.IsNullOrEmpty(Request.Form["DoctorList"]) && !string.IsNullOrEmpty(Request.Form["DoctorList"]))
                    {
                        DateTime selectedDate;
                        int.TryParse(Request.Form["DoctorList"], out doctorId);

                        try
                        {
                            selectedDate = DateTime.ParseExact(Request.Form["SelectedDate"], "dd/MMM/yyyy", CultureInfo.InvariantCulture);
                            listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
                                .Where(x => x.DoctorId == doctorId && x.Patient.Hospitals.Any(a => a.HospitalId == 2)
                                && x.AppointmentDate.Year == selectedDate.Year && x.AppointmentDate.Month == selectedDate.Month && x.AppointmentDate.Day == selectedDate.Day
                                ).ToList();
                            selectedDoctor = doctorId;
                            ViewBag.SelectedDate = string.Format("{0:dd/MMM/yyyy}", Request.Form["SelectedDate"]);
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                    else
                    {
                        listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
                               .Where(x => x.DoctorId == selectedDoctor && x.Patient.Hospitals.Any(a => a.HospitalId == 2)
                               && x.AppointmentDate.Year == DateTime.Now.Year && x.AppointmentDate.Month == DateTime.Now.Month && x.AppointmentDate.Day == DateTime.Now.Day
                               ).ToList();
                        ViewBag.SelectedDate = string.Format("{0:dd/MMM/yyyy}", DateTime.Now);
                    }

                    selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", selectedDoctor);
                    ViewBag.DoctorID = selectlistDoctors;
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
                return View("AppointmentsList", listAppointments);
        }*/
        [HttpGet]
        public JsonResult AppointmentsValidation(int id)
        { 
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;

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
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
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
        /// <summary>
        /// Added by: Harikrishna Bura
        /// </summary>
        /// <returns></returns>
       [AdminAuthorize]
        public ViewResult AppointmentsList()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {                 
                //Staff staff = Session["Staff"] as Staff;
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
                    List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).OrderBy(a => a.FullName).ToList();
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
        /// <summary>
        /// Added by: Harikrishna Bura,
        /// Added on: Feb 03 2015.
        /// </summary>
        /// <param name="doctorID"></param>
        /// <param name="ScheduleId"></param>
        /// <param name="date"></param>
        /// <returns></returns>
       [AdminAuthorize]
       public ActionResult RegisterAppointment(int doctorID, int? ScheduleId, string date)
       {
           try
           {
               //Staff staff = Session["Staff"] as Staff;
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName; 
               IEnumerable<SelectListItem> listDoctors = null;
               IEnumerable<SelectListItem> listPatients = null;
               DoctorAppointmentSchedule timeSlot = new DoctorAppointmentSchedule();
               Appointment app = new Appointment();
               using (CareEntities dbContext = new CareEntities())
               {
                   listDoctors = new SelectList(dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID) && x.DoctorID == doctorID).ToList(), "DoctorID", "FullName", 0);
                   listPatients = new SelectList(dbContext.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).ToList(), "PatientID", "FullName", 0);
                   timeSlot = dbContext.DoctorAppointmentSchedules.Where(x => x.ScheduleId == ScheduleId).FirstOrDefault();

                   app.AddedBy = timeSlot.Timings_Slot;
                   app.AppointmentId = timeSlot.ScheduleId;
                   app.AppointmentDate = DateTime.ParseExact(date, @"M/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                   ViewBag.DoctorID = listDoctors;
                   ViewBag.PatientID = listPatients;
                   return View("RegisterAppointment", app);
               }
                  
           }
           catch (Exception Ex)
           {
               return View("Error");
           }
       }

       [HttpPost]
       [AdminAuthorize]
       public ActionResult RegisterAppointment(Appointment appointment)
       {
           try
           {
               //Staff staff = Session["Staff"] as Staff;
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName; 
               if (ModelState.IsValid)
               {
                   DoctorAppointment docApp = new DoctorAppointment();
                   docApp.Hospitald = currentUser.HospitalID;
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
                   

                   //return RedirectToAction("AppointmentsList");
                       /***/
                       List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).OrderBy(a => a.FullName).ToList();
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
       [AdminAuthorize]
       public ActionResult AddMedicalRecords(int id)
       {
           try
           {
               ViewBag.PatientId = id;
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName;
               UploadMedicalRecordsWithDoctorsVM resultData = new UploadMedicalRecordsWithDoctorsVM();
               //List<Doctor> listDoctors = null;
               IEnumerable<SelectListItem> DoctorsList = null;
               // 
               Patient patient = null;
               using (CareEntities dbContext = new CareEntities())
               {
                   patient = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
                   //listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
                   DoctorsList = new SelectList(dbContext.Doctors.Where(x => x.HospitalId == currentUser.HospitalID).ToList(), "DoctorID", "FullName", 1);
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
       [AdminAuthorize]
       public ViewResult DoctorsList()
       {
           Admin staff   = Session["Admin"] as Admin;
           ViewData["FullName"] = staff.FullName;

           IEnumerable<Doctor> listDoctors = null;
           try
           {
               using (CareEntities dbContext = new CareEntities())
               {
                   listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
               }

               ViewData["FullName"] = staff.FullName;

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
       [AdminAuthorize]
       public ActionResult DoctorsList(string id)
       {
           Admin staff = Session["Admin"] as Admin;
           ViewData["FullName"] = staff.FullName;

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

                   if (listDoctors.Count > 0)
                       ViewBag.Norecords = "";
                   else
                       ViewBag.Norecords = "No records found";
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
       [AdminAuthorize]
       public ViewResult EditDoctor(int id)
       {
           Admin staff = Session["Admin"] as Admin;
           ViewData["FullName"] = staff.FullName;
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
       [AdminAuthorize]
       public ActionResult EditDoctor(CareDataModels.DoctorInfo.DoctorInfo user)
       {
           /*if (!ModelState.IsValid)
           {
               return View(user);
           }*/
           Admin currentUser = Session["Admin"] as Admin;
           ViewData["FullName"] = currentUser.FirstName;
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
                           ViewBag.msgSlot = "Slot already exists";
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
        [AdminAuthorize]
       public ActionResult DoctorInfo(int id)
       {
           try
           {
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName; 
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
       [HttpPost]
       [AdminAuthorize]
       public ActionResult AddMedicalRecords(string DoctorID, int id, UploadMedicalRecordsWithDoctorsVM vm, IEnumerable<HttpPostedFileBase> files)
       {
           try
           {
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName;

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
                               record.HospitalId = currentUser.HospitalID;
                               record.AddedBy = currentUser.UserName;
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
        /// <summary>
        /// added by: hari
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
       [AdminAuthorize]
       public FileContentResult GetMedicalRecord(int id)
       {
           Admin currentUser = Session["Admin"] as Admin;
           ViewData["FullName"] = currentUser.FirstName;
           MedicalRecord record = null;
           try
           { 
               using (CareEntities db = new CareEntities())
               {
                   record = db.MedicalRecords.FirstOrDefault(x => x.MedicalRecordId == id && x.HospitalId == currentUser.HospitalID);
               }


           }
           catch (Exception Ex)
           {
               //return View("Error");
           }
           return new FileContentResult(record.MedicalRecordImage, record.ImageExtension);
       }

       [AdminAuthorize]
       public ActionResult GetAllMedicalRecords(int id)
       {
           try
           {
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName;
               IEnumerable<MedicalRecord> listMedicalRecords;

               using (CareEntities db = new CareEntities())
               {
                   listMedicalRecords = db.MedicalRecords.Where(x => x.PatientId == id && x.HospitalId == currentUser.HospitalID).ToList();
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
       [HttpGet]
       [AdminAuthorize]
       public ViewResult EditPatient(int id)
       {
           Admin currentUser = Session["Admin"] as Admin;
           ViewData["FullName"] = currentUser.FirstName;
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
       [AdminAuthorize]
       public ActionResult EditPatient(Patient user)
       {
           try
           {
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName;

               /*if (!ModelState.IsValid)
               {
                   return RedirectToAction("PatientInfo", new { id = user.PatientID });
               }*/
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
                   return RedirectToAction("PatientInfo", new { id = user.PatientID });
               }
           }
           catch (Exception Ex)
           {
               return View("Error");
           }
       }
       [HttpGet]
       [AdminAuthorize]
       public ViewResult EditAppointment(int id, int ScheduleId, int DoctorId)
       {
           try
           {
               //Staff staff = Session["Staff"] as Staff;
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName; 
               IEnumerable<SelectListItem> listDoctors = null;
               IEnumerable<SelectListItem> listPatients = null;
               DoctorAppointmentSchedule timeSlot = new DoctorAppointmentSchedule();
               Appointment app = new Appointment();
               DoctorAppointment aa =new DoctorAppointment();
               using (CareEntities dbContext = new CareEntities())
               {
                   listDoctors = new SelectList(dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID) && x.DoctorID == DoctorId).ToList(), "DoctorID", "FullName", 0);
                   listPatients = new SelectList(dbContext.Patients.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).ToList(), "PatientID", "FullName", 0);
                   timeSlot = dbContext.DoctorAppointmentSchedules.Where(x => x.ScheduleId == ScheduleId).FirstOrDefault();
                   aa = dbContext.DoctorAppointments.Where(x => x.ScheduleId == ScheduleId && x.Id==id).FirstOrDefault();
               }
               app.AddedBy = timeSlot.Timings_Slot;
               app.AppointmentId = timeSlot.ScheduleId;
               app.UpdatedBy = id.ToString();//Used for DoctorAppointment ID
               ViewBag.DoctorID = listDoctors;
               ViewBag.PatientID = listPatients;
               app.AppointmentDate = (DateTime)aa.AppointmentDate;
               return View("EditAppointment", app);
           }
           catch (Exception Ex)
           {
               return View("Error");
           }
       }
        [HttpPost]
        [AdminAuthorize]
        public ActionResult EditAppointment(Appointment appointment)
        {
            DoctorAppointment docApp = new DoctorAppointment();
            try
            {
                //Staff staff = Session["Staff"] as Staff;
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName; 
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
                       List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).OrderBy(a => a.FullName).ToList();
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
        [AdminAuthorize]
        public ActionResult DeleteAppointment(int id)
        {
            try
            {
               // Staff staff = Session["Staff"] as Staff;
                Admin currentUser = Session["Admin"] as Admin;
                ViewData["FullName"] = currentUser.FirstName;
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
       public ActionResult GetSlotsBasedonTime(Int32 id, string doctorID, string SelectedDate)
       {
           try
           {
               //Staff staff = Session["Staff"] as Staff;
               Admin currentUser = Session["Admin"] as Admin;
               ViewData["FullName"] = currentUser.FirstName; 
               IEnumerable<SelectListItem> selectlistDoctors = null;
               IEnumerable<SelectListItem> TimingSlots = null;

               List<Appointments> _listAppointments = new List<Appointments>();
               List<Appointments> _appointments = new List<Appointments>();

               List<AppointmentSlot> appSlot = new List<AppointmentSlot>();
               DateTime crrdate = DateTime.ParseExact(DateTime.Now.ToString("dd/M/yyyy"), "dd/M/yyyy", CultureInfo.InvariantCulture);
               using (CareEntities dbContext = new CareEntities())
               {
                   List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == currentUser.HospitalID)).OrderBy(a => a.FullName).ToList();
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



       public ActionResult CancelMultipleAppointment(string strid)
       {
           Admin currentUser = Session["Admin"] as Admin;
           ViewData["FullName"] = currentUser.FirstName; 
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
               return RedirectToAction("AppointmentsList", "Admin");
           }
           catch (Exception Ex)
           {
               return View("Error");
           }
       }
        //Appointment End

        [StaffAuthorize]
        public ViewResult TodaysAppointments()
       {
           Admin currentUser = Session["Admin"] as Admin;
           ViewData["FullName"] = currentUser.FirstName; 
            IEnumerable<Appointment> listAppointments = null;
            Staff staff = Session["Staff"] as Staff;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listAppointments = dbContext.Appointments.Include("Patient").Include("Doctor")
                        .Where(x => x.Patient.Hospitals.Any(a => a.HospitalId == staff.HospitalID)
                        && x.AppointmentDate.Year == DateTime.Now.Year && x.AppointmentDate.Month == DateTime.Now.Month && x.AppointmentDate.Day == DateTime.Now.Day).ToList();
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View("TodaysAppointments", listAppointments);
        }

        //[HttpGet]
        //[StaffAuthorize]
        //public ViewResult EditAppointment(int id)
        //{
        //    Staff staff = Session["Staff"] as Staff;
        //    Appointment appointmentToEdit = null;
        //    IEnumerable<SelectListItem> selectlistDoctors = null;
        //    try
        //    {
        //        using (CareEntities dbContext = new CareEntities())
        //        {
        //            appointmentToEdit = dbContext.Appointments.Include("Patient").Include("Doctor").FirstOrDefault(x => x.AppointmentId == id);
        //            List<Doctor> listDoctors = dbContext.Doctors.Where(x => x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).OrderBy(a => a.FullName).ToList();
        //            int selectedDoctor = 0;
        //            if (listDoctors != null)
        //            {
        //                selectedDoctor = listDoctors[0].DoctorID;
        //            }

        //            selectlistDoctors = new SelectList(listDoctors, "DoctorID", "FullName", appointmentToEdit.DoctorId);
        //        }

        //        ViewBag.DoctorID = selectlistDoctors;
        //    }
        //    catch (Exception Ex)
        //    {
        //        return View("Error");
        //    }

        //    return View("EditAppointment", appointmentToEdit);
        //}
        //Commented By: Harikrishna,
        //Commented on Feb 03 2015,
        //Description: New Edit Appintments
        //[HttpPost]
        //[StaffAuthorize]
        //public ActionResult EditAppointment(Appointment appointment)
        //{
        //    try
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            using (CareEntities dbContext = new CareEntities())
        //            {
        //                try
        //                {
        //                    appointment.AppointmentDate = DateTime.ParseExact(Request.Form["AppointmentDate"], "dd/MMM/yyyy hh:mm tt", CultureInfo.InvariantCulture);
        //                    dbContext.SaveChanges();
        //                }
        //                catch (DbUpdateConcurrencyException ex)
        //                {

        //                }

        //                return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
        //            }
        //        }

        //        return View(appointment);
        //    }
        //    catch (Exception Ex)
        //    {
        //        return View("Error");
        //    }
        //}

        [StaffAuthorize]
        public ActionResult ApproveAppointment(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Appointment appointment = null;
            try
            {
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
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
        }

        [StaffAuthorize]
        public ActionResult CancelAppointment(int id)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            Appointment appointment = null;
            try
            {
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
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return RedirectToAction("AppointmentInfo", new { id = appointment.AppointmentId });
        } 
        [SuperAdminAuthorize]
        public ActionResult changepassword()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            return View();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="admin"></param>
        /// <returns></returns>
        [HttpPost]
        [SuperAdminAuthorize]
        public ActionResult changepassword(Admin admin, string ConfirmPassword, string NewPassword)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            try
            {

                if (!string.IsNullOrEmpty(ConfirmPassword) && !string.IsNullOrEmpty(NewPassword))
                {
                    if (ConfirmPassword == NewPassword)
                    {
                        if (currentUser.Password == admin.Password)
                        {
                            using (CareEntities dbContext = new CareEntities())
                            {
                                currentUser.Password = NewPassword;
                                dbContext.Entry(currentUser).State = EntityState.Modified;
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
                        ModelState.AddModelError("", "New and confirm Password Mismatch");
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
                
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View();
        }

        [AdminAuthorize]
        public ActionResult AdminChangePassword()
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName; 
            return View();
        }
        [HttpPost]
        [AdminAuthorize]
        public ActionResult AdminChangePassword(Admin admin, string ConfirmPassword, string NewPassword)
        {
            Admin currentUser = Session["Admin"] as Admin;
            ViewData["FullName"] = currentUser.FirstName;
            try
            {

                if (!string.IsNullOrEmpty(ConfirmPassword) && !string.IsNullOrEmpty(NewPassword))
                {
                    if (ConfirmPassword == NewPassword)
                    {
                        if (currentUser.Password == admin.Password)
                        {
                            using (CareEntities dbContext = new CareEntities())
                            {
                                currentUser.Password = NewPassword;
                                dbContext.Entry(currentUser).State = EntityState.Modified;
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
                        ModelState.AddModelError("", "New and confirm Password Mismatch");
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
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View();
        }
        #endregion
    }
}