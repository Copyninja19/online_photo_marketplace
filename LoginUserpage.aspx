<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUserpage.aspx.cs" Inherits="Online_photoGallery_admin.LoginUserpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="LoginUserCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="mother">
<div class="header">
    <h1>Online PhotoGallery</h1>
</div>
    <div class="container">
        <div class="head">
           <h2>Login</h2> 
        </div>
        
        <div class="Loginfr">
            <div class="fieldouters">
                <asp:Label ID="email_l"  CssClass="inputlbs" runat="server" Text="Email_Id"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="lgtxts" TextMode="Email"></asp:TextBox>
                <asp:Label ID="email_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
            </div>
            <div class="fieldouters">
                <asp:Label ID="pass_l" CssClass="inputlbs"  runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="lgtxts"></asp:TextBox>
                <asp:Label ID="pass_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
            </div>
            <button type="button" class="lgbtn" id="lgbtn">Login</button>
            <div style="display: none;">
                <asp:Button ID="checkDataBtn" runat="server" Text="Singup" OnClick="checkDataBtn_Click" />
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
getid("lgbtn").onclick = function () {
    let emailValid = validation("email", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "Invalid Email!", true);
    let passValid = validation("pass", /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,20}$/, "Invalid Password", true);
    if (emailValid && passValid) {
        getid("checkDataBtn").click();
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
    
</body>
</html>
