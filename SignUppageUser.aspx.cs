using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Xml.Linq;

namespace Online_photoGallery_admin
{
    public partial class SignUppageUser : System.Web.UI.Page
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
            query = "insert into userreg (username, email, pass) values(@Name,@Email ,@password)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", name.Text.ToString());
            cmd.Parameters.AddWithValue("@Email", email.Text.ToString());
            cmd.Parameters.AddWithValue("@password", pass.Text.ToString());
            try
            {
                cmd.ExecuteNonQuery();
                fillUser();
                Response.Redirect("UserHome.aspx");
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
            conn.Close();
        }
        protected void fillUser()
        {
            query = "SELECT * FROM userreg WHERE email = '" + email.Text.ToString() + "' and pass = '" + pass.Text.ToString() + "'";
            cmd = new SqlCommand(query, conn);
            try
            {
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    UserInfo.userid = Convert.ToInt32(reader["userid"]);
                    UserInfo.name = reader["username"].ToString();
                    UserInfo.email = reader["email"].ToString();
                    UserInfo.password = reader["pass"].ToString();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), ex.Message, "alert('Record Inserted Successfully')", true);
            }
            reader.Close();
        }


        protected void logbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginUserpage.aspx");
        }

    }
}
    
