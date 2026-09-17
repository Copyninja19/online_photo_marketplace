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
    public partial class favourites : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        string selectimgQuery = "SELECT * FROM favourites WHERE cusid = "+UserInfo.userid;
        public List<Dictionary<string, dynamic>> favouritestab;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = WebConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
            conn = new SqlConnection(query);
            conn.Open();
            fetchfavourites();
        }
        protected void fetchfavourites()
        {
            //query = "SELECT * FROM upimages";
            cmd = new SqlCommand(selectimgQuery, conn);
            try
            {
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    favouritestab = new List<Dictionary<string, dynamic>>();
                    while (reader.Read())
                    {
                        favouritestab.Add(new Dictionary<string, dynamic>
                        {
                            {"favid",reader["favid"] },
                            {"cusid",reader["cusid"] },
                            {"imgid",reader["imgid"] },
                            {"adid",reader["adid"] },
                            {"imgname",reader["imgname"] },
                            {"img",reader["img"] },
                            {"cusname",reader["cusname"] },
                            {"adname",reader["adname"] }
                        });
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
        }
    }
}