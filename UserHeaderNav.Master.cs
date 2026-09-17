using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_photoGallery_admin
{
    public partial class UserHeaderNav : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void logbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpPageUser.aspx");
        }

        protected void feedbackbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Feedback.aspx");
        }

        protected void favouritsbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("favourites.aspx");
        }

        protected void dashbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {
            string searchText = searchinput.Value.ToString();

            StaticValues.selectimgQuery = $"SELECT * FROM upimages WHERE imgname LIKE '{searchText}'";

        }
    }
}