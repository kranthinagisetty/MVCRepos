using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CareWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Home", id = UrlParameter.Optional }//Commented By Harikrishna Bura
                //defaults: new { controller = "AdminLogin", action = "Login", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "MultiInt",
                url: "{controller}/{action}/{id}/{userId}",
                defaults: new {id = UrlParameter.Optional, userId=UrlParameter.Optional }
            );  
        }
    }
}