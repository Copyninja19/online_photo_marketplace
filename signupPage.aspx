<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signupPage.aspx.cs" Inherits="Online_photoGallery_admin.signupPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="signupPage_css.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
                <div class="mother">
            
            <div class="blurbg"></div>
            <div class="header">
                <h1>Online PhotoGallery</h1>
                <asp:Button ID="logbtn" CssClass="logbtn" runat="server" Text="Login" OnClick="logbtn_Click" />
            </div>
            <div class="division2">
             <div class="container">
                    <div class="info">
                        <label class="infoheading">Online Photo Gallery: A Community for Online Photography</label>
                        <label class="infoPara">Online Photo Gallery is a web platform that connects photographers and photo buyers from around the world. You can upload, sell, search, and buy photos from various categories, and interact with other users. Online Photo Gallery is easy, secure, and convenient. Join today and explore the beauty of online photography!</label>
                        <div class="darkbg"></div>
                    </div>
                 <div class="signfrmouter">
                    <div class="signfrm">
                        <h2>SignUp</h2>
                        <div class="fieldouters">
                            <asp:Label ID="fname_l" runat="server" Text="First Name"></asp:Label>
                            <asp:TextBox ID="fname" runat="server" CssClass="sngtxts"></asp:TextBox>
                            <asp:Label ID="fname_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                        </div>
                        <div class="fieldouters">
                            <asp:Label ID="lname_l" runat="server" Text="Last Name"></asp:Label>
                            <asp:TextBox ID="lname" runat="server" CssClass="sngtxts"></asp:TextBox>
                            <asp:Label ID="lname_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                        </div>
                        <div class="fieldouters">
                            <asp:Label ID="email_l" runat="server" Text="Email_Id"></asp:Label>
                            <asp:TextBox ID="email" runat="server" CssClass="sngtxts" TextMode="Email"></asp:TextBox>
                            <asp:Label ID="email_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                        </div>
                        <div class="fieldouters">
                            <asp:Label ID="pass_l" runat="server" Text="Password"></asp:Label>
                            <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="sngtxts"></asp:TextBox>
                            <asp:Label ID="pass_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                        </div>
                        <button type="button" class="sngbtn" id="sngbtn">Sign Up</button>
                        <div style="display: none;"><asp:Button ID="storeDataBtn" runat="server" Text="Singup" Height="80px" Width="259px" OnClick="storeDataBtn_Click" /></div>
                        

                        
                    </div>

                </div>
            </div>
            </div>
            
            
        </div>
    </form>
    <script>
        function getid(id) {
            return document.getElementById(id);
        }
        getid("sngbtn").onclick = function () {
            let fnameValid = validation("fname", /^[A-Za-z]{0,}$/, "Invalid value!", true);
            let lnameValid = validation("lname", /^[A-Za-z]{0,}$/, "Invalid value!", true);
            let emailValid = validation("email", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "Invalid Email!", true);
            let passValid = validation("pass", /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,20}$/, "Too Weak Password", true);

            if (fnameValid && lnameValid && emailValid && passValid) {
                getid("storeDataBtn").click();
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
                getid(fieldid + "_m"). innerHTML = message;
                field.style = "border:1px solid  gray;";
                return false;
            }
        }
    </script>
</body>
</html>
