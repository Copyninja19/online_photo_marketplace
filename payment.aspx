<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="Online_photoGallery_admin.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
    <link href="paymrnt_Css.css" rel="stylesheet" />
</head>
<body>
<label id="exmsg1" runat="server" style="position: fixed; top: 0px; left: 0px; font-size: 30px; z-index: 10;"></label>        <div class="container">
    <h2>Payment Form</h2>
    <form id="paymentForm" runat="server">
        <div class="fieldouters">
            <asp:Label ID="cardholder_l" runat="server" Text="Cardholder Name"></asp:Label>
            <asp:TextBox ID="cname" runat="server" CssClass="sngtxts"></asp:TextBox>
            <asp:Label ID="cname_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
            </div>
       
        <div class="fieldouters">
            <asp:Label ID="cardnumber_l" runat="server" Text="Card Number"></asp:Label>
            <asp:TextBox ID="cardn" runat="server" CssClass="sngtxts"></asp:TextBox>
            <asp:Label ID="cardn_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
        </div>

        <div class="fieldouters">
            <asp:Label ID="expiry_l"  type="date"  runat="server" Text="Expiry Date"></asp:Label>
            <%--<asp:TextBox ID="expiry" runat="server" CssClass="sngtxts" TextMode="Date"></asp:TextBox>
            <asp:Label ID="expiry_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>--%>
            <input type="date" id="expiry" class="sngtxts"  name="expiry"/>
            <label name="expiry_m" class="ermsgs"></label>

        </div>

        
        <div class="fieldouters">
            <asp:Label ID="cvv_l" runat="server" Text="CVV"></asp:Label>
            <asp:TextBox ID="cvv" runat="server" CssClass="sngtxts" TextMode="Password"></asp:TextBox>
            <asp:Label ID="cvv_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
        </div>


        <div class="fieldouters">
            <asp:Label ID="payment_l" runat="server" Text="Payment Date"></asp:Label>
            <%--<asp:TextBox ID="Payment" runat="server" CssClass="sngbtn" TextMode="Date"></asp:TextBox>
            <asp:Label ID="payment_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>--%>
            <input type="date" class="sngtxts" id="Payment" name="Payment" />
            <label name="Payment_m" class="ermsgs"></label>

        </div>
     
         <div class="fieldouters">
     <asp:Label ID="amount_l" runat="server" Text="Amount"></asp:Label>
     <asp:TextBox ID="amount" runat="server" CssClass="sngtxts"></asp:TextBox>
     <asp:Label ID="amount_m" CssClass="ermsgs" runat="server" Text="*"></asp:Label>
 </div>

        <%--<input type="submit"  class="sbbtn" value="Submit">--%>
        <button type="button" class="sbbtn" id="sbbtnValidate">Submit</button>
        <div style="display: none;">
            <asp:Button ID="sbbtn" runat="server" Text="Submit" OnClick="sbbtn_Click" />
        </div>
    </form>
</div>
    <script>
        function getid(id) {
            return document.getElementById(id);
        }
        getid("sbbtnValidate").onclick = function () {
            //let cname = validation("cname", /^[A-Za-z]{0, }$/, "Invalid value!", true);
            //let cardn = validation("cardn", /^\d{16,}$/, "Card number must be at least 16 digits", true);
            //let expiry1 = validation("expiry", /^\d{2}\/\d{4}$/, "Invalid expiry date (MM/YYYY)", true);
            //let cvv = validation("cvv", /^\d{3,4}$/, "CVV must be 3 or 4 digits", true);
            //let Payment = validation("Payment", /^\d{2}\/\d{2}\/\d{4}$/, "Invalid payment date (DD/MM/YYYY)", true);
            //let amount = validation("amount", /^\d+(\.\d{1,2})?$/, "Invalid amount", true);
            

            //if (cname && cardn && expiry1 && cvv && Payment && amount) {
            //    getid("sbbtn").click();
            //}
            getid("sbbtn").click();
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
