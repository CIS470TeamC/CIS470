<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCreateOrder.aspx.cs" Inherits="frmCreateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
   <asp:HyperLink ID="Home" runat="server" NavigateUrl="Default.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label3" runat="server" Text="CREATE ORDER" CssClass="declarePage"></asp:Label>
            
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
        <asp:GridView ID="gvCurrentOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="CurrentOrders" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="PayOnDel" SortExpression="PayOnDel" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="TotalDue" SortExpression="TotalDue" />
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CurrentOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PurchaseOrderForm] WHERE [CustID] = @CustID">
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="CustID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label runat="server" ID="testlabel"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,OrderDetailID" DataSourceID="OrderLineItems" style="margin-bottom: 1px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDetailID" HeaderText="OrderDetailID" InsertVisible="False" ReadOnly="True" SortExpression="OrderDetailID" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="OrderLineItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [PurchaseOrderDetail] WHERE [OrderID] = ? AND [OrderDetailID] = ?" 
            InsertCommand="INSERT INTO [PurchaseOrderDetail] ([OrderID], [OrderDetailID], [OrderQty], [ProdID]) VALUES (?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [PurchaseOrderDetail] WHERE [OrderID] = @OrderID" 
            UpdateCommand="UPDATE [PurchaseOrderDetail] SET [OrderQty] = ?, [ProdID] = ? WHERE [OrderID] = ? AND [OrderDetailID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
                <asp:Parameter Name="OrderQty" Type="Int32" />
                <asp:Parameter Name="ProdID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderQty" Type="Int32" />
                <asp:Parameter Name="ProdID" Type="Int32" />
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
