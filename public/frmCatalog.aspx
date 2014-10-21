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
        
        
        <div style="width: 100%; text-align:center;">
    <asp:Label ID="Label3" runat="server" Text="CATALOG" CssClass="declarePage"></asp:Label>
           </div>

            

    

    <form id="form1" runat="server">
    <div>
        
        <table>
          <tr>
              <td>
                <asp:LinkButton ID="lbtnLogin" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogin_Click">LOGIN</asp:LinkButton>
            </td>
              <td>
                  <asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
              </td>
              <td>
                  <div style="width: 100%; text-align:right;"><asp:LinkButton ID="lbtnMyAccount" runat="server" CssClass="topMenuRight" OnClick="lbtnMyAccount_Click">MY ACCOUNT</asp:LinkButton>
           </div>
                       </td>
          </tr>

    </table>
        <div style="width: 100%; text-align:center;">
        <asp:Button ID="btnCreateOrder" runat="server" Text="PLACE ORDER" CssClass="btn , declarePage" PostBackUrl="~/frmCreateOrder.aspx" />
        </div>

        
        <asp:SqlDataSource ID="Catalog_DB" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server"  CssClass="containerItems" HorizontalAlign="Center" GridLines="None" cellspacing="15" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="Catalog_DB">
            <Columns>
                <asp:ImageField DataImageUrlField="ProdImage" DataImageUrlFormatString="~\Images\{0}"></asp:ImageField>
                <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="Description" SortExpression="ProdDescription" />
                <asp:BoundField DataField="JobType" HeaderText="Job Type" SortExpression="JobType">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="MediaType" HeaderText="Media Type" SortExpression="MediaType">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ListPrice" HeaderText="List Price" SortExpression="ListPrice" DataFormatString="{0:C}">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </asp:GridView>
            
        </div>
    
    </form>
</body>
</html>
