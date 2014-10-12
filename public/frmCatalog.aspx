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
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="CATALOG" CssClass="declarePage"></asp:Label>
            <br />

            

            </div>
    

    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" SortExpression="ProdID" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                <asp:BoundField DataField="ProdImage" HeaderText="ProdImage" SortExpression="ProdImage" />
                <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
                <asp:BoundField DataField="MediaType" HeaderText="MediaType" SortExpression="MediaType" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\SiteDB.accdb" DeleteCommand="DELETE FROM `Product` WHERE `ProdID` = ?" InsertCommand="INSERT INTO `Product` (`ProdID`, `ProdName`, `ProdDescription`, `ProdImage`, `JobType`, `MediaType`, `ListPrice`) VALUES (?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `ProdID`, `ProdName`, `ProdDescription`, `ProdImage`, `JobType`, `MediaType`, `ListPrice` FROM `Product`" UpdateCommand="UPDATE `Product` SET `ProdName` = ?, `ProdDescription` = ?, `ProdImage` = ?, `JobType` = ?, `MediaType` = ?, `ListPrice` = ? WHERE `ProdID` = ?">
            <DeleteParameters>
                <asp:Parameter Name="ProdID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProdID" Type="Int32" />
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdDescription" Type="String" />
                <asp:Parameter Name="ProdImage" Type="String" />
                <asp:Parameter Name="JobType" Type="String" />
                <asp:Parameter Name="MediaType" Type="String" />
                <asp:Parameter Name="ListPrice" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdDescription" Type="String" />
                <asp:Parameter Name="ProdImage" Type="String" />
                <asp:Parameter Name="JobType" Type="String" />
                <asp:Parameter Name="MediaType" Type="String" />
                <asp:Parameter Name="ListPrice" Type="Decimal" />
                <asp:Parameter Name="ProdID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    <div>
        <div style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 200px;">
        <asp:Button ID="btnCreateOrder" runat="server" Text="PLACE ORDER" CssClass="btn" PostBackUrl="~/frmCreateOrder.aspx" />
        </div>
    </div>
    </form>
</body>
</html>
