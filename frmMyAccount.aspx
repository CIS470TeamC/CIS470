<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMyAccount.aspx.cs" Inherits="frmMyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <asp:HyperLink ID="Home" runat="server" NavigateUrl="frmCatalog.aspx">
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
        <asp:GridView ID="GridView1" runat="server" cellpadding="10" horizontalalign="Center" AutoGenerateColumns="False" DataSourceID="Accounts_DB" CssClass="fromTop , gridCustomer" CellSpacing="5"  >
            <Columns>
                <asp:BoundField DataField="CFName"  ShowHeader="False" SortExpression="CFName" />
                <asp:BoundField DataField="CLName"  ShowHeader="False" SortExpression="CLName" />
                <asp:BoundField DataField="CCType"  ShowHeader="False" SortExpression="CCType" />
                <asp:BoundField DataField="AddressLine1"  ShowHeader="False" SortExpression="AddressLine1" />
                <asp:BoundField DataField="AddressLine2"  ShowHeader="False" SortExpression="AddressLine2" />
                <asp:BoundField DataField="City"  ShowHeader="False" SortExpression="City" />
                <asp:BoundField DataField="StateCode"  ShowHeader="False" SortExpression="StateCode" />
                <asp:BoundField DataField="PostalCode"  ShowHeader="False" SortExpression="PostalCode" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Accounts_DB" runat="server" ConnectionString="<%$ ConnectionStrings:SiteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>" SelectCommand="SELECT Users.UserLogon, Customer.*, Address.*
FROM Address INNER JOIN (Users INNER JOIN Customer ON Users.UserID = Customer.UserID) ON Address.AddressID = Customer.AddressID
            WHERE (((Users.UserLogon)=@CustID))">
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="UserNameID" DefaultValue="0" />

            </SelectParameters>

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


        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SiteDBConnectionString %>' ProviderName='<%$ ConnectionStrings:SiteDBConnectionString.ProviderName %>' SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID) WHERE (((Users.UserLogon)=@CustID))">
            <SelectParameters>
                <asp:SessionParameter Name="CustID" SessionField="UserNameID" DefaultValue="0" />

            </SelectParameters>
        </asp:SqlDataSource>
  


        <table class="updateAcc">
          <tr>
            <td>
                <asp:Label ID="lblAddress1" runat="server" Text="Address: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:Label ID="lblCreditCardNumber" runat="server" Text="Card Number: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtCreditCardNumber" runat="server"></asp:TextBox>
              </td>
          </tr>
                      <tr>
            <td>
                <asp:Label ID="lblAddress2" runat="server" Text="Address 2: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
              </td>
                <td>
                <asp:Label ID="lblExp" runat="server" Text="Expiration Date: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtExp" runat="server"></asp:TextBox>
              </td>
          </tr>
            <tr>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="City: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
              </td>

            <td>
                <asp:Label ID="lblPin" runat="server" Text="Pin: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtPin" runat="server"></asp:TextBox>
              </td>
          </tr>
            <tr>
            <td>
                <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
              </td>
                <td>
                <asp:Label ID="lblType" runat="server" Text="Card Type: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
              </td>
          </tr>
                 <tr>
            <td>
                <asp:Label ID="lblZip" runat="server" Text="Zip Code: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
              </td>

          </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Update" />
                </td>
            </tr>
          
        </table>










    </form>
</body>
</html>
