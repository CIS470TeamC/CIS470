<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmUpdateOrder.aspx.cs" Inherits="frmUpdateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
        
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="public/Default.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="UPDATE/SEARCH ORDERS" CssClass="declarePage"></asp:Label>
            
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID)">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" EditText="Update"> <ControlStyle CssClass="btn" /></asp:CommandField>
                <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" InsertVisible="False" SortExpression="SalesOrderID" />
                <asp:BoundField DataField="PaidAmt" HeaderText="PaidAmt" SortExpression="PaidAmt" />
                <asp:BoundField DataField="RemainingAmt" HeaderText="RemainingAmt" SortExpression="RemainingAmt" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="SalesOrderForm.CustID" HeaderText="SalesOrderForm.CustID" SortExpression="SalesOrderForm.CustID" />
                <asp:BoundField DataField="SalesOrderForm.OrderID" HeaderText="SalesOrderForm.OrderID" SortExpression="SalesOrderForm.OrderID" />
                <asp:BoundField DataField="PurchaseOrderDetail.OrderID" HeaderText="PurchaseOrderDetail.OrderID" SortExpression="PurchaseOrderDetail.OrderID" />
                <asp:BoundField DataField="OrderDetailID" HeaderText="OrderDetailID" InsertVisible="False" SortExpression="OrderDetailID" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
                <asp:BoundField DataField="Customer.CustID" HeaderText="Customer.CustID" InsertVisible="False" SortExpression="Customer.CustID" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" />
                <asp:BoundField DataField="CCNum" HeaderText="CCNum" SortExpression="CCNum" />
                <asp:BoundField DataField="CCExp" HeaderText="CCExp" SortExpression="CCExp" />
                <asp:BoundField DataField="CCPin" HeaderText="CCPin" SortExpression="CCPin" />
                <asp:BoundField DataField="CCType" HeaderText="CCType" SortExpression="CCType" />
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" SortExpression="AddressID" />
                <asp:BoundField DataField="Customer.UserID" HeaderText="Customer.UserID" SortExpression="Customer.UserID" />
                <asp:BoundField DataField="Users.UserID" HeaderText="Users.UserID" InsertVisible="False" SortExpression="Users.UserID" />
                <asp:BoundField DataField="UserLogon" HeaderText="UserLogon" SortExpression="UserLogon" />
                <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                <asp:BoundField DataField="UserSecLevel" HeaderText="UserSecLevel" SortExpression="UserSecLevel" />
                <asp:BoundField DataField="PurchaseOrderForm.OrderID" HeaderText="PurchaseOrderForm.OrderID" InsertVisible="False" SortExpression="PurchaseOrderForm.OrderID" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="PayOnDel" SortExpression="PayOnDel" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="TotalDue" SortExpression="TotalDue" />
                <asp:BoundField DataField="PurchaseOrderForm.CustID" HeaderText="PurchaseOrderForm.CustID" SortExpression="PurchaseOrderForm.CustID" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
