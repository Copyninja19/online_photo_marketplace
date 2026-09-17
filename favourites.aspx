<%@ Page Title="" Language="C#" MasterPageFile="~/UserHeaderNav.Master" AutoEventWireup="true" CodeBehind="favourites.aspx.cs" Inherits="Online_photoGallery_admin.favourites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="favourites_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <button class="viewclsbtn" id="viewdetailclsbtn" type="button">X</button>
            </div>
            <div class="reviewhead">Reviews</div>
            <div class="reviewgrid">
                <label id="cusname">Shubham</label>
                <label id="cusrating">Good</label>
                <label id="cusreview">Very nice photo</label>
            </div>
        </div>
    </div>
</div>
    <div class="main">
    <div class="favherader">
    <h1>Your Favourites</h1>
    </div>
            <div class="imgboxouter">
            <%int rowcount1 = 0;%>
            <%if (favouritestab != null)
                {%>
            <%foreach (Dictionary<string, dynamic> row in favouritestab)
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
                <%--<button type="button" class="upbtn" id="favimgboxbtn<%=rowcount1%>">Favourit</button>
                <button type="button" id="viewbtn<%=rowcount1%>" class="viewbtn">View</button>
                <button type="button" id="delbtn<%=rowcount1%>" class="delbtn viewbtn">Purchase</button>--%>
            </div>
            <script>
                function getid(ID) { return document.getElementById(ID); }

                getid("viewbtn<%=rowcount1%>").onclick = function () {
                    getid("viewback").style = "display: grid;";
                    getid("viewimg").style = "background-image:url(Images/<%=row["img"]%>);";
                    getid("imagename").innerHTML = "<%=row["imgname"]%>";
                    
                }
                getid("favimgboxbtn<%=rowcount1%>").onclick = function () {
                    
                    getid("ContentPlaceHolder1_imgid").value = "<%=row["imgid"]%>";
                    console.log(getid("ContentPlaceHolder1_imgid").value);
                    getid("ContentPlaceHolder1_adid").value = "<%=row["adid"]%>";
                    console.log(getid("ContentPlaceHolder1_adid").value);
                    getid("ContentPlaceHolder1_imgname").value = "<%=row["imgname"]%>";
                    console.log(getid("ContentPlaceHolder1_imgname").value);



                    getid("ContentPlaceHolder1_favimgboxbtnHidden").click();
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
    

 <script>
     function getid(ID) { return document.getElementById(ID); }
     getid("viewclsbtn").onclick = function () {
         getid("viewback").style = "display: none;";
     }
     getid("viewdetailbtn").onclick = function () {
         getid("viewdetailspopup").style = "transform:scale(1);";
     }
     //getid("viewback").onclick = function () {
     //    getid("viewdetailspopup").style = "transform:scale(0);";
     //}
     getid("viewdetailclsbtn").onclick = function () {
         getid("viewdetailspopup").style = "transform:scale(0);";
     }
 </script>
</asp:Content>
