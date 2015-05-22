using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using CareDataModels.Models;
using System.Net;
using System.Threading;

namespace CareAPI.Utility
{
    public class DoctorAuthorize : AuthorizeAttribute
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(PatientAuthorize));
        
        public override void OnAuthorization(System.Web.Http.Controllers.HttpActionContext actionContext)
        {
            if (AuthorizationHelper.Authenticate(actionContext, typeof(Doctor)))
            {
                return;
            }
            else
            {
                HandleUnauthorizedRequest(actionContext);
            }
        }

        protected override void HandleUnauthorizedRequest(System.Web.Http.Controllers.HttpActionContext actionContext)
        {
            //var challengeMessage = new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized);
            //challengeMessage.Headers.Add("WWW-Authenticate", "Basic");
            //throw new HttpResponseException(challengeMessage);

            throw new HttpResponseException(new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized));
        }
    }
}