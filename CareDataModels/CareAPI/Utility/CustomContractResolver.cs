using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareAPI.Utility
{
    public class CustomContractResolver : DefaultContractResolver
    {         
        protected override IList<JsonProperty> CreateProperties(Type type, Newtonsoft.Json.MemberSerialization memberSerialization)
        {
            IList<JsonProperty> properties = base.CreateProperties(type, memberSerialization);
            return properties.Where(p => !(p.PropertyName.EndsWith("s") 
                || p.PropertyName.Equals("Patient") 
                //|| p.PropertyName.Equals("Doctor")
                || p.PropertyName.Equals("Admin") || p.PropertyName.Equals("Staff")
                || p.PropertyName.Equals("AddedOn") || p.PropertyName.Equals("UpdatedOn")
                || p.PropertyName.Equals("Password")
                || p.PropertyName.Equals("RoleId")
                )).ToList();
        }

    }
}