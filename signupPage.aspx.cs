using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Online_photoGallery_admin
{
    public partial class signupPage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
            conn = new SqlConnection(query);
        }

        protected void storeDataBtn_Click(object sender, EventArgs e)
        {
            conn.Open();
            query = ("insert into adminreg (fname, lname, Email, pass) values(@First_name,@Last_name,@Email_id,@password)");
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@First_Name", fname.Text.ToString());
            cmd.Parameters.AddWithValue("@Last_Name", lname.Text.ToString());
            cmd.Parameters.AddWithValue("@Email_Id", email.Text.ToString());
            cmd.Parameters.AddWithValue("@password", pass.Text.ToString());
            try
            {
                cmd.ExecuteNonQuery();
                fillAdmin();
                Response.Redirect("UploadPage.aspx");
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), ex.Message, "alert('Record Inserted Successfully')", true);
            }
            conn.Close();
        }
        protected void fillAdmin()
        {
            query = "SELECT * FROM adminreg WHERE email = '"+ email.Text.ToString() + "' and pass = '"+ pass.Text.ToString() + "'";
            cmd = new SqlCommand(query, conn);
            try
            {
                reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    Admin.adid =Convert.ToInt32(reader["adid"]);
                    Admin.fname =reader["fname"].ToString();
                    Admin.lname = reader["lname"].ToString();
                    Admin.email = reader["email"].ToString();
                    Admin.pass = reader["pass"].ToString();
                }
            }catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), ex.Message, "alert('Record Inserted Successfully')", true);
            }
            reader.Close();
        }
        protected void logbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginPage.aspx");
        }
    }
}