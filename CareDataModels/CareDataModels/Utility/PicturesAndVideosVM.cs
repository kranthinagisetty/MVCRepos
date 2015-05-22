using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareDataModels.PicturesAndVideosVM
{
    public class PicturesAndVideosVM
    {
        public Nullable<int> HospitalId { get; set; }
        public List<CareDataModels.Models.Picture> listPictures { get; set; }
        public List<CareDataModels.Models.Video> listVideos { get; set; }
    }
}
