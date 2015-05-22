using CareDataModels.Models;
using CareWeb.Utility;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Controllers
{
    public class DoctorController : Controller
    {
        //[DoctorAuthorize]
        public ViewResult DoctorHome()
        {           
            return View("DoctorHome");
        }

        #region Doctors
        //[StaffAuthorize]
        public ViewResult CreateDoctor()
        {
            return View();
        }

        //[StaffAuthorize]
        [HttpPost]
        public ActionResult CreateDoctor(Doctor user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        dbContext.Doctors.Add(user);
                        dbContext.SaveChanges();
                        //return RedirectToAction("DoctorInfo", new { id = user.DoctorID });
                    }
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }

            return View(user);
        }

        //[StaffAuthorize]
        public ActionResult DoctorInfo(int id)
        {
            Doctor doctor = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    doctor = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                }

                return View("DoctorInfo", doctor);
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
            IEnumerable<Doctor> listDoctors = null;

            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    listDoctors = dbContext.Doctors.Where(a => a.Hospitals.Any(x => x.HospitalId == staff.HospitalID)).ToList();
                }
                return View(listDoctors);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ViewResult DoctorsList(string id)
        {
            Staff staff = Session["Staff"] as Staff;
            List<Doctor> listDoctors = new List<Doctor>();

            try
            {
                string searchString = Request.Form["SearchBox"];

                if (!string.IsNullOrEmpty(searchString))
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        listDoctors = dbContext.Doctors.Where(x =>
                            (x.FullName.Contains(searchString) || x.UserName.Contains(searchString) || x.Phone.Contains(searchString))
                            && x.Hospitals.Any(a => a.HospitalId == staff.HospitalID)).ToList();
                    }
                }
                return View(listDoctors);
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
            Doctor doctorToEdit = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    doctorToEdit = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == id);
                }

                return View("EditDoctor", doctorToEdit);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [StaffAuthorize]
        public ActionResult EditDoctor(Doctor user)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(user);
                }

                using (CareEntities dbContext = new CareEntities())
                {
                    try
                    {
                        CareDataModels.Utility.UpdateDoctor(dbContext, user);
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {

                    }
                    return RedirectToAction("DoctorInfo", new { id = user.DoctorID });
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        #endregion
    }
}
