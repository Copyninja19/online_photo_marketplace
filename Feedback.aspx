<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Online_photoGallery_admin.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Feedbackcss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrap">
    <table>
        <form action="" method="">
            <h1>Feedback Foam</h1>
            <tr>
             <td colspan="2">
                 <label>
                     How do you rate your overall experiance
                 </label>
                 <br>
                 <input type="radio" name="rate" value="Bad">Bad
                 <input type="radio" name="rate" value="Average">Average
                  <input type="radio" name="rate" value="Good">Good
             </td>
            </tr>
            <tr>
                <td> 
                    <label>Fullname*</label>
                    <br>
                    <input type="text" name="Fullname" class="txt" required>
                </td>
                <td>
                    <label>Email*</label>
                    <br>
                    <input type="Email" name="Email" class="txt" required>
                </td>

            </tr>
            <%--<tr>
                <td>
                    <label>Age*</label>
                    <br>
                    <input type="text" name="Age" class="txt" required>
                </td>
                <td>
                    <label>Phone*</label>
                    <br>
                    <input type="text" name="Phone" class="txt" required>
                </td>
            </tr>--%>
            <tr>
                <td colspan="2">
                    <label>Message</label><br>
                    <textarea class="txtarea"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn">Submit</button>
                </td>
            </tr>
        </form>
    </table>
</div>
    </form>
</body>
</html>
