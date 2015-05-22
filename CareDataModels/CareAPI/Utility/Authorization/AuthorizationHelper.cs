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
    public class AuthorizationHelper
    {
        public static bool RequireSsl
        {
            get
            {
                return false;//Convert.ToBoolean(ConfigurationManager.AppSettings["RequireSsl"]);
            }
        }

        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static bool Authenticate(System.Web.Http.Controllers.HttpActionContext actionContext, Type entityType) 
        {
            if (RequireSsl && !HttpContext.Current.Request.IsSecureConnection && !HttpContext.Current.Request.IsLocal)
            {
                log.Error("Failed to login: SSL:" + HttpContext.Current.Request.IsSecureConnection);
                return false;
            }

            if (!HttpContext.Current.Request.Headers.AllKeys.Contains("Authorization"))
            {
                log.Error("Authorization token is missing");
                return false;
            }

            string authHeader = HttpContext.Current.Request.Headers["Authorization"];

            IPrincipal principal;
            if (TryGetPrincipal(authHeader, entityType, out principal))
            {
                HttpContext.Current.User = principal;
                return true;
            }
            return false;
        }

        private static bool TryGetPrincipal(string authHeader, Type entityType, out IPrincipal principal)
        {
            var creds = ParseAuthHeader(authHeader);
            if (creds != null)
            {
                if (TryGetPrincipal(creds[0], creds[1], entityType, out principal)) return true;
            }

            principal = null;
            return false;
        }

        private static string[] ParseAuthHeader(string authHeader)
        {
            if (authHeader == null || authHeader.Length == 0) return null;
            string base64Credentials = authHeader.Substring(6);
            string[] credentials = Encoding.ASCII.GetString(Convert.FromBase64String(base64Credentials)).Split(new char[] { ':' });
            
            log.Info("Credentials Supplied : " + credentials[0] + " Password: " + credentials[1]);

            if (credentials.Length != 2 || string.IsNullOrEmpty(credentials[0]) || string.IsNullOrEmpty(credentials[0])) return null;

            return credentials;
        }

        private static bool TryGetPrincipal(string userKey, string password, Type type, out IPrincipal principal)
        {
            userKey = userKey.Trim();
            password = password.Trim();
            string userName = string.Empty;

           
            using (CareEntities dbContext = new CareEntities())
            {
                if (type == typeof(Patient))
                {
                    Patient person = dbContext.Patients.FirstOrDefault(x => (x.UserName == userKey && x.Password == password) || (x.Phone == userKey && x.Password == password));
                    if(person != null)
                    {
                        userName = person.UserName;
                    }
                }
                else if (type == typeof(Doctor))
                {
                    Doctor person = dbContext.Doctors.FirstOrDefault(x => (x.UserName == userKey && x.Password == password) || (x.Phone == userKey && x.Password == password));
                    if (person != null)
                    {
                        userName = person.UserName;
                    }
                }
                else if (type == typeof(Staff))
                {
                    Staff person = dbContext.Staffs.FirstOrDefault(x => (x.UserName == userKey && x.Password == password) || (x.Phone == userKey && x.Password == password));
                    if (person != null)
                    {
                        userName = person.UserName;
                    }
                }
            }

            if (!string.IsNullOrEmpty(userName))
            {
                principal = new GenericPrincipal(new GenericIdentity(userName), new[] { "Role" });
                Thread.CurrentPrincipal = principal;
                return true;
            }
            else
            {
                if (!String.IsNullOrWhiteSpace(userKey))
                {
                    log.Error("Failed to login: username=" + userKey + "; password=" + password);
                }
                principal = null;
                return false;
            }
        }
    }
}