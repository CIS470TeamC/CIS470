<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMyAccount.aspx.cs" Inherits="frmMyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="frmMyAccount.aspx">
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
              <td>
                <div style="width: 100%; text-align:right;"><asp:LinkButton ID="lbtnCatalog" runat="server" CssClass="topMenuRight" OnClick="lbtnCatalog_Click">CATALOG</asp:LinkButton> 
              </div>
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

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  GridLines="None" cellspacing="15" DataKeyNames="AddressID" DataSourceID="SqlDataSource2"  HorizontalAlign="Center"  CssClass="container1">
            <Columns>
                <asp:CommandField ShowEditButton="True" EditText="Update"> <ControlStyle CssClass="btn" /></asp:CommandField>
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" InsertVisible="False" ReadOnly="True" SortExpression="AddressID" Visible="false" />
                <asp:BoundField DataField="AddressLine1" HeaderText=" Address " SortExpression="AddressLine1" />
                <asp:BoundField DataField="AddressLine2" HeaderText=" Address 2 " SortExpression="AddressLine2" />
                <asp:BoundField DataField="City" HeaderText=" City " SortExpression="City" />
                <asp:BoundField DataField="StateCode" HeaderText=" State " SortExpression="StateCode" />
                <asp:BoundField DataField="PostalCode" HeaderText=" Zip Code " SortExpression="PostalCode" />
            </Columns>
        </asp:GridView>
        





        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label1" runat="server" Text="BILLING INFORMATION" CssClass="declarePage"></asp:Label>
            
            </div>



     
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Customer] WHERE [UserID] = ?" 
            InsertCommand="INSERT INTO [Customer] ([CCNum], [CCExp], [CCPin], [CCType]) VALUES (?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Customer] WHERE [CustID] = @CustID" 
            UpdateCommand="UPDATE [Customer] SET [CCNum] = ?, [CCExp] = ?, [CCPin] = ?, [CCType] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CustID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustID" Type="Int32" />
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="String" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="CustID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="String" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
                <asp:Parameter Name="CustID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="CustID" cellspacing="15" DataSourceID="SqlDataSource3" HorizontalAlign="Center" CssClass="container2">
            <Columns>
                <asp:CommandField ShowEditButton="True" EditText="Update" > <ControlStyle CssClass="btn" /></asp:CommandField>
                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" Visible="false" />
                <asp:BoundField DataField="CCNum" HeaderText=" Card Number " SortExpression="CCNum" />
                <asp:BoundField DataField="CCExp" HeaderText=" Expiration Date " SortExpression="CCExp" />
                <asp:BoundField DataField="CCPin" HeaderText="Card Pin " SortExpression="CCPin" />
                <asp:BoundField DataField="CCType" HeaderText=" Card Type " SortExpression="CCType" />
            </Columns>
        </asp:GridView>



        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        
    <asp:Label ID="Label2" runat="server" Text="YOUR ORDERS" CssClass="declarePage"></asp:Label>
            
            </div>



    
        <asp:GridView ID="GridViewOrders" runat="server" cellspacing="15" GridLines="None"  AutoGenerateColumns="False" HorizontalAlign="Center" DataSourceID="SqlDataSource1" CssClass="container3">
            <Columns>
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate  " SortExpression="OrderDate"></asp:BoundField>
                <asp:BoundField DataField="CFName" HeaderText="First Name  " SortExpression="CFName"></asp:BoundField>
                <asp:BoundField DataField="CLName" HeaderText="Last Name  " SortExpression="CLName"></asp:BoundField>
                <asp:BoundField DataField="SalesOrderID" HeaderText="Sales Order #" InsertVisible="False" SortExpression="SalesOrderID">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="OrderQty" HeaderText="Qty  " SortExpression="OrderQty">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TotalDue" HeaderText="Total" DataFormatString="{0:C}" SortExpression="TotalDue">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PaidAmt" HeaderText="Amt Paid  " DataFormatString="{0:C}" SortExpression="PaidAmt">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="RemainingAmt" HeaderText="Remaining Amt  " DataFormatString="{0:C}" SortExpression="RemainingAmt">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>    
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
