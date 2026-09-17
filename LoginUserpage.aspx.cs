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
    public partial class LoginUserpage : System.Web.UI.Page
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
            query = "select * from userreg  where email = @value1 and pass = @value2";
            using (cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@value1", email.Text.ToString());
                cmd.Parameters.AddWithValue("@value2", pass.Text.ToString());

                using (reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        //fillUser();
                        UserInfo.userid = Convert.ToInt32(reader["userid"].ToString());
                        UserInfo.name = reader["username"].ToString();
                        UserInfo.email = reader["email"].ToString();
                        UserInfo.password = reader["pass"].ToString();
                        //Response.Write(reader["userid"].ToString() + "->" + reader["username"].ToString() + "->" + reader["email"].ToString() + "->" + reader["pass"].ToString());
                        Response.Redirect("UserHome.aspx");
                    }
                }
            }
        }
        //protected void fillUser()
        //{
        //    reader
        //    try
        //    {
        //        query = "select * from userreg  where email = @value1 and pass = @value2";
        //        using(cmd = new SqlCommand(query, conn))
        //        {
        //            cmd.Parameters.AddWithValue("@value1", email.Text.ToString());
        //            cmd.Parameters.AddWithValue("@value2", pass.Text.ToString());
        //            using (reader = cmd.ExecuteReader())
        //            {
        //                if (reader.Read())
        //                {
        //                    Response.Write(reader["userid"].ToString() + "->" + reader["username"].ToString() + "->" + reader["email"].ToString() + "->" + reader["pass"].ToString());
        //                    UserInfo.userid = Convert.ToInt32(reader["userid"].ToString());
        //                    UserInfo.name = reader["username"].ToString();
        //                    UserInfo.email = reader["email"].ToString();
        //                    UserInfo.password = reader["pass"].ToString();
        //                }
        //            }
        //        }
                
        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), ex.Message, "alert('"+ex.Message+"')", true);
        //    }
            
        //}
    }
}