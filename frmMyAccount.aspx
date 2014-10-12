<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMyAccount.aspx.cs" Inherits="frmMyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="frmCatalog.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     <table>
          <tr>
            <td><a href="public/Default.aspx" class="topMenuLeft">LOGOUT</a>
            </td>
          </tr>

    </table>

    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="MY ACCOUNT" CssClass="declarePage"></asp:Label>
            
            </div>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
