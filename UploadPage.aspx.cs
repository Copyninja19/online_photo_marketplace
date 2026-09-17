using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace Online_photoGallery_admin
{
    public partial class UploadPage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string query;
        string selectimgQuery = "SELECT * FROM upimages WHERE adid = "+Admin.adid;
        bool showPopup = false;
        string imgname;
        public List<string> categories = new List<string>();
        public List<Dictionary<string,dynamic>> allimagestab;
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
                Category.Items.Add(reader["category"].ToString());
            }
            reader.Close();
        }
        protected void fetchimagesdata()
        {
            //query = "SELECT * FROM upimages";
            cmd = new SqlCommand(selectimgQuery, conn);
            try
            {
                reader = cmd.ExecuteReader();
                if(reader.HasRows)
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
            }catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
        }
        protected void selectimgbtn_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                //string folderPath = Server.MapPath("~/Images/");
                //string filePath = folderPath + fileName;

                FileUpload1.SaveAs("C:\\Users\\shubham\\source\\repos\\Online_photoGallery\\Online_photoGallery_admin\\Images\\"+FileUpload1.FileName.ToString());

                image.ImageUrl = "Images/"+FileUpload1.FileName.ToString();
                StaticValues.uloadImgName = FileUpload1.FileName.ToString();
                img.Value = FileUpload1.FileName.ToString();
                //uploadBackDiv.Style["display"] = "grid";
                showPopup = true;
                if (updateORupload.Value == "upload")
                {
                    uploadbtn1.Style["display"] = "block";
                    updatebtn.Style["display"] = "none";
                }
                else if (updateORupload.Value == "update")
                {
                    updatebtn.Style["display"] = "block";
                    uploadbtn1.Style["display"] = "none";
                }
            }
            categories.Clear();
            Category.Items.Clear();
            fetchCategory();
        }

        protected void newcatuploadbtn_Click(object sender, EventArgs e)
        {
            query = "INSERT INTO categories (category) VALUES(@v1)";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@v1", newCat.Text.ToString());
            try
            {   
                cmd.ExecuteNonQuery();
            }catch(Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
            Category.Items.Clear();
            categories.Clear();
            fetchCategory();
        }


        protected void addimgDBbtn_Click(object sender, EventArgs e)
        {
            if(isuploadClicked.Value == "clicked")
            {
                query = "INSERT INTO upimages (imgname,imgext,img,imgcat,imgprice,adid) VALUES(@v1,@v2,@v3,@v4,@v5,@v6)";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@v1", imgtitle.Value.ToString());
                cmd.Parameters.AddWithValue("@v2", imgext.Text.ToString());
                cmd.Parameters.AddWithValue("@v3", StaticValues.uloadImgName);
                cmd.Parameters.AddWithValue("@v4", Category.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@v5", imgprice.Text.ToString());
                cmd.Parameters.AddWithValue("@v6", Admin.adid);

                try
                {
                    cmd.ExecuteNonQuery();
                    fetchimagesdata();
                }
                catch (Exception ex)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), ex.Message, "alert("+ ex.Message ")", true);
                    exmsg1.InnerText = ex.Message;
                }
            }
            Category.Items.Clear();
            categories.Clear();
            fetchCategory();
        }
        protected void updateimgDBbtn_Click(object sender, EventArgs e)
        {
            try
            {
                query = "UPDATE upimages SET imgname = @val1, imgext = @val2, img = @val3, imgcat = @val4, imgprice = @val5 WHERE imgid = @val6";
                using(cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@val1", imgtitle.Value.ToString());
                    cmd.Parameters.AddWithValue("@val2", imgext.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@val3",img.Value.ToString());
                    cmd.Parameters.AddWithValue("@val4", Category.SelectedValue.ToString() );
                    cmd.Parameters.AddWithValue("@val5",imgprice.Text.ToString());  
                    cmd.Parameters.AddWithValue("@val6",imgid.Value.ToString());

                    cmd.ExecuteNonQuery();
                    allimagestab.Clear();
                    fetchimagesdata();

                    Category.Items.Clear();
                    categories.Clear();
                    fetchCategory();
                }
            }catch(Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }
        }

        protected void delppbtn_Click(object sender, EventArgs e)
        {
            try
            {
                query = "DELETE FROM upimages WHERE imgid = @val1";
                using (cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@val1", delppimgid.Value.ToString());

                    cmd.ExecuteNonQuery();
                    allimagestab.Clear();
                    fetchimagesdata();
                }
            }
            catch (Exception ex)
            {
                exmsg1.InnerText = ex.Message;
            }

        }

        protected void catSelectBtn_Click(object sender, EventArgs e)
        {
            //updatebtn.Style["display"] = "none";
            //uploadbtn1.Style["display"] = "none";
            if (selectedCat.Value.ToString() != "All")
            {
                selectimgQuery = "SELECT * FROM upimages WHERE imgcat = '" + selectedCat.Value.ToString() + "' AND adid = "+ Admin.adid;
            }
            else
            {
                selectimgQuery = "SELECT * FROM upimages WHERE adid = "+Admin.adid;
            }
            
            allimagestab.Clear();
            fetchimagesdata();
            categories.Clear();
            fetchCategory();
        }
    }
}