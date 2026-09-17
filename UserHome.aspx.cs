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
    public partial class UserHome : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        //string selectimgQuery ="";
        
        public List<Dictionary<string, dynamic>> allimagestab;
        public List<string> categories = new List<string>();
        public List<Dictionary<string, dynamic>> feedbacks = new List<Dictionary<string, dynamic>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            query = WebConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
            conn = new SqlConnection(query);
            conn.Open();
            if (!IsPostBack)
            {
                categories.Clear();
                fetchCategory();
            }
            fetchimagesdata();
            fetchfeedbacks();

            //allimagestab.Clear();
            fetchimagesdata();
            categories.Clear();
            fetchCategory();
        }
        protected void fetchCategory()
        {
            query = "SELECT * FROM categories";
            cmd = new SqlCommand(query, conn);
            reader = cmd.ExecuteReader();
            categories.Add("All");
            while (reader.Read())
            {
                categories.Add(reader["category"].ToString());
            }
            reader.Close();
        }
        protected void fetchimagesdata()
        {
            //query = "SELECT * FROM upimages";
            cmd = new SqlCommand(StaticValues.selectimgQuery, conn);
            try
            {
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    allimagestab = new List<Dictionary<string, dynamic>>();
                    while (reader.Read())
                    {
                        allimagestab.Add(new Dictionary<string, dynamic>
                        {
                            {"imgid",reader["imgid"] },
                            {"imgname",reader["imgname"] },
                            {"imgext",reader["imgext"] },
                            {"img",reader["img"] },
                            {"imgcat",reader["imgcat"] },
                            {"imgprice",reader["imgprice"] },
                            {"adid",reader["adid"] }
                        });
                    }
                }
                else
                {

                }
                reader.Close();
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
        }

        protected void catSelectBtn_Click(object sender, EventArgs e)
        {
            if (selectedCat.Value.ToString() != "All")
            {
                StaticValues.selectimgQuery = "SELECT * FROM upimages WHERE imgcat = '" + selectedCat.Value.ToString() + "'";
                //allimagestab.Clear();
                fetchimagesdata();
                categories.Clear();
                fetchCategory();
            }
            else
            {
                StaticValues.selectimgQuery = "SELECT * FROM upimages";
                //allimagestab.Clear();
                fetchimagesdata();
                categories.Clear();
                fetchCategory();
            }

        }

        protected void favimgboxbtnHidden_Click(object sender, EventArgs e)
        {
            try
            {
                string adminName = "";
                query = "SELECT fname FROM adminreg WHERE adid = @v1";
                using (cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", Convert.ToInt32(adid.Value));
                    using (reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                adminName = reader["fname"].ToString();
                            }
                        }
                    }
                }

                query = "INSERT INTO favourites (cusid, imgid, adid, imgname, cusname, adname, img) VALUES(@v1,@v2,@v3,@v4,@v5,@v6,@v7)";
                using (cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@v1", UserInfo.userid);
                    cmd.Parameters.AddWithValue("@v2", Convert.ToInt32(imgid.Value));
                    cmd.Parameters.AddWithValue("@v3", Convert.ToInt32(adid.Value));
                    cmd.Parameters.AddWithValue("@v4", imgname.Value.ToString());
                    if (!string.IsNullOrEmpty(UserInfo.name))
                    {
                        cmd.Parameters.AddWithValue("@v5", UserInfo.name);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@v5", "");
                    }

                    cmd.Parameters.AddWithValue("@v6", adminName);
                    cmd.Parameters.AddWithValue("@v7", img.Value.ToString());
                    cmd.ExecuteNonQuery();
                }
                categories.Clear();
                fetchCategory();

            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message + " -> " + ex.StackTrace+" -> "+ex.TargetSite;
            }
        }
        protected void fetchfeedbacks()
        {
            query = "SELECT * FROM feedback";
            cmd = new SqlCommand(query, conn);
            try
            {
                using (reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        feedbacks = new List<Dictionary<string, dynamic>>();

                        while (reader.Read())
                        {
                            feedbacks.Add(new Dictionary<string, dynamic>
                            {
                                {"adid", reader["adid"] },
                                {"userid", reader["userid"] },
                                {"imgid", reader["imgid"] },
                                {"imgname", reader["imgname"] },
                                {"img" ,reader["img"] },
                                {"username", reader["username"] },
                                {"review", reader["review"] },
                                {"rating", reader["rating"] }
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
        }

        protected void addreview_Click(object sender, EventArgs e)
        {
            try
            {

                //string adminName = "";
                //query = "SELECT adname FROM favourites WHERE adid = @v1";
                //using (cmd = new SqlCommand(query, conn))
                //{
                //    cmd.Parameters.AddWithValue("@v1", Convert.ToInt32(adid.Value.ToString()));
                //    using (reader = cmd.ExecuteReader())
                //    {
                //        if (reader.HasRows)
                //        {
                //            while (reader.Read())
                //            {
                //                adminName = reader["adname"].ToString();
                //            }
                //        }
                //    }
                //}
                query = "INSERT INTO feedback (adid, userid, imgid, imgname, img, username, review, rating) " +
                        "VALUES (@v1, @v2, @v3, @v4, @v5, @v6, @v7, @v8)";
                using (cmd = new SqlCommand(query, conn))
                {
                    
                    cmd.Parameters.AddWithValue("@v1", Convert.ToInt32(adid.Value.ToString()));
                    cmd.Parameters.AddWithValue("@v2", UserInfo.userid);
                    cmd.Parameters.AddWithValue("@v3", Convert.ToInt32(imgid.Value));
                    cmd.Parameters.AddWithValue("@v4", imgname.Value.ToString());
                    cmd.Parameters.AddWithValue("@v5", img.Value.ToString());
                    cmd.Parameters.AddWithValue("@v6", UserInfo.name);
                    cmd.Parameters.AddWithValue("@v7", cusreview.Value.ToString());
                    cmd.Parameters.AddWithValue("@v8", Request.Form["rating"].ToString());
                    cmd.ExecuteNonQuery();

                    feedbacks.Clear();
                    fetchfeedbacks();

                    categories.Clear();
                    fetchCategory();
                }
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = "addreview_Click"+ex.Message+" => "+ex.StackTrace+" => "+ex.TargetSite+" => "+ adid.Value;
            }
        }

        protected void purBtnHidden_Click(object sender, EventArgs e)
        {
            int adID = Convert.ToInt32(adid.Value);
            int ImageID = Convert.ToInt32(imgid.Value);
            StaticValues.ImgID = ImageID;
            StaticValues.AdId = adID;
            StaticValues.imgPrice = Convert.ToInt32(imgprice.Value);
            Response.Redirect("payment.aspx");
        }
    }
}
            