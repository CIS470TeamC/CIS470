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
        <asp:GridView ID="gvCurrentOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="CurrentOrders" OnSelectedIndexChanged="gvCurrentOrders_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="PayOnDel" SortExpression="PayOnDel" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="TotalDue" SortExpression="Currency" />
            </Columns>
        </asp:GridView>
        <table border="1" style="border-collapse: collapse">
    <tr>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Create New Purchase Order" OnClick="Insert" />
        </td>
    </tr>
</table>
        <asp:SqlDataSource ID="CurrentOrders" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [OrderID], [PayOnDel], [Status], [OrderDate], [TotalDue], [CustID] FROM [PurchaseOrderForm] WHERE [CustID] = @CustID" 
            DeleteCommand="DELETE FROM [PurchaseOrderForm] WHERE [OrderID] = ?" 
            InsertCommand="INSERT INTO [PurchaseOrderForm] ([CustID], [PayOnDel], [Status], [OrderDate], [TotalDue]) VALUES (?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [PurchaseOrderForm] SET [PayOnDel] = ?, [Status] = ?, [OrderDate] = ?, [TotalDue] = ?, [CustID] = ? WHERE [OrderID] = ?" >
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="CustID" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="CustID" SessionField="CustID" />
                <asp:Parameter Name="PayOnDel" Type="Boolean" DefaultValue="FALSE" />
                <asp:Parameter Name="Status" Type="String" DefaultValue="Not Validated" />
                <asp:Parameter Name="OrderDate" Type="String" DefaultValue="Today" />
                <asp:Parameter Name="TotalDue" Type="Int32" DefaultValue="0" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PayOnDel" Type="Boolean" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="OrderDate" Type="String" />
                <asp:Parameter Name="TotalDue" Type="Int32" />
                <asp:Parameter Name="CustID" Type="Int32" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,OrderDetailID" DataSourceID="OrderLineItems" style="margin-bottom: 1px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDetailID" HeaderText="OrderDetailID" InsertVisible="False" ReadOnly="True" SortExpression="OrderDetailID" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
            </Columns>
            <EmptyDataTemplate>
                There are no items in that purchase order, or there is no purchase order selected
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Product ID:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtProductID"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Quantity:"></asp:Label>
                    <asp:TextBox runat="server" ID="txtQuantity"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="addLineItem" runat="server" Text="Add Line Item" OnClick="InsertLineItem" />
                </asp:TableCell>

            </asp:TableRow>
            
        </asp:Table>
        <asp:SqlDataSource ID="OrderLineItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [PurchaseOrderDetail] WHERE [OrderID] = ? AND [OrderDetailID] = ?" 
            InsertCommand="INSERT INTO [PurchaseOrderDetail] ([OrderID], [OrderQty], [ProdID]) VALUES (?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [PurchaseOrderDetail] WHERE [OrderID] = @OrderID" 
            UpdateCommand="UPDATE [PurchaseOrderDetail] SET [OrderQty] = ?, [ProdID] = ? WHERE [OrderID] = ? AND [OrderDetailID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID"/>
                <asp:ControlParameter ControlID="txtQuantity" Name="Quantity" Type="Int32" />
                <asp:ControlParameter ControlID="txtProductID"  Name="ProductId" Type="Int32" />
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
