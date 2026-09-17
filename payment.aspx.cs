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
    public partial class payment : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {

            query = WebConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
            conn = new SqlConnection(query);

            amount.Text = StaticValues.imgPrice.ToString();
        }

        protected void sbbtn_Click(object sender, EventArgs e)
        {
            
            conn.Open();
            cmd = new SqlCommand(query, conn);
            //reader = cmd.ExecuteReader();
            int AdId = StaticValues.AdId;
            int ImageID = StaticValues.ImgID;
            string imageName = "";
            string cusname = UserInfo.name;
            int cusid = UserInfo.userid;

            string cradholder = cname.Text.ToString();
            string cnumber = cardn.Text.ToString();
            DateTime expiry = Convert.ToDateTime(Request.Form["expiry"].ToString());
            string cvv1 = cvv.Text.ToString();
            DateTime Payment = Convert.ToDateTime(Request.Form["Payment"].ToString());
            int amount1 = Convert.ToInt32(amount.Text);
            query = $"SELECT * FROM upimages WHERE imgid = {ImageID}";
            using(cmd = new SqlCommand(query, conn))
            {
                using(reader = cmd.ExecuteReader())
                {
                    if(reader.HasRows)
                    {
                        while(reader.Read()) { 
                            imageName = reader["imgname"].ToString();
                        }
                    }
                }
            }
            
            query = "INSERT INTO payment (cradholder,cnumber,expirydate,cvv,paymentdate,amount,adid,cusid,imgid,cusname,imgname) VALUES(@v1,@v2,@v3,@v4,@v5,@v6,@v7,@v8,@v9,@v10,@v11)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@v1", cradholder);
            cmd.Parameters.AddWithValue("@v2", cnumber);
            cmd.Parameters.AddWithValue("@v3", expiry);
            cmd.Parameters.AddWithValue("@v4", cvv1);
            cmd.Parameters.AddWithValue("@v5", Payment);
            cmd.Parameters.AddWithValue("@v6", amount1);
            cmd.Parameters.AddWithValue("@v7", AdId);
            cmd.Parameters.AddWithValue("@v8",cusid);
            cmd.Parameters.AddWithValue("@v9", ImageID);
            cmd.Parameters.AddWithValue("@v10", cusname);
            cmd.Parameters.AddWithValue("@v11", imageName);


            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message + " -> " + ex.StackTrace + " -> " + ex.TargetSite;
            }
            //conn.Close();
        }
    }
}