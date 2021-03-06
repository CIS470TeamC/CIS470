﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Inherits="frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="~/public/Default.aspx">
    <img src="images/WSCLogo.png" class="logo"/>
    </asp:HyperLink>
   
   
    
    <form id="form1" runat="server">
         
        <br />
        <br />
        <div style="width: 100%; text-align:center;">
    <asp:Label ID="Label3" runat="server" Text="LOGIN" CssClass="declarePage"></asp:Label>
            </div>

    <div>
       
    <table class="login">
    
          <tr>
            <td>
                <asp:Label ID="lblUserName" runat="server" Text="Username: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtUserName" runat="server" Height="25px"></asp:TextBox>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must Enter Username!" ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
          </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
            </td>
            <td>
                  <asp:TextBox ID="txtPassword" runat="server" Height="25px" TextMode="Password"></asp:TextBox>
              </td>
            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must Enter Password!" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
          </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click"/>
            </td>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="" CssClass="loginLblStatus"></asp:Label>
            </td>
            
          </tr>

    </table>
        

    </div>
    </form>
</body>
</html>