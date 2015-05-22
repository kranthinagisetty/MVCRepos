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
    public class StaffLoginController : Controller
    {
        static List<Staff> listStaff = null;

        public StaffLoginController()
        {
            using (CareEntities dbContext = new CareEntities())
            {
                listStaff = dbContext.Staffs.ToList();
            }
        }

        //public ActionResult Login()
        //{
        //    if (Session["Staff"] != null)
        //    {
        //        Staff user = Session["Staff"] as Staff;
        //        return RedirectToAction("StaffHome", "Staff");               
        //    }
        //    return View();
        //}

       // [HttpPost]
        public ActionResult Login(Login tempUser, string ReturnUrl)
        {
            try
            {
                Login userq = (Login)TempData["user"];
                //if (ModelState.IsValid)
                //{
                Staff user = listStaff.FirstOrDefault(x => x.Phone == userq.UserName & x.Password == userq.Password);
                if (user != null)
                {
                    Session["Staff"] = user;
                    FormsAuthentication.SetAuthCookie(user.UserName, true);

                    //return RedirectToAction("StaffHome", "Staff");                    
                    return RedirectToAction("AppointmentsList", "Staff");

                }
                else
                {
                    ModelState.AddModelError("", "Login Failed");
                    TempData["ModelState"] = ModelState;
                    return RedirectToAction("Home", "Home");
                }
                //}
                //else
                //{
                //    ModelState.AddModelError("", "Login Failed");
                //}
                TempData["user"] = null;

                return RedirectToAction("Home", "Home");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        public ActionResult Logout()
        {
            Session["Staff"] = null;
            FormsAuthentication.SignOut();
            return View("Login");
        }

    }
}
