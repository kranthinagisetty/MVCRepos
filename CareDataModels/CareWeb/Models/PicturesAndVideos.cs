using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CareWeb.Models
{
    public class PicturesAndVideos
    {
        public Nullable<int> HospitalId { get; set; }
        public List<CareDataModels.Models.Picture> listPictures { get; set; }
        public List<CareDataModels.Models.Video> listVideos { get; set; }
    }
}