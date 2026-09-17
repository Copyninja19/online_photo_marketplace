using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_photoGallery_admin
{
    public class StaticValues
    {
        public static string uloadImgName {  get; set; }
        public static string selectimgQuery { get; set; } = "SELECT * FROM upimages";
        public static int ImgID { get; set;}
        public static int AdId { get; set; }
        public static int imgPrice { get; set; }
    }
}