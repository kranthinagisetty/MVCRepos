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
    public class PatientAuthorize : AuthorizeAttribute
    {
        #region Commented
        //bool requireSsl = false;//Convert.ToBoolean(ConfigurationManager.AppSettings["RequireSsl"]);
        //bool requireAuthentication = true;
        //private static readonly ILog log = LogManager.GetLogger(typeof(PatientAuthorize));

        //public bool RequireSsl
        //{
        //    get { return requireSsl; }
        //    set { requireSsl = value; }
        //}        

        //public bool RequireAuthentication
        //{
        //    get { return requireAuthentication; }
        //    set { requireAuthentication = value; }
        //}

        //public override void OnAuthorization(System.Web.Http.Controllers.HttpActionContext actionContext)
        //{
        //    if (Authenticate(actionContext) || !RequireAuthentication)
        //    {
        //        return;
        //    }
        //    else
        //    {
        //        HandleUnauthorizedRequest(actionContext);
        //    }
        //}

        //protected override void HandleUnauthorizedRequest(System.Web.Http.Controllers.HttpActionContext actionContext)
        //{
        //    //var challengeMessage = new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized);
        //    //challengeMessage.Headers.Add("WWW-Authenticate", "Basic");
        //    //throw new HttpResponseException(challengeMessage);

        //    throw new HttpResponseException(new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized));
        //}

        //private bool Authenticate(System.Web.Http.Controllers.HttpActionContext actionContext) //HttpRequestMessage input)
        //{
        //    if (RequireSsl && !HttpContext.Current.Request.IsSecureConnection && !HttpContext.Current.Request.IsLocal)
        //    {
        //        log.Error("Failed to login: SSL:" + HttpContext.Current.Request.IsSecureConnection);
        //        return false;
        //    }

        //    if (!HttpContext.Current.Request.Headers.AllKeys.Contains("Authorization"))
        //    {
        //        log.Error("Authorization token is missing");
        //        return false;
        //    }

        //    string authHeader = HttpContext.Current.Request.Headers["Authorization"];

        //    IPrincipal principal;
        //    if (TryGetPrincipal(authHeader, out principal))
        //    {
        //        HttpContext.Current.User = principal;
        //        return true;
        //    }
        //    return false;
        //}

        //private bool TryGetPrincipal(string authHeader, out IPrincipal principal)
        //{
        //    var creds = ParseAuthHeader(authHeader);
        //    if (creds != null)
        //    {
        //        if (TryGetPrincipal(creds[0], creds[1], out principal)) return true;
        //    }

        //    principal = null;
        //    return false;
        //}

        //private string[] ParseAuthHeader(string authHeader)
        //{
        //    // Check this is a Basic Auth header 
        //    if (authHeader == null || authHeader.Length == 0) return null;

        //    // Pull out the Credentials with are seperated by ':' and Base64 encoded 
        //    string base64Credentials = authHeader.Substring(6);
        //    string[] credentials = Encoding.ASCII.GetString(Convert.FromBase64String(base64Credentials)).Split(new char[] { ':' });
        //        //base64Credentials.Split(new char[] { ':' });

        //    log.Info("Credentials Supplied : " + credentials[0] + " Password: " + credentials[1]);
        //        //Encoding.ASCII.GetString(Convert.FromBase64String(base64Credentials)).Split(new char[] { ':' });

        //    if (credentials.Length != 2 || string.IsNullOrEmpty(credentials[0]) || string.IsNullOrEmpty(credentials[0])) return null;

        //    return credentials;
        //}

        //private bool TryGetPrincipal(string username, string password, out IPrincipal principal)
        //{
        //    username = username.Trim();
        //    password = password.Trim();

        //    Patient person = null;
        //    using (CareEntities dbContext = new CareEntities())
        //    {
        //        person = dbContext.Patients.FirstOrDefault(x => (x.UserName == username && x.Password == password)||(x.Phone == username && x.Password == password));
        //    }

        //    if (person != null)
        //    {  
        //        principal = new GenericPrincipal(new GenericIdentity(person.UserName), new[] { "PatientRole" });
        //        Thread.CurrentPrincipal =  principal;
        //        return true;
        //    }
        //    else
        //    {
        //        if (!String.IsNullOrWhiteSpace(username))
        //        {
        //            log.Error("Failed to login: username=" + username + "; password=" + password);
        //        }
        //        principal = null;
        //        return false;
        //    }
        //} 
        #endregion

        private static readonly ILog log = LogManager.GetLogger(typeof(PatientAuthorize));

        public override void OnAuthorization(System.Web.Http.Controllers.HttpActionContext actionContext)
        {
            if (AuthorizationHelper.Authenticate(actionContext, typeof(Patient)))
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
            throw new HttpResponseException(new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized));
        }
    }
}
    