using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace CareAPI.Utility
{
    public class ErrorResponse
    {
        public static HttpResponseMessage Get(ApiController controller, HttpStatusCode statusCode)
        {
            HttpResponseMessage message = null;
            switch(statusCode)
            {
                case HttpStatusCode.Unauthorized:
                    controller.Request.CreateErrorResponse(statusCode, "The user is not authorized to perform the requested operation");
                    break;
                case HttpStatusCode.NotFound:
                    controller.Request.CreateErrorResponse(statusCode, "Either the requested resource is not available or the user does not have permission to view the resource");
                    break;

                default:
                    controller.Request.CreateErrorResponse(statusCode, "An error occurred");
                    break;
            }

            return message;
        }
    }
}