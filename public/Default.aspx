<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="Default.aspx">
    <img src="..\images/WSCLogo.png" class="logo" />
    </asp:HyperLink>

    
    
    <form id="form1" runat="server">
            <table>
          <tr>
            <td>
        <asp:LinkButton ID="lbtnLogin" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogin_Click">LOGIN</asp:LinkButton>

            </td>
              <td>
                  <asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
              </td>
          </tr>

    </table>

    <div>
    

        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:Button ID="btnViewCatalog" runat="server" Text="CATALOG" CssClass="btn" PostBackUrl="~/public/frmCatalog.aspx" />
        </div>
        

    </div>
    </form>
</body>
</html>
