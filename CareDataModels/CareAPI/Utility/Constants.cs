using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Utility
{
    public static class Constants
    {
        public const string ErrorPrefix = "Error : ";
        public const string InfoPrefix = "Info : ";
        public const string InnerExceptionPrefix = "Innner Exception : ";
        public const string RequestTypePostPrefix = "Post Request - Create : ";
        public const string RequestTypePutPrefix = "Put Request - Update : ";
        public const string RequestTypeGetPrefix = "Get Request - Get : ";
        public const string RequestTypeDeletePrefix = "Delete Request - Delete : ";
    }
}