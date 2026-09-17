<%@ Page Title="" Language="C#" MasterPageFile="~/UserHeaderNav.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Online_photoGallery_admin.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="UserHome_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input type="hidden" id="selectedCat" runat="server" />
    <input type="hidden" id="imgid" runat="server" />
    <input type="hidden" id="adid" runat="server" />
    <input type="hidden" id="img" runat="server" />
    <input type="hidden" id="imgname" runat="server" />
    <input type="hidden" id="adminName" runat="server" />
    <input type="hidden" id="imgprice" runat="server" />
    
    <div style="display: none;">
        <asp:Button ID="catSelectBtn" runat="server" Text="" OnClick="catSelectBtn_Click"/>
        <asp:Button ID="favimgboxbtnHidden" runat="server" Text="" OnClick="favimgboxbtnHidden_Click" />
        <asp:Button ID="purBtnHidden" runat="server" Text="Button" OnClick="purBtnHidden_Click"/>
    </div>
        <%--<input type="hidden" id="selectedcat" runat="server"/>--%>
    <label id="exmsg1" runat="server" style="position: fixed; top: 0px; left: 0px; font-size: 30px; z-index: 10;"></label>
    <div class="viewback" id="viewback">
        <div class="viewimg" id="viewimg">
            <button class="viewclsbtn" id="viewclsbtn" type="button">X</button>
            <button class="viewdetailbtn" id="viewdetailbtn" type="button">View Details</button>
            <div class="viewdetailspopup" id="viewdetailspopup">
                <div class="imagedetails" id="imagedetails">
                    <label>Name:</label>
                    <label id="imagename"></label>
                    <label>Category:</label>
                    <label id="categoryname"></label>
                    <label>Extension:</label>
                    <label id="extname"></label>
                    <label>price:</label>
                    <label id="imageprice"></label>
                    <button class="viewclsbtn" id="viewdetailclsbtn" type="button">X</button>
                </div>
                <div class="reviewhead">Reviews</div>
                <div class="givereview">
                    <label id="cusname"><%=Online_photoGallery_admin.UserInfo.name%></label>
                    <div class="radiobuttons">
                        <label>Bad</label>
                        <input type="radio" class="radios" value="Bad" name="rating"/>

                        <label>Good</label>
                        <input type="radio" class="radios" value="Good" name="rating" />

                        <label>Excellent</label>
                        <input type="radio" class="radios" value="Excellent" name="rating" />
                    </div>
                    <textarea class="review"  id="cusreview" runat="server"></textarea>
                    <%--<button type="button" class="reviewbtn" id="revbtn">Submit</button>--%>
                    <asp:Button ID="addreview" CssClass="reviewbtn" runat="server" Text="Submit" OnClick="addreview_Click" />
                </div>

                <%--<div style="display: none;">
                    
                    </div>--%>
                <%--<%foreach(var row in feedbacks) {%>
                <div class="reviewgrid">
                    <label><%=row["username"]%></label>
                    <label><%=row["rating"]%></label>
                    <label ><%=row["review"] %></label>
                </div>
                <%}%>--%>
                
            </div>
        </div>
    </div>
    <div class="uploadscreen">
        <%--<div class="uploadheader">
           <button type="button" class="upHeaderBtns" id="upbtn">Upload</button>
       </div>--%>
        
        <div class="CatStrip">
            <%int catcount = 0; %>
            <%foreach (string category in categories)
                { %>
            <% catcount++;%>
            <button class="catstrbtn" id="catstrbtn<%=catcount%>" type="button"><%=category.ToString() %></button>
            <script>
                function getid(ID) { return document.getElementById(ID); }
                getid("catstrbtn<%=catcount%>").onclick = function () {
                    getid("ContentPlaceHolder1_selectedCat").value = "<%= category.ToString()%>";
                    
                    getid("ContentPlaceHolder1_catSelectBtn").click();
                }

            </script>
            <% } %>
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

            <div class="imgboxouter">
                <%int rowcount1 = 0;%>
                <%if (allimagestab != null)
                    {%>
                <%foreach (Dictionary<string, dynamic> row in allimagestab)
                    {%>
                <%rowcount1++;%>
                <div class="imagesbox">
                    <div class="img" id="img<%=rowcount1%>"></div>
                    <script>
                        function getid(ID) {
                            return document.getElementById(ID);
                        }
                        getid("img<%=rowcount1%>").style = "background-image: url('Images/<%=row["img"].ToString()%>')";
                    </script>
                    <label class="imgboxlbs"><%=row["imgname"] %></label>
                    <button type="button" class="favbtn" id="favimgboxbtn<%=rowcount1%>">Favourit</button>
                    <button type="button" id="viewbtn<%=rowcount1%>" class="viewbtn">View</button>
                    <button type="button" id="purbtn<%=rowcount1%>" class="delbtn viewbtn">Purchase</button>
                </div>
                <script>
                    function getid(ID) { return document.getElementById(ID); }

                    getid("viewbtn<%=rowcount1%>").onclick = function () {
                        getid("viewback").style = "display: grid;";
                        getid("viewimg").style = "background-image:url(Images/<%=row["img"]%>);";
                        getid("imagename").innerHTML = "<%=row["imgname"]%>";
                        getid("categoryname").innerHTML = "<%=row["imgcat"]%>";
                        getid("extname").innerHTML = "<%=row["imgext"]%>";
                        getid("imageprice").innerHTML = "<%=row["imgprice"]%>"

                        getid("ContentPlaceHolder1_imgid").value = "<%=row["imgid"]%>";
                        console.log(getid("ContentPlaceHolder1_imgid").value);
                        getid("ContentPlaceHolder1_adid").value = "<%=row["adid"]%>";
                        console.log(getid("ContentPlaceHolder1_adid").value);
                        getid("ContentPlaceHolder1_imgname").value = "<%=row["imgname"]%>";
                        console.log(getid("ContentPlaceHolder1_imgname").value);
                        getid("ContentPlaceHolder1_img").value = "<%=row["img"]%>";

                        let reviewgrids = document.getElementsByClassName("reviewgrid");

                        for (let i = 0; i < reviewgrids.length; i++) {
                            let rg = reviewgrids[i];
                            getid("viewdetailspopup").removeChild(rg);
                        }
                        for (let i = 0; i < reviewgrids.length; i++) {
                            let rg = reviewgrids[i];
                            getid("viewdetailspopup").removeChild(rg);
                        }
                        var feedbacks = [];
                        <%foreach(var feedback in feedbacks) { %>
                        feedbacks.push({
                            "username": "<%=feedback["username"]%>",
                            "rating": "<%=feedback["rating"]%>",
                            "review": "<%=feedback["review"]%>",
                            "imgname": "<%=feedback["imgname"]%>",
                        });
                        <%}%>
                        var filterdFeedbacks = feedbacks.filter(obj => obj.imgname == "<%=row["imgname"]%>");

                        for (let i = 0; i < filterdFeedbacks.length; i++) {
                            let ffeedback = filterdFeedbacks[i];
                            let reviewgrid = document.createElement("div"); reviewgrid.setAttribute("class", "reviewgrid");
                            getid("viewdetailspopup").appendChild(reviewgrid);

                            let lable1 = document.createElement("label"); lable1.innerHTML = ffeedback["username"];
                            let lable2 = document.createElement("label"); lable2.innerHTML = ffeedback["rating"];
                            let lable3 = document.createElement("label"); lable3.innerHTML = ffeedback["review"];
                            reviewgrid.appendChild(lable1); reviewgrid.appendChild(lable2); reviewgrid.appendChild(lable3);
                        }
                    }
                    getid("favimgboxbtn<%=rowcount1%>").onclick = function () {

                        getid("ContentPlaceHolder1_imgid").value = "<%=row["imgid"]%>";
                        console.log(getid("ContentPlaceHolder1_imgid").value);
                        getid("ContentPlaceHolder1_adid").value = "<%=row["adid"]%>";
                        console.log(getid("ContentPlaceHolder1_adid").value);
                        getid("ContentPlaceHolder1_imgname").value = "<%=row["imgname"]%>";
                        console.log(getid("ContentPlaceHolder1_imgname").value);
                        getid("ContentPlaceHolder1_img").value = "<%=row["img"]%>"; 
                        
                        getid("ContentPlaceHolder1_favimgboxbtnHidden").click();
                    }
                    getid("viewdetailbtn").onclick = function () {
                        
                        getid("viewdetailspopup").style = "transform:scale(1);";
                    }

                    getid("purbtn<%=rowcount1%>").onclick = function () {
                        getid("ContentPlaceHolder1_imgid").value = "<%=row["imgid"]%>";
                        getid("ContentPlaceHolder1_adid").value = "<%=row["adid"]%>";
                        getid("ContentPlaceHolder1_imgprice").value = "<%=row["imgprice"]%>";
                        getid("ContentPlaceHolder1_purBtnHidden").click();
                    }
                    <%--getid("delbtn<%=rowcount%>").onclick = function () {
                        getid("delppback").style.display = "grid";
                        getid("ContentPlaceHolder1_delppimgid").value = '<%=row["imgid"]%>';

                    }
                    getid("delppback").onclick = function () {
                        getid("delppback").style.display = "none";
                    }--%>
                </script>
                <%}%>
                <%}%>
            </div>
        </div>
    </div>
    <script>
        function getid(ID) { return document.getElementById(ID); }
        getid("viewclsbtn").onclick = function () {
            getid("viewback").style = "display: none;";            
        }
        
        //getid("viewback").onclick = function () {
        //    getid("viewdetailspopup").style = "transform:scale(0);";
        //}
        getid("viewdetailclsbtn").onclick = function () {
            getid("viewdetailspopup").style = "transform:scale(0);";
        }
    </script>
</asp:Content>

