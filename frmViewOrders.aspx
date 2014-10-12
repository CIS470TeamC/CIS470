<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmViewOrders.aspx.cs" Inherits="frmViewOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="~/public/Default.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="VIEW ORDERS" CssClass="declarePage"></asp:Label>
            
            </div>
    <form id="form1" runat="server">
    <div style="height: 155px">
        <table>
          <tr>
            <td><asp:LinkButton ID="lbtnLogout" runat="server" CssClass="topMenuLeft" OnClick="lbtnLogout_Click">LOGOUT</asp:LinkButton>
            </td>
          </tr>

    </table>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" class="login" AutoGenerateColumns="False" DataKeyNames="SalesOrderID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" InsertVisible="False" ReadOnly="True" SortExpression="SalesOrderID" />
                <asp:BoundField DataField="PaidAmt" HeaderText="PaidAmt" SortExpression="PaidAmt" />
                <asp:BoundField DataField="RemainingAmt" HeaderText="RemainingAmt" SortExpression="RemainingAmt" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [SalesOrderForm]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
