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
     
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="MY ACCOUNT" CssClass="declarePage"></asp:Label>
            
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Accounts_DB">
            <Columns>
                <asp:BoundField DataField="UserLogon" HeaderText="UserLogon" SortExpression="UserLogon" />
                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" SortExpression="CustID" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" />
                <asp:BoundField DataField="CCNum" HeaderText="CCNum" SortExpression="CCNum" />
                <asp:BoundField DataField="CCExp" HeaderText="CCExp" SortExpression="CCExp" />
                <asp:BoundField DataField="CCPin" HeaderText="CCPin" SortExpression="CCPin" />
                <asp:BoundField DataField="CCType" HeaderText="CCType" SortExpression="CCType" />
                <asp:BoundField DataField="Customer.AddressID" HeaderText="Customer.AddressID" SortExpression="Customer.AddressID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="Address.AddressID" HeaderText="Address.AddressID" InsertVisible="False" SortExpression="Address.AddressID" />
                <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
                <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" SortExpression="AddressLine2" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateCode" HeaderText="StateCode" SortExpression="StateCode" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Accounts_DB" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT Users.UserLogon, Customer.*, Address.*
FROM Address INNER JOIN (Users INNER JOIN Customer ON Users.UserID = Customer.UserID) ON Address.AddressID = Customer.AddressID
            WHERE (((Users.UserLogon)='a name goes here'))"></asp:SqlDataSource>
    </form>
</body>
</html>
