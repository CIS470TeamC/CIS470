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
        <asp:GridView ID="gvCurrentOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="CurrentOrders" OnSelectedIndexChanged="gvCurrentOrders_SelectedIndexChanged" CssClass="containerOrders" CellSpacing="15" HorizontalAlign="Center" GridLines="None">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="Order Number" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="Status" HeaderText="Validated?" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="Date Order Was Placed" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="Total Cost" SortExpression="Currency" DataFormatString="{0:c}" />
                <asp:TemplateField HeaderText="Pay On Delivery">
                    <ItemTemplate>
                        <asp:Button ID="btnPayOnDel" runat="server"
                            CommandName="SwapPOD" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                            Text='<%# Eval("PayOnDel") %>' 
                            OnCommand="btnPayOnDel_Command" CssClass="btn"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <table border="1" style="border-collapse: collapse" class="btnTable">
    <tr>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Create New Purchase Order" OnClick="Insert" CssClass="btn" />
        </td>
    </tr>
</table>
        <asp:SqlDataSource ID="CurrentOrders" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [OrderID], [PayOnDel], [Status], [OrderDate], [TotalDue] FROM [PurchaseOrderForm] WHERE [CustID] = @CustID" 
            DeleteCommand="DELETE FROM [PurchaseOrderForm] WHERE [OrderID] = ?" 
            InsertCommand="INSERT INTO [PurchaseOrderForm] ([CustID], [PayOnDel], [Status], [OrderDate], [TotalDue]) VALUES (?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [PurchaseOrderForm] SET [TotalDue] = ? WHERE [OrderID] = ?" >
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
                <asp:SessionParameter Name="OrderTotal" SessionField="OrderTotal" />
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CurrentOrders_PayOnDel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [PayOnDel] FROM [PurchaseOrderForm]" >
        </asp:SqlDataSource>
        <asp:GridView ID="gvOrderLineItems" runat="server" AutoGenerateColumns="False" DataSourceID="OrderLineItems" style="margin-bottom: 1px" Visible="False" onrowdatabound="gvOrderLineItems_RowDataBound" CssClass="containerOrders" CellSpacing="15" HorizontalAlign="Center" GridLines="none">
            <Columns>
                <asp:BoundField DataField="OrderQty" HeaderText="Quantity" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdName" HeaderText="Name" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="Product Description" SortExpression="ProdDescription" />
                <asp:BoundField DataField="ListPrice" HeaderText="Unit Price" SortExpression="ListPrice" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:TemplateField HeaderText="Subtotal">
			 <ItemTemplate>
				<div style="text-align: right;">
				<asp:Label ID="lblqty" runat="server" Text='<%# String.Format("{0:C}", Eval("ProdTotal")) %>'/>
				</div>
			 </ItemTemplate>
			 <FooterTemplate>
				<div style="text-align: right;">
				<asp:Label ID="lblTotalqty" runat="server" />
				</div>
			 </FooterTemplate>
		  </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                There are no items in that purchase order, or there is no purchase order selected
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:Table runat="server" Visible="false" ID="tblAddItems" CssClass="containerUpdateOrders" HorizontalAlign="Center">
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
                    <asp:TextBox runat="server" ID="txtQuantity" Width="25"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="addLineItem" runat="server" Text="Add Line Item" OnClick="InsertLineItem" CssClass="btn"/>
                </asp:TableCell>

            </asp:TableRow>
            
        </asp:Table>
        <asp:SqlDataSource ID="Products" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ProdName], [ProdID], [ListPrice] FROM [Product]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="OrderLineItems" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT PurchaseOrderDetail.OrderQty, Product.ProdName, Product.ProdDescription, Product.ListPrice, PurchaseOrderDetail.Message, PurchaseOrderDetail.ProdTotal FROM (PurchaseOrderDetail INNER JOIN Product ON PurchaseOrderDetail.ProdID = Product.ProdID) WHERE PurchaseOrderDetail.OrderID = @OrderID" 
            InsertCommand="INSERT INTO PurchaseOrderDetail(OrderID, OrderQty, ProdID, Message, ProdTotal) VALUES (?, ?, ?, ?, ?)" 
            
            >
            <SelectParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
                <asp:ControlParameter Name="OrderQty" ControlID="txtQuantity" />
                <asp:ControlParameter Name="ProdID" ControlID="ddProductID" />
                <asp:ControlParameter Name="Message" ControlID="tbMessage" />
                <asp:SessionParameter Name="ProdTotal" SessionField="ProdTotal"/>
            </InsertParameters>
        </asp:SqlDataSource>

         <asp:SqlDataSource ID="Products_Price" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ProdID], [ListPrice] FROM [Product] WHERE [ProdID] = @ProdID">
            <SelectParameters>
                <asp:ControlParameter Name="ProdID" ControlID="ddProductID" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
<asp:ListBox CssClass="hide" ID="lbListPrice" runat="server" DataSourceID="Products_Price" DataTextField="ListPrice" DataValueField="ListPrice" Rows="1" Visible="true"></asp:ListBox>
       
    </form>
    </body>
</html>
