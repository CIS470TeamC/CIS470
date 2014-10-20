<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCreateOrder.aspx.cs" Inherits="frmCreateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
   <asp:HyperLink ID="Home" runat="server" NavigateUrl="Default.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     
    <div style="width: 100%; text-align:center;">
    <asp:Label ID="Label3" runat="server" Text="CREATE ORDER" CssClass="declarePage"></asp:Label>
            
            </div>
    <form id="form1" runat="server">
    <div>
        <table>
          <tr>
            <td><asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
            </td>
          </tr>

    </table>
    
    </div>
    </form>
</body>
</html>
