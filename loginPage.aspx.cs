using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace Online_photoGallery_admin
{
    public partial class loginPage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
            conn = new SqlConnection(query);
            conn.Open();
        }

        protected void checkDataBtn_Click(object sender, EventArgs e)
        {
            query = "Select * from adminreg  where email = @value1 and pass = @value2";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@value1", email.Text.ToString());
            cmd.Parameters.AddWithValue("@value2", pass.Text.ToString());
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Admin.adid = Convert.ToInt32(reader["adid"]);
                Admin.fname = reader["fname"].ToString();
                Admin.lname = reader["lname"].ToString();
                Admin.email = reader["email"].ToString();
                Admin.pass = reader["pass"].ToString();
                Response.Redirect("UploadPage.aspx");
            }
            
        }
    }
}