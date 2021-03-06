﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmUpdateOrder.aspx.cs" Inherits="frmUpdateOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
        
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="frmUpdateOrder.aspx">
    <img src="images/WSCLogo.png" class="logo" />
    </asp:HyperLink>
     
    <div style="width: 100%; text-align:center;">
        
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>"
            DeleteCommand="DELETE FROM [PurchaseOrderDetail] WHERE [OrderID] = ? AND [OrderDetailID] = ?"
            InsertCommand="INSERT INTO [PurchaseOrderForm] ([Status]) VALUES (?)"
            SelectCommand="SELECT PurchaseOrderDetail.OrderID, PurchaseOrderDetail.OrderDetailID, PurchaseOrderDetail.OrderQty, PurchaseOrderDetail.ProdID, PurchaseOrderForm.Status FROM (PurchaseOrderDetail INNER JOIN PurchaseOrderForm ON PurchaseOrderDetail.OrderID = PurchaseOrderForm.OrderID)"
            UpdateCommand="UPDATE PurchaseOrderForm SET Status = @Status WHERE OrderID = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
                <asp:Parameter Name="Status" Type="String"/>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="OrderID" CssClass="containerUpdateOrders" GridLines="None" cellspacing="15" HorizontalAlign="Center">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="Order #" SortExpression="OrderID" ReadOnly="true">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="OrderQty" HeaderText="Quantity" SortExpression="OrderQty" ReadOnly="true">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ProdID" HeaderText="Product ID" SortExpression="ProdID" ReadOnly="true">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Eval("Status") %>'>
                </asp:DropDownList>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Status] FROM [PurchaseOrderForm]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
