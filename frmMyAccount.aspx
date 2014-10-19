<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMyAccount.aspx.cs" Inherits="frmMyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="public\Default.aspx">
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

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Address] WHERE [AddressID] = ?" 
            InsertCommand="INSERT INTO [Address] ([AddressID], [AddressLine1], [AddressLine2], [City], [StateCode], [PostalCode]) VALUES (?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Address] WHERE [AddressID] = @AddressID" 
            UpdateCommand="UPDATE [Address] SET [AddressLine1] = ?, [AddressLine2] = ?, [City] = ?, [StateCode] = ?, [PostalCode] = ? WHERE [AddressID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="AddressID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AddressID" Type="Int32" />
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateCode" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="AddressID" SessionField="AddressID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateCode" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="AddressID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AddressID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" InsertVisible="False" ReadOnly="True" SortExpression="AddressID" Visible="False" />
                <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
                <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" SortExpression="AddressLine2" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateCode" HeaderText="StateCode" SortExpression="StateCode" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
            </Columns>
        </asp:GridView>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="CreditCard" DataKeyNames="CustID">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" Visible="False" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" />
                <asp:BoundField DataField="CCNum" HeaderText="CCNum" SortExpression="CCNum" />
                <asp:BoundField DataField="CCExp" HeaderText="CCExp" SortExpression="CCExp" />
                <asp:BoundField DataField="CCPin" HeaderText="CCPin" SortExpression="CCPin" />
                <asp:BoundField DataField="CCType" HeaderText="CCType" SortExpression="CCType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CreditCard" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" 
            SelectCommand="SELECT [CFName], [CLName], [CCNum], [CCExp], [CCPin], [CCType], [CustID] FROM [Customer]
WHERE [CustID] = @CustID" DeleteCommand="DELETE FROM [Customer] WHERE [CustID] = ?" InsertCommand="INSERT INTO [Customer] ([CFName], [CLName], [CCNum], [CCExp], [CCPin], [CCType], [CustID]) VALUES (?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Customer] SET [CFName] = ?, [CLName] = ?, [CCNum] = ?, [CCExp] = ?, [CCPin] = ?, [CCType] = ? WHERE [CustID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CustID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CFName" Type="String" />
                <asp:Parameter Name="CLName" Type="String" />
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="DateTime" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
                <asp:Parameter Name="CustID" Type="Int32" />
            </InsertParameters>
                        <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="CustID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CFName" Type="String" />
                <asp:Parameter Name="CLName" Type="String" />
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="DateTime" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
                <asp:Parameter Name="CustID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridViewOrders" runat="server" cellspacing="15" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="fromTop , gridCustomer">
            <Columns>
                <asp:BoundField DataField="OrderDate" HeaderText="  OrderDate  " SortExpression="OrderDate"></asp:BoundField>
                <asp:BoundField DataField="CFName" HeaderText="  First Name  " SortExpression="CFName"></asp:BoundField>
                <asp:BoundField DataField="CLName" HeaderText="  Last Name  " SortExpression="CLName"></asp:BoundField>
                <asp:BoundField DataField="SalesOrderID" HeaderText="  SalesOrder  " InsertVisible="False" SortExpression="SalesOrderID"></asp:BoundField>
                <asp:BoundField DataField="ProdID" HeaderText="  ProdID  " SortExpression="ProdID"></asp:BoundField>
                <asp:BoundField DataField="OrderQty" HeaderText="  Qty  " SortExpression="OrderQty"></asp:BoundField>
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="  PayOnDel  " SortExpression="PayOnDel"></asp:CheckBoxField>
                <asp:BoundField DataField="TotalDue" HeaderText="  TotalDue  " SortExpression="TotalDue"></asp:BoundField>
                <asp:BoundField DataField="PaidAmt" HeaderText="  Amt Paid  " SortExpression="PaidAmt"></asp:BoundField>
                <asp:BoundField DataField="RemainingAmt" HeaderText="  Remaining Amt  " SortExpression="RemainingAmt"></asp:BoundField>    
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SiteDBConnectionString %>' ProviderName='<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>' 
            SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID) WHERE (((Users.UserLogon)=@CustID))">
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="UserNameID" DefaultValue="0" />

            </SelectParameters>
        </asp:SqlDataSource>





    </form>
</body>
</html>
