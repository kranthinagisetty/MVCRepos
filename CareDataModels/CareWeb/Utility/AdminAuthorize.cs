using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Utility
{
    public class AdminAuthorize : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                return false;
            }

            Admin user = httpContext.Session["Admin"] as Admin;
            if (user == null)
            {
                return false;
            }

            return (user.RoleId != 1);
        }
    }
}