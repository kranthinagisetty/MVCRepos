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
    public class AdminLoginController : Controller
    {
        static List<Admin> Users = null;

        public AdminLoginController()
        {
            using (CareEntities dbContext = new CareEntities())
            {
                Users = dbContext.Admins.ToList();
            }
        }

        //public ActionResult Login()
        //{
        //    if (Session["Admin"] != null)
        //    {
        //        Admin user = Session["Admin"] as Admin;

        //        if (user.RoleId == 1)
        //        {
        //            return RedirectToAction("SuperAdminHome", "Admin");
        //        }
        //        else
        //        {
        //            return RedirectToAction("AdminHome", "Admin");
        //        }
        //    }
        //    return View();
        //}
        /// <summary>
        /// Modified By: Harikrishna Bura
        /// Description: AfterLogin redirect to HospitalList
        /// </summary>
        /// <param name="tempUser"></param>
        /// <param name="ReturnUrl"></param>
        /// <returns></returns>
        //[HttpPost]
        public ActionResult Login(Login tempUser, string ReturnUrl)
        {
            try
            {
                Login userq = (Login)TempData["user"];
                //if (ModelState.IsValid)
                //{
                Admin user = Users.FirstOrDefault(x => x.Phone == userq.UserName & x.Password == userq.Password);
                if (user != null)
                {
                    Session["Admin"] = user;
                    FormsAuthentication.SetAuthCookie(user.UserName, true);
                    if (user.RoleId == 1)
                    {
                        // return RedirectToAction("SuperAdminHome", "Admin");
                        return RedirectToAction("HospitalsList", "Admin");
                    }
                    else
                    {
                        //return RedirectToAction("AdminHome", "Admin");
                        //return RedirectToAction("StaffList", "Admin");
                        return RedirectToAction("AppointmentsList", "Admin");
                    }
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
                //TempData["user"] = null;
                return RedirectToAction("Home", "Home");
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
        }

        

    }
}
