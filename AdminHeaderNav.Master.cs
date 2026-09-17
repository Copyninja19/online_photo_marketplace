using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_photoGallery_admin
{
    public partial class AdminHeaderNav : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadPage.aspx");
        }

        

        protected void logbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("signupPage.aspx");
        }
    }
}