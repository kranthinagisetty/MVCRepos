using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Utility
{
    public class PatientAuthorize : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                return false;
            }

            Patient user = httpContext.Session["Patient"] as Patient;
            if (user == null)
            {
                return false;
            }

            return true;
        }
    }
}