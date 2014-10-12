<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Inherits="frmLogin" %>

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
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="LOGIN" CssClass="declarePage"></asp:Label>
            
            </div>
   
    
    <form id="form1" runat="server">
    <div>
       <asp:Label ID="lblStatus" runat="server" Text="Please enter your Username and Password" CssClass="loginLblStatus"></asp:Label> 
    </div>
    <div>
        <asp:Login ID="Login1" runat="server" 
            TitleText="Please enter your UserName and Password in order to log into the system" 
            onauthenticate="Login1_Authenticate" DestinationPageUrl="~/frmMyAccount.aspx">
        </asp:Login>
    </div>
    </form>
</body>
</html>