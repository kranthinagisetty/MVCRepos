using CareDataModels.Models;
using CareWeb.Utility;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Controllers
{
    public class PatientLoginController : Controller
    {
        //
        // GET: /PatientLogin/

        public ActionResult Index()
        {
            return View();
        }
        #region Patients
        [HttpGet]
        [PatientAuthorize]
        public ViewResult EditPatient(int id)
        {
            Patient PatientToEdit = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    PatientToEdit = dbContext.Patients.FirstOrDefault(x => x.PatientID == id);
                }

                return View("EditPatient", PatientToEdit);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [PatientAuthorize]
        public ActionResult EditPatient(Patient user)
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

        //[AdminAuthorize]
        public ViewResult PatientsList()
        {
            Patient patients = new Patient();
            return View(patients);
        }               

        [PatientAuthorize]
        public ViewResult CreatePatient()
        {
            return View();
        }

        [HttpPost]
        [PatientAuthorize]
        public ActionResult CreatePatient(Patient user)
        {
            Staff staff = Session["Staff"] as Staff;
            Hospital hospital = null;
            try
            {
                if (ModelState.IsValid)
                {
                    using (CareEntities dbContext = new CareEntities())
                    {
                        if (user.DOB != null)
                        {
                            user.DOB = DateTime.ParseExact(Request.Form["DOB"], "dd/MMM/yyyy", CultureInfo.InvariantCulture);
                        }

                        hospital = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == staff.HospitalID);
                        user.Hospitals.Add(hospital);
                        dbContext.Patients.Add(user);
                        dbContext.SaveChanges();
                        return RedirectToAction("PatientInfo", new { id = user.PatientID });
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
        /// Added By: Harikrishna Bura
        /// Description: Fetch the Searched Patients.
        /// </summary>
        /// <param name="phone"></param>
        /// <returns></returns>
        //[PatientAuthorize]
        [HttpPost] 
        public ActionResult PatientInfo()
        {
            string searchString = Request.Form["SearchBox"];
            Patient patient = null;
            try
            {
                using (CareEntities dbContext = new CareEntities())
                {
                    patient = dbContext.Patients.FirstOrDefault(x => x.Phone == searchString);
                }

                return View("PatientInfo", patient);
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }
        [HttpPost]
        //[PatientAuthorize]
        public ViewResult PatientsList(string id)
        {
            string searchString = Request.Form["SearchBox"];
            Staff staff = Session["Staff"] as Staff;
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
        }
        #endregion

    }
}
