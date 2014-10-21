<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCreateOrder.aspx.cs" Inherits="frmCreateOrder" %>

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
     
    <div style="width: 100%; text-align:center;">
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
                <asp:BoundField DataField="OrderID" HeaderText="Order Number" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="Pay on Delivery" SortExpression="PayOnDel" />
                <asp:BoundField DataField="Status" HeaderText="Validated?" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="Date Order Was Placed" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="Total Cost" SortExpression="Currency" DataFormatString="{0:c}" />
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
            SelectCommand="SELECT [OrderID], [PayOnDel], [Status], [OrderDate], [TotalDue] FROM [PurchaseOrderForm] WHERE [CustID] = @CustID" 
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
                <asp:SessionParameter Name="OrderDate" SessionField="OrderDate" />
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
        <asp:GridView ID="gvOrderLineItems" runat="server" AutoGenerateColumns="False" DataSourceID="OrderLineItems" style="margin-bottom: 1px" Visible="False">
            <Columns>
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            </Columns>
            <EmptyDataTemplate>
                There are no items in that purchase order, or there is no purchase order selected
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:Table runat="server" Visible="false" ID="tblAddItems">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Product ID:"></asp:Label>
                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddProductID" DataSourceID="Products" DataTextField="ProdName" DataValueField="ProdID" OnSelectedIndexChanged="ddProducts_SelectedIndexChanged"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Printed/Engraved Message:" ></asp:Label>
                    <asp:TextBox runat="server" ID="tbMessage"></asp:TextBox>
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
        <asp:SqlDataSource ID="Products" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ProdName], [ProdID], [ListPrice] FROM [Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="OrderLineItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT PurchaseOrderDetail.OrderQty, Product.ProdName, Product.ProdDescription, Product.ListPrice FROM (PurchaseOrderDetail INNER JOIN Product ON PurchaseOrderDetail.ProdID = Product.ProdID) WHERE PurchaseOrderDetail.OrderID = @OrderID" 
            InsertCommand="INSERT INTO PurchaseOrderDetail(OrderID, OrderQty, ProdID) VALUES (?, ?, ?)" 
            
            >
            <SelectParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
                <asp:ControlParameter Name="OrderQty" ControlID="txtQuantity" />
                <asp:ControlParameter Name="ProdID" ControlID="ddProductID" />
            </InsertParameters>
        </asp:SqlDataSource>

    </form>
    Troubleshooting to show variables
    REMOVE BEFORE FINAL!!!
            <asp:Label ID="lblTestVar" runat="server"></asp:Label>
    </body>
</html>
