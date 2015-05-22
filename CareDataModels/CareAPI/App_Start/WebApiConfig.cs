using CareAPI.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Tracing;
using System.Web.Http.Validation.Providers;

namespace CareAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

           config.Routes.MapHttpRoute(
             name: "TwoIntParamsApi",
             routeTemplate: "api/{controller}/{action}/{firstId}/{secondId}",
             defaults: new { firstId = RouteParameter.Optional, secondId = RouteParameter.Optional }
           );

            // Uncomment the following line of code to enable query support for actions with an IQueryable or IQueryable<T> return type.
            // To avoid processing unexpected or malicious queries, use the validation settings on QueryableAttribute to validate incoming queries.
            // For more information, visit http://go.microsoft.com/fwlink/?LinkId=279712.
            //config.EnableQuerySupport();

            // To disable tracing in your application, please comment out or remove the following line of code
            // For more information, refer to: http://www.asp.net/web-api
            config.EnableSystemDiagnosticsTracing();
            config.Formatters.JsonFormatter.SerializerSettings.Formatting = Newtonsoft.Json.Formatting.Indented;
            //config.Formatters.JsonFormatter.SerializerSettings.DefaultValueHandling = Newtonsoft.Json.DefaultValueHandling.Ignore;
            config.Formatters.JsonFormatter.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Include;
            config.Formatters.JsonFormatter.SerializerSettings.PreserveReferencesHandling = Newtonsoft.Json.PreserveReferencesHandling.None;
            config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CustomContractResolver();
            config.Formatters.Remove(config.Formatters.XmlFormatter);
            log4net.Config.XmlConfigurator.Configure();
            config.Services.Replace(typeof(ITraceWriter), new Log4Tracer());
            config.Services.RemoveAll(typeof(System.Web.Http.Validation.ModelValidatorProvider), val => val is InvalidModelValidatorProvider);
        }
    }
}
