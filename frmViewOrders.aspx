<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmViewOrders.aspx.cs" Inherits="frmViewOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="frmViewOrders.aspx">
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

        <asp:GridView ID="GridViewOrders" runat="server" cellspacing="15" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="fromTop , gridCustomer">
            <Columns>
                <asp:BoundField DataField="SalesOrderID" HeaderText="  SalesOrder  " InsertVisible="False" SortExpression="SalesOrderID"></asp:BoundField>
                <asp:BoundField DataField="PaidAmt" HeaderText="  Amt Paid  " SortExpression="PaidAmt"></asp:BoundField>
                <asp:BoundField DataField="RemainingAmt" HeaderText="  Remaining Amt  " SortExpression="RemainingAmt"></asp:BoundField>
                <asp:BoundField DataField="OrderQty" HeaderText="  Qty  " SortExpression="OrderQty"></asp:BoundField>
                <asp:BoundField DataField="ProdID" HeaderText="  ProdID  " SortExpression="ProdID"></asp:BoundField>
                <asp:BoundField DataField="CFName" HeaderText="  First Name  " SortExpression="CFName"></asp:BoundField>
                <asp:BoundField DataField="CLName" HeaderText="  Last Name  " SortExpression="CLName"></asp:BoundField>
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="  PayOnDel  " SortExpression="PayOnDel"></asp:CheckBoxField>
                <asp:BoundField DataField="Status" HeaderText="  Status  " SortExpression="Status"></asp:BoundField>
                <asp:BoundField DataField="OrderDate" HeaderText="  OrderDate  " SortExpression="OrderDate"></asp:BoundField>
                <asp:BoundField DataField="TotalDue" HeaderText="  TotalDue  " SortExpression="TotalDue"></asp:BoundField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SiteDBConnectionString %>' ProviderName='<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>' SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID) WHERE PurchaseOrderForm.Status = 'Validated'"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
