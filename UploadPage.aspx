<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHeaderNav.Master" AutoEventWireup="true" CodeBehind="UploadPage.aspx.cs" Inherits="Online_photoGallery_admin.UploadPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="UploadPagecss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input type="hidden" id="delppimgid" runat="server"/>
    <label id="exmsg1" runat="server" style="position: fixed; top: 0px; left: 0px; font-size: 30px; z-index: 10;"></label>
    <input type="hidden" id="updateORupload" runat="server"/>
    <input type="hidden" id="isuploadClicked" runat="server" value="not clicked"/>
    <input type="hidden" id="selectedCat" runat="server"/>
    <div style="display: none;"><asp:Button ID="catSelectBtn" runat="server" Text="" OnClick="catSelectBtn_Click"/></div>
    <%--<asp:Label ID="exmsg" runat="server" style="position: fixed; top: 0px; left: 0px; font-size: 30px; z-index: 10;" Text=""></asp:Label>--%>
    <div class="popupback" id="popupback">
        <div class="viewpopup" id="viewpopup">
            <label id="vpptitle" class="vpptitle"></label>
            <div class="vpptitleimg" id="vpptitleimg"></div>
            <label id="vppimgext" class="vpplbs"></label>
            <label id="vppimgcat" class="vpplbs"></label>
            <label id="vppimgprice" class="vpplbs"></label>
        </div>
    </div>

    <div class="uploadBackDiv" ID="uploadBackDiv" runat="server">

        <div class="uploadPopUp" id="uploadPopUp">
            <input type="hidden" id="imgid" runat="server"/>
            <input type="hidden" id="img" runat="server"/>
            <button class="upPPclsbtn" id="upPPclsbtn" type="button">X</button>
            <div class="imgcontainer">
                <div class="titlediv">
                    <input type="text" class="imgtitle" id="imgtitle" name="imgtitle" runat="server" placeholder="Product Title"/>
                </div>
                <asp:Image ID="image" class="image" runat="server" />
                <div class="fileuploaddiv">
                    <asp:FileUpload ID="FileUpload1" CssClass="fileupload" runat="server" /><%--File Upload control--%>
                    <asp:Button ID="selectimgbtn" class="selectimgbtn" runat="server" Text="Select" OnClick="selectimgbtn_Click" /><%--file upload btn--%>
                </div>
            </div>
            <div class="catgridDiv">
                <asp:Label ID="Label1" CssClass="inputlbs" runat="server" Text="Category"></asp:Label>
                <asp:DropDownList ID="Category" CssClass="inputtxts" runat="server"></asp:DropDownList>
                <button type="button" id="addCategorybtn" class="addCategorybtn">Add New</button>
            </div>
            <div class="inputgriddiv">
                <asp:Label ID="imgext_l" CssClass="inputlbs" runat="server" Text="Extension"></asp:Label>
                <asp:DropDownList ID="imgext" CssClass="inputtxts" runat="server">
                    <asp:ListItem>jpg</asp:ListItem>
                    <asp:ListItem>jpeg</asp:ListItem>
                    <asp:ListItem>png</asp:ListItem>
                    <asp:ListItem>webp</asp:ListItem>
                </asp:DropDownList>
                <%--<asp:TextBox ID="imgext" CssClass="inputtxts" runat="server"></asp:TextBox>--%>
                <asp:Label ID="imgext_m" CssClass="errmsgs" runat="server" Text="*"></asp:Label>
            </div>
            <div class="inputgriddiv">
                <asp:Label ID="imgprice_l" CssClass="inputlbs" runat="server" Text="Price"></asp:Label>
                <asp:TextBox ID="imgprice" CssClass="inputtxts" runat="server" TextMode="Number"></asp:TextBox>
                <asp:Label ID="imgprice_m" CssClass="errmsgs" runat="server" Text="*"></asp:Label>
            </div>
            <button class="updatebtn" style="display: none;" id="uploadbtn1" type="button" runat="server">Upload</button>
            <button class="updatebtn" style="display: none;" id="updatebtn" type="button" runat="server">Update</button>
            <div style="display:none;">
                <asp:Button ID="addimgDBbtn" runat="server" Text="" OnClick="addimgDBbtn_Click"/>
                <asp:Button ID="updateimgDBbtn" runat="server" Text="" OnClick="updateimgDBbtn_Click"/>
            </div>
        </div>
    </div>
    <div class="delppback" id="delppback">
        <div class="delpopup">
            
            <label class="delmsg">
                This Image will Delete Parmanently!
            </label>
            <asp:Button ID="delppbtn" CssClass="delppbtn" runat="server" Text="Delete" OnClick="delppbtn_Click" />
        </div>
    </div>
    <div class="addnewcatBG" id="addnewcatBG">
        <div class="addnewcatPU">
            <button type="button" class="NCCbtn" id="NCCbtn">X</button><%--new category close btn--%>
            <div class="newcathead"><label class="newcatheading">New Category</label></div>
            <div class="NCOG"><%--new category outer grid--%>
                <div class="inputgriddiv">
                    <asp:Label ID="newCat_l" CssClass="inputlbs" runat="server" Text="Category"></asp:Label>
                    <asp:TextBox ID="newCat" CssClass="inputtxts" runat="server"></asp:TextBox>
                    <asp:Label ID="newCat_m" CssClass="errmsgs" runat="server" Text="Error"></asp:Label>
                </div>
            </div>
            <button id="newcatbtn" class="addCategorybtn" type="button">Add</button>
            <div style="display: none;"><asp:Button ID="newcatuploadbtn" runat="server" Text="Button" OnClick="newcatuploadbtn_Click" /></div>
        </div>
    </div>
    <div class="uploadscreen">
        <div class="uploadheader">
            <button type="button" class="upHeaderBtns" id="upbtn">Upload</button>
        </div>
        <div class="contant">
            <div class="upg">
                <div class="blackcover"></div>
                <div class="uploadbanner">
                    <div class="UBheading">
                        <label class="UBH">Share Your Photos to World!</label>
                        <label class="UBHinfotxt">Welcome to PhotoShare, the best place to upload and share your beautiful photos with the world. Whether you are a professional photographer or a hobbyist, you can showcase your talent and creativity on our platform.</label>
                    </div>
                    <div class="UBimg"></div>

                </div>
            </div>
            <div class="CatStrip">
                <%int catcount = 0; %>
                <%foreach(string category in categories) { %>
                <% catcount++;%>
                <button class="catstrbtn" id="catstrbtn<%=catcount%>" type="button"><%= category%></button>
                <script>
                    function getid(ID) { return document.getElementById(ID); }
                    getid("catstrbtn<%=catcount%>").onclick = function () {
                        getid("ContentPlaceHolder1_selectedCat").value = "<%= category%>";
                        getid("ContentPlaceHolder1_catSelectBtn").click();
                    }
                    
                </script>
                <% } %>
            </div>
            <div class="upsechead">
                <label class="upsecheadtext">Your Uploads</label>
            </div>
            
            <div class="imgboxouter">
                <%int rowcount = 0; %>
                <%if (allimagestab != null){%>
                <%foreach (Dictionary<string, dynamic> row in allimagestab){%>
                <%rowcount++; %>
                <div class="imagesbox">
                    <div class="img" id="img<%=rowcount %>"></div>
                    <script>
                        function getid(ID) {
                            return document.getElementById(ID);
                        }
                        getid("img<%=rowcount %>").style = "background-image: url('Images/<%=row["img"].ToString()%>')";
                    </script>
                    <label class="imgboxlbs"><%=row["imgname"] %></label>
                    <button type="button" class="upbtn" id="upimgboxbtn<%=rowcount %>">Update</button>
                    <button type="button" id="viewbtn<%=rowcount%>" class="viewbtn">View</button>
                    <button type="button" id="delbtn<%=rowcount%>" class="delbtn viewbtn">Delete</button>
                </div>
                <script>
                    function getid(ID) { return document.getElementById(ID); }
                    
                    getid("viewbtn<%=rowcount%>").onclick = function () {
                        getid("popupback").style = "display: grid";
                        getid("vpptitle").innerHTML = '<%=row["imgname"]%>';
                        getid("vpptitleimg").style = "background-image: url('Images/<%=row["img"].ToString()%>')";
                        getid("vppimgext").innerHTML = 'Type: <%=row["imgext"]%>';
                        getid("vppimgcat").innerHTML = 'Category: <%=row["imgcat"]%>';
                        getid("vppimgprice").innerHTML = 'Price: <%=row["imgprice"]%>';
                    }
                    getid("upimgboxbtn<%=rowcount %>").onclick = function () {
                        
                        getid("ContentPlaceHolder1_updateORupload").value = "update";
                        getid("ContentPlaceHolder1_uploadBackDiv").style.display = "grid";
                        getid("uploadPopUp").style.animation = "toLeft 0.5s linear";
                        getid("uploadPopUp").style.transform = "translateX(0px)";
                        getid("ContentPlaceHolder1_uploadbtn1").style = "display: none;";
                        getid("ContentPlaceHolder1_updatebtn").style = "display: block;";  

                        getid("ContentPlaceHolder1_imgid").value = '<%=row["imgid"]%>';
                        getid("ContentPlaceHolder1_imgtitle").value = '<%=row["imgname"]%>';
                        getid("ContentPlaceHolder1_img").value = '<%=row["img"].ToString()%>';
                        getid("ContentPlaceHolder1_image").style = "background-image: url('Images/<%=row["img"].ToString()%>')";
                        getid("ContentPlaceHolder1_Category").value = '<%=row["imgcat"]%>';
                        getid("ContentPlaceHolder1_imgext").value = '<%=row["imgext"]%>';
                        getid("ContentPlaceHolder1_imgprice").value = '<%=row["imgprice"]%>';
                    }
                    getid("delbtn<%=rowcount%>").onclick = function () {
                        getid("delppback").style.display = "grid";
                        getid("ContentPlaceHolder1_delppimgid").value = '<%=row["imgid"]%>';
                        
                    }
                    getid("delppback").onclick = function () {
                        getid("delppback").style.display = "none";
                    }
                </script>
                <%}%>
                <%}%>
            </div>
        </div>
    </div>
    <script>
        function getid(ID) {
            return document.getElementById(ID);
        }
        //getid("uploadbtn").style = "display: none;";
        //getid("updatebtn").style = "display: none;";
        getid("popupback").onclick = function () {
            getid("popupback").style = "display: none";
        }
        getid("upbtn").onclick = function () {
            getid("ContentPlaceHolder1_uploadBackDiv").style.display = "grid";
            getid("uploadPopUp").style.animation = "toLeft 0.5s linear";
            getid("uploadPopUp").style.transform = "translateX(0px)";
            getid("ContentPlaceHolder1_uploadbtn1").style = "display: block;";
            getid("ContentPlaceHolder1_updatebtn").style = "display: none;";
            getid("ContentPlaceHolder1_image").style = "background-image: none;";
            getid("ContentPlaceHolder1_updateORupload").value = "upload"; 
        }
        
        getid("upPPclsbtn").onclick = function () {
            getid("uploadPopUp").style.animation = "toBottom 0.5s linear";
            getid("uploadPopUp").style.transform = "translateX(calc(100vw + 400px))";
            const pause = setTimeout(function () {
                getid("ContentPlaceHolder1_uploadBackDiv").style.display = "none";
            }, 500);
            getid("ContentPlaceHolder1_uploadbtn1").style = "display: none;";
            getid("ContentPlaceHolder1_updatebtn").style = "display: none;";

            getid("ContentPlaceHolder1_imgtitle").value = "";
            getid("ContentPlaceHolder1_Category").value = "Nature";
            getid("ContentPlaceHolder1_imgext").value = "";
            getid("ContentPlaceHolder1_imgprice").value = "";
        }
        getid("addCategorybtn").onclick = function () {
            getid("addnewcatBG").style.display = "grid";
        }
        getid("NCCbtn").onclick = function () {
            getid("addnewcatBG").style.display = "none";
        }
        
        var categories = [];
        var catIndex = 0;
        var isCatExist = 0;
        getid("newcatbtn").onclick = function () {
            let isnewcatValid = validation("ContentPlaceHolder1_newCat", /^[A-Za-z0-9_\s]{0,}$/, "Invalid!", true);
            catIndex = 0;
            isCatExist = 0;
            <%foreach(string category in categories) { %>
            categories[catIndex] = "<%= category%>";
            catIndex++;
            <%}%>

            for (let i = 0; i < categories.length; i++) {
                console.log(categories[i].toString().toUpperCase() + " " + getid("ContentPlaceHolder1_newCat").value.toUpperCase() + " " + isCatExist);

                if (categories[i].toUpperCase() == getid("ContentPlaceHolder1_newCat").value.toUpperCase()) {
                    isCatExist++;
                }
            }
            if (isnewcatValid) {
                if (isCatExist != 0) {
                    console.log("Matched");
                    getid("ContentPlaceHolder1_newCat").style = "border: 1px solid red";
                    getid("ContentPlaceHolder1_newCat_m").innerHTML = "Category already exist!";
                    isnewcatValid = false;
                } else {
                    console.log("Not Matched");
                    getid("ContentPlaceHolder1_newCat").style = "border: 1px solid gray";
                    getid("ContentPlaceHolder1_newCat_m").innerHTML = "";
                }
            }
            if (isnewcatValid) {
                getid("ContentPlaceHolder1_newcatuploadbtn").click();
            }
        }
        var imgNameP = /^[A-Za-z0-9_\s]{0,}$/;
        getid("ContentPlaceHolder1_uploadbtn1").onclick = function () {
            let isimgnameValid=true;
            if (getid("ContentPlaceHolder1_imgtitle").value != "") {
                if (imgNameP.test(getid("ContentPlaceHolder1_imgtitle").value)) {
                    console.log("test pass");
                    getid("ContentPlaceHolder1_imgtitle").style = "border: none";
                } else {
                    console.log("test fail");
                    getid("ContentPlaceHolder1_imgtitle").style = "border: 1px solid red";
                    isimgnameValid = false;
                }
            } else {
                getid("ContentPlaceHolder1_imgtitle").placeholder = "Required";
                getid("ContentPlaceHolder1_imgtitle").style = "border: 1px solid red";
                isimgnameValid = false;
            }
            let isimgextValid = validation("ContentPlaceHolder1_imgext",/^[A-Za-z]{0,10}$/,"Invalid!",true);
            let isimgpriceValid = validation("ContentPlaceHolder1_imgprice", /^[0-9]{0,}$/, "Invalid!", true);
            //console.log(isimgnameValid + " " + isimgextValid + " " + isimgpriceValid);
            if (isimgnameValid && isimgextValid && isimgpriceValid) {
                //console.log("page Valid");
                getid("ContentPlaceHolder1_isuploadClicked").value = "clicked";
                getid("ContentPlaceHolder1_addimgDBbtn").click();
            }
        }
        getid("ContentPlaceHolder1_updatebtn").onclick = function () {
            let isimgnameValid = true;
            if (getid("ContentPlaceHolder1_imgtitle").value != "") {
                if (imgNameP.test(getid("ContentPlaceHolder1_imgtitle").value)) {
                    console.log("test pass");
                    getid("ContentPlaceHolder1_imgtitle").style = "border: none";
                } else {
                    console.log("test fail");
                    getid("ContentPlaceHolder1_imgtitle").style = "border: 1px solid red";
                    isimgnameValid = false;
                }
            } else {
                getid("ContentPlaceHolder1_imgtitle").placeholder = "Required";
                getid("ContentPlaceHolder1_imgtitle").style = "border: 1px solid red";
                isimgnameValid = false;
            }
            let isimgextValid = validation("ContentPlaceHolder1_imgext", /^[A-Za-z]{0,10}$/, "Invalid!", true);
            let isimgpriceValid = validation("ContentPlaceHolder1_imgprice", /^[0-9]{0,}$/, "Invalid!", true);
            //console.log(isimgnameValid + " " + isimgextValid + " " + isimgpriceValid);
            if (isimgnameValid && isimgextValid && isimgpriceValid) {
                getid("ContentPlaceHolder1_updateimgDBbtn").click();
            }
        }
        
        function validation(fieldid, regx, message, required = false) {
            field = getid(fieldid);
            if (field.value == "" && required) {
                getid(fieldid + "_m").innerHTML = "Required!";
                field.style = "border: 1px solid red;";
                return false;
            }
            else if (regx.test(field.value)) {
                getid(fieldid + "_m").innerHTML = "";
                field.style = "border: 1px solid gray;";
                return true;
            }
            else {
                getid(fieldid + "_m").innerHTML = message;
                field.style = "border:1px solid  gray;";
                return false;
            }
        }
    </script>
    
</asp:Content>
