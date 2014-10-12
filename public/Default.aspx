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
    <table>
          <tr>
            <td>
                <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/frmLogin.aspx">
                <asp:Label ID="lblLogin" runat="server" Text="LOGIN" CssClass="topMenuLeft"></asp:Label>
                    </asp:HyperLink>
            </td>
              <td>
                  <asp:HyperLink ID="Logout" runat="server" NavigateUrl="~/public/Default.aspx">
                  <asp:Label ID="lblLogout" runat="server" Text="LOGOUT" CssClass="topMenuLeft"></asp:Label>
                      </asp:HyperLink>
              </td>
              <td>
                  <asp:HyperLink ID="MyAccount" runat="server" NavigateUrl="~/frmMyAccount.aspx">
                  <asp:Label ID="lblMyAccount" runat="server" Text="MYACCOUNT" CssClass="topMenuRight"></asp:Label>
                      </asp:HyperLink>
              </td>
          </tr>

    </table>

    
    
    <form id="form1" runat="server">
        
    <div>
    

        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:Button ID="btnViewCatalog" runat="server" Text="CATALOG" CssClass="btn" PostBackUrl="~/public/frmCatalog.aspx" />
        </div>
        

    </div>
    </form>
</body>
</html>
