using CareDataModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareDataModels
{
    public class Utility
    {
        public static void UpdateAdmin(CareEntities dbContext, Admin current)
        {
            Admin original = dbContext.Admins.FirstOrDefault(x => x.AdminID == current.AdminID);
            original.HospitalID = current.HospitalID;
            original.AddressLine1 = current.AddressLine1;
          //  original.AddressLine2 = current.AddressLine2;
            original.City = current.City;
            original.State = current.State;
            original.ZipCode = current.ZipCode;
            original.FirstName = current.FirstName;
            original.IsActive = current.IsActive;
            original.IsLocked = current.IsLocked;
            original.LastName = current.LastName;
            original.Password = current.Password;
            original.Phone = current.Phone;
            original.Email = current.Email;
            original.UpdatedOn = DateTime.UtcNow;
            original.Gender = current.Gender;
            dbContext.SaveChanges();
        }

        public static void UpdateStaff(CareEntities dbContext, Staff current)
        {
            Staff original = dbContext.Staffs.FirstOrDefault(x => x.StaffID == current.StaffID);
            //original.HospitalID = current.HospitalID;
            original.AddressLine1 = current.AddressLine1;
            original.AddressLine2 = string.IsNullOrEmpty(current.AddressLine2) ? "A" : current.AddressLine2;
            original.City = current.City;
            original.State = current.State;
            original.ZipCode = current.ZipCode;
            original.FirstName = current.FirstName;
            original.IsActive = current.IsActive;
            original.IsLocked = current.IsLocked;
            original.LastName = current.LastName;
            original.Password = current.Password;
            original.Phone = current.Phone;
            original.Email = current.Email;
            original.UpdatedOn = DateTime.UtcNow;
            original.Gender = current.Gender;
            dbContext.SaveChanges();
        }

        public static void UpdatePatient(CareEntities dbContext, Patient current)
        {
            try
            {
                Patient original = dbContext.Patients.FirstOrDefault(x => x.PatientID == current.PatientID);
                original.PatientID = current.PatientID;
                original.AddressLine1 = current.AddressLine1;
                //   original.AddressLine2 = current.AddressLine2;
                if (current.City != null)
                    original.City = current.City;
                if (current.State != null)
                    original.State = current.State;
                original.ZipCode = current.ZipCode;
                original.FirstName = current.FirstName;
                original.LastName = current.LastName;
                original.Password = current.Password;
                original.Phone = current.Phone;
                original.Email = string.IsNullOrEmpty(current.Email) ? "" : current.Email;
                original.UpdatedOn = DateTime.UtcNow;
                original.Gender = current.Gender;
                original.AddressLine2 = "1";
                //If file is Uploaded
                if (current.ImageContent != null)
                {
                    original.ImageContent = current.ImageContent;
                }
                dbContext.SaveChanges();
            }

            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {
                Exception ErrorRaise = ex;
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string errorMessage = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);

                        ErrorRaise = new InvalidOperationException(errorMessage, ErrorRaise);
                    }
                }
            }
        }

        public static void UpdateDoctor(CareEntities dbContext, Doctor current)
        {
            Doctor original = dbContext.Doctors.FirstOrDefault(x => x.DoctorID == current.DoctorID);
            original.AddressLine1 = current.AddressLine1;
         //   original.AddressLine2 = current.AddressLine2;
            if(current.City!=null)
                original.City = current.City;
            if (current.State != null)
            original.State = current.State;

            original.AddressLine2 = string.IsNullOrEmpty(current.AddressLine2) ? "A" : current.AddressLine2;

            original.Email = string.IsNullOrEmpty(current.Email) ? "" : current.Email;

            original.ZipCode = current.ZipCode;
            original.FirstName = current.FirstName;
            original.IsActive = false;
            original.IsLocked = false;
            original.LastName = current.LastName;
            original.Password = current.Password;
            original.Phone = current.Phone;
            original.Specialization = current.Specialization;
           
            original.Gender = current.Gender;
            original.Intervels = current.Intervels;

            dbContext.Entry(original).State = System.Data.EntityState.Modified;
            dbContext.SaveChanges();
        }

        /// <summary>
        /// Added By:Harikrishna,
        /// On: OCT 20 2014
        /// </summary>
        /// <param name="dbContext"></param>
        /// <param name="current"></param>
        public static void UpdateHospital(CareEntities dbContext, Hospital current)
        {
            Hospital original = dbContext.Hospitals.FirstOrDefault(x => x.HospitalId == current.HospitalId);
            original.AddressLine1 = current.AddressLine1;
            //original.AddressLine2 = current.AddressLine2;
            original.City = current.City;
            original.State = current.State;
            original.ZipCode = current.ZipCode;
            original.IsActive = current.IsActive;
            original.UpdatedOn = DateTime.UtcNow;
            //If file is Uploaded
            if (current.ImageContent != null)
            {
                original.ImageContent = current.ImageContent;
            }
            dbContext.SaveChanges();
        }
    }
}
