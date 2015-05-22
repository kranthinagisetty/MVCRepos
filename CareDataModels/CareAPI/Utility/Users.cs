using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace CareAPI.Utility
{
    public class Users
    {
        public static Patient GetCurrentPatient(CareEntities db)
        {
            string currentUserName = string.Empty;
            Patient currentUser = null;
            GenericPrincipal principal = HttpContext.Current.User as GenericPrincipal;

            if (principal != null)
            {
                currentUserName = principal.Identity.Name;
                currentUser = db.Patients.FirstOrDefault(x => x.UserName == currentUserName);
            }

            return currentUser;
        }

        public static Doctor GetCurrentDoctor(CareEntities db)
        {
            string currentUserName = string.Empty;
            Doctor currentUser = null;
            GenericPrincipal principal = HttpContext.Current.User as GenericPrincipal;

            if (principal != null)
            {
                currentUserName = principal.Identity.Name;
                currentUser = db.Doctors.FirstOrDefault(x => x.UserName == currentUserName);
            }

            return currentUser;
        }

        public static Staff GetCurrentStaff(CareEntities db)
        {
            string currentUserName = string.Empty;
            Staff currentUser = null;
            GenericPrincipal principal = HttpContext.Current.User as GenericPrincipal;

            if (principal != null)
            {
                currentUserName = principal.Identity.Name;
                currentUser = db.Staffs.FirstOrDefault(x => x.UserName == currentUserName);
            }

            return currentUser;
        }
    }
}