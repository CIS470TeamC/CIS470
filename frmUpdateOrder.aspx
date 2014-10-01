<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmUpdateOrder.aspx.cs" Inherits="frmUpdateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
        <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        a:link {
            text-decoration: none;
        }
        
        a:visited {
            text-decoration: none;
        }
 </style>
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="Default.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     <table>
          <tr>
            <td><a href="Default.aspx" class="topMenuLeft">Logout</a>
            </td>
          </tr>

    </table>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="UPDATE/SEARCH ORDERS" CssClass="declarePage"></asp:Label>
            
            </div>
    
   
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
