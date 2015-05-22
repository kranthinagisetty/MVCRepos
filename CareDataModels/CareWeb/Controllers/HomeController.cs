using CareWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CareWeb.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

       /* public ActionResult Index()
        {
            try
            {
                //throw new Exception("sdgfdsfsdfd"); 
            }
            catch(Exception Ex) 
            {
                return View("Error");
            }

            return RedirectToAction("Home", "Home");
           
        }*/
        [HttpGet]
        public ActionResult Home()
        {
            var Login = new Login();
            try
            {
                ViewBag.errorsData = "";
                if (TempData["ModelState"] != null)
                {
                    ViewBag.errordata = TempData["ModelState"];

                   if(ViewBag.errordata.Values.Count > 0)
                    {
                        ViewBag.errorsData = "Login Failed";
                    }
                }

               
                Login.LoginType = new List<SelectListItem>();
                Login.LoginType.Add(new SelectListItem { Text = "Select Type", Value = "0", Selected = true });
                Login.LoginType.Add(new SelectListItem { Text = "Admin", Value = "1" });
                Login.LoginType.Add(new SelectListItem { Text = "Staff", Value = "2" });
            
            }
            catch(Exception Ex) 
            {
                return View("Error");
            }
            return View(Login);
        }
        [HttpPost]
        public ActionResult Home(Login User, string ReturnUrl)
        {
            var Login = new Login();
            Login.LoginType = new List<SelectListItem>();
            try
            {
                Login.LoginType.Add(new SelectListItem { Text = "Select Type", Value = "0", Selected = true });
                Login.LoginType.Add(new SelectListItem { Text = "Admin", Value = "1" });
                Login.LoginType.Add(new SelectListItem { Text = "Staff", Value = "2" });
                if (ModelState.IsValid)
                {
                    if (User.LoginSelectedType == 1)
                    {
                        if (User.UserName == null)
                        {
                            ModelState.AddModelError("", "Please enter Mobile Number");
                        }
                        else if (User.Password == null)
                        {

                            ModelState.AddModelError("", "Please enter Password");
                        }
                        else
                        {
                            TempData["user"] = User;
                            return RedirectToAction("Login", "AdminLogin", new { tempUser = User.UserName, ReturnUrl = "" });
                        } 
                    }
                    else if (User.LoginSelectedType == 2)
                    {
                         if (User.UserName == null)
                        {
                            ModelState.AddModelError("", "Please enter Mobile Number");
                        }
                         else if (User.Password == null)
                         {

                             ModelState.AddModelError("", "Please enter Password");
                         }
                         else
                         {
                             TempData["user"] = User;
                             return RedirectToAction("Login", "StaffLogin", new { tempUser = User.UserName, ReturnUrl = "" });
                         }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Please select type");
                    }
                    TempData["user"] = null;
                }
                else
                {
                    ModelState.AddModelError("", "Login Failed");
                }
            }
            catch (Exception Ex)
            {
                return View("Error");
            }
            return View(Login);
        }
        public ActionResult Logout()
        {
            Session["Admin"] = null;
            Session["Staff"] = null;
            Session["Doctor"] = null;
            Session["Patient"] = null;
            TempData["user"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Home");
        }
    }
}
