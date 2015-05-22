using CareDataModels.Models;
using CareWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CareWeb.Controllers
{
    public class DoctorLoginController : Controller
    {
        static List<Doctor> listDoctors = null;

        public DoctorLoginController()
        {
            using (CareEntities dbContext = new CareEntities())
            {
                listDoctors = dbContext.Doctors.ToList();
            }
        }

        public ActionResult Login()
        {
            try
            {
                if (Session["Doctor"] != null)
                {
                    Doctor user = Session["Doctor"] as Doctor;
                    return RedirectToAction("DoctorHome");
                }
                return View();
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        [HttpPost]
        public ActionResult Login(Login tempUser, string ReturnUrl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Doctor user = listDoctors.FirstOrDefault(x => x.UserName == tempUser.UserName & x.Password == tempUser.Password);
                    if (user != null)
                    {
                        Session["Doctor"] = user;
                        FormsAuthentication.SetAuthCookie(user.UserName, true);

                        return RedirectToAction("DoctorHome", "Doctor");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Login Failed");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Login Failed");
                }

                return View();
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        public ActionResult Logout()
        {
            Session["Doctor"] = null;
            FormsAuthentication.SignOut();
            return View("Login");
        }
    }
}
