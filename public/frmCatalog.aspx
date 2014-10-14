﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCatalog.aspx.cs" Inherits="frmCatalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="..\StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="~/public/Default.aspx" >
    <img src="..\images/WSCLogo.png" class="logo" /></asp:HyperLink>
        
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="CATALOG" CssClass="declarePage"></asp:Label>
            <br />

            

            </div>
    

    <form id="form1" runat="server">
    <div>
        
        <table>
          <tr>
            <td><asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
            </td>
              <td><asp:LinkButton ID="lbtnMyAccount" runat="server" CssClass="topMenuRight" OnClick="lbtnMyAccount_Click">MY ACCOUNT</asp:LinkButton>
            </td>
          </tr>

    </table>




        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:Button ID="btnCreateOrder" runat="server" Text="PLACE ORDER" CssClass="btn" PostBackUrl="~/frmCreateOrder.aspx" />
        </div>
    </div>
    </form>
</body>
</html>
