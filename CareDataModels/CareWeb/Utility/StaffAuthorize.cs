using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Utility
{
    public class StaffAuthorize : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                return false;
            }

            Staff user = httpContext.Session["Staff"] as Staff;
            if (user == null)
            {
                return false;
            }

            return true;
        }
    }
}