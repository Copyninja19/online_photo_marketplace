<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUppageUser.aspx.cs" Inherits="Online_photoGallery_admin.SignUppageUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Singup</title>
    <link href="Signuppagecss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="outer-box">
            <label id="exmsg1" runat="server" style="position: fixed; top: 0px; left: 0px; font-size: 30px; z-index: 10;"></label>
            <div class="heading">
                <h2>Online PhotoGallery</h2>
                <asp:Button ID="logbtn" CssClass="logbtn" runat="server" Text="Login" OnClick="logbtn_Click" />
            </div>

            <div class="inner-box">
                <div class="header">
                    <h1>Singup</h1>
                    <p>It Just Take 30 Second</p>
                </div>
                <div class="Singup-body">
                    <p>
                        <asp:Label ID="name_l" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="name" runat="server" CssClass="sngtxts"></asp:TextBox>
                        <asp:Label ID="name_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                    </p>

                    <p>
                        <asp:Label ID="email_l" runat="server" Text="Email_Id"></asp:Label>
                        <asp:TextBox ID="email" runat="server" CssClass="sngtxts" TextMode="Email"></asp:TextBox>
                        <asp:Label ID="email_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                    </p>

                    <p>
                        <asp:Label ID="pass_l" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="sngtxts"></asp:TextBox>
                        <asp:Label ID="pass_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
                    </p>

                    <p>
                    </p>
                    <%--<button type="button" class="sngbtn" id="sngbtn">Sign Up</button>
                <div style="display: none;">
                    <asp:Button ID="storeDataBtn" runat="server" Text="Singup" height="80px" Width="259px" OnClick="storeDataBtn_Click"/></div>--%>
                    <button type="button" class="sngbtn" id="sngbtn">Sing Up</button>
                    <div style="display: none;">
                        <asp:Button ID="storeDataBtn" runat="server" Text="Singup" Height="80px" Width="259px" OnClick="storeDataBtn_Click" /></div>
                </div>




            </div>
            <div class="circle c1"></div>
            <div class="circle c2"></div>

        </div>
    </form>
    <script>
    function getid(id) {
        return document.getElementById(id);
    }
    getid("sngbtn").onclick = function () {
        let fnameValid = validation("name", /^[A-Za-z]{0,}$/, "Invalid value!", true);
        let emailValid = validation("email", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "Invalid Email!", true);
        let passValid = validation("pass", /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,20}$/, "Too Weak Password", true);

        
        if (fnameValid && emailValid && passValid) {
            getid("storeDataBtn").click();
        }
    }
    function validation(fieldid, regx, message, required = false) {
        console.log(fieldid);
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
</body>
</html>
