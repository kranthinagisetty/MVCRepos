using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Models
{
    public class Dropdown
    {
    }

    public class CountryModel : Patient
    {
        public Int32 CountryID { get; set; }
        public string CountryName { get; set; }
       
    }
    public class State : Patient
    {
        public Int32 StateID { get; set; }
        public string StateName { get; set; }
    }
    public class City : Patient
    {
        public Int32 CityID { get; set; }
        public string CityName { get; set; }
    }
}