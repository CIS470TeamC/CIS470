<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCatalog.aspx.cs" Inherits="frmCatalog" %>

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
              <td>
                <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/frmLogin.aspx">
                <asp:Label ID="lblLogin" runat="server" Text="LOGIN" CssClass="topMenuLeft"></asp:Label>
                    </asp:HyperLink>
            </td>
              <td>
                  <asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
              </td>
              <td><asp:LinkButton ID="lbtnMyAccount" runat="server" CssClass="topMenuRight" OnClick="lbtnMyAccount_Click">MY ACCOUNT</asp:LinkButton>
            </td>
          </tr>

    </table>




        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:SqlDataSource ID="Catalog_DB" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="Catalog_DB">
            <Columns>
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                <asp:ImageField DataImageUrlField="ProdImage" DataImageUrlFormatString="~\Images\{0}_thumb.jpg">
                </asp:ImageField>
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
                <asp:BoundField DataField="MediaType" HeaderText="MediaType" SortExpression="MediaType" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
            <asp:Button ID="btnCreateOrder" runat="server" Text="PLACE ORDER" CssClass="btn" PostBackUrl="~/frmCreateOrder.aspx" />
        </div>
    </div>
    </form>
</body>
</html>
