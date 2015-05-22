using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CareWeb.Models
{
    public class Login
    {
        //[StringLength(12, ErrorMessage = "Mobile number should be less than 13 characters")]
        public string UserName { get; set; }
        public string Password { get; set; }
        public int LoginSelectedType { get; set; }
        public List<SelectListItem> LoginType; 
    }
}