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

    

        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:Button ID="btnViewCatalog" runat="server" Text="CATALOG" CssClass="btn" PostBackUrl="~/public/frmCatalog.aspx" />
        </div>

       
        <div class="containerPrint">
            <h2><b>PRINTING SERVICES</b></h2>
            <h3><i>We provide quality printing to fit any need!</i></h3>
            <img src="../images/printing.png"  alt="printing logo"/>
            <p>WSC has a wide variety of products to choose
            from and can also print on provided merchandise.
            Click on the "Catalog" button to view products.</p>
       </div>
        <div class="containerEngrave">
            <h2><b>ENGRAVING SERVICES</b></h2>
            <h3><i>We provide quality engraving to fit any need!</i></h3>
            <img src="../images/engraving.png" alt="engrave image" />
            <p>WSC has a wide variety of products to choose >
            from and can also engrave provided merchandise.
            Click on the "Catalog" button to view products.</p>
       </div>
        <div class="containerMission">
            <h2><b>THE WSC MISSION</b></h2>
            <h3><i>To provide unmatched, quality services at
            unbeatable prices.</i></h3>
            <img src="../images/smallWSC.png" alt="small wsc logo"/>
            <p>WSC is dedicated to becoming your number one print and engraving service. 
                We put customers first and design with passion like it was built for us.</p>

       </div>
    
        
    </form>
</body>
</html>
