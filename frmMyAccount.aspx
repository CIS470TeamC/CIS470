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
                  <asp:TextBox ID="txtExp" runat="server" Width="75px"></asp:TextBox>
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
                  <asp:TextBox ID="txtPin" runat="server" Width="75px"></asp:TextBox>
              </td>
          </tr>
            <tr>
            <td>
                <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
            </td>
              <td>
                  <asp:DropDownList ID="ddlListState" runat="server">
	<asp:ListItem Value="AL">Alabama</asp:ListItem>
	<asp:ListItem Value="AK">Alaska</asp:ListItem>
	<asp:ListItem Value="AZ">Arizona</asp:ListItem>
	<asp:ListItem Value="AR">Arkansas</asp:ListItem>
	<asp:ListItem Value="CA">California</asp:ListItem>
	<asp:ListItem Value="CO">Colorado</asp:ListItem>
	<asp:ListItem Value="CT">Connecticut</asp:ListItem>
	<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	<asp:ListItem Value="DE">Delaware</asp:ListItem>
	<asp:ListItem Value="FL">Florida</asp:ListItem>
	<asp:ListItem Value="GA">Georgia</asp:ListItem>
	<asp:ListItem Value="HI">Hawaii</asp:ListItem>
	<asp:ListItem Value="ID">Idaho</asp:ListItem>
	<asp:ListItem Value="IL">Illinois</asp:ListItem>
	<asp:ListItem Value="IN">Indiana</asp:ListItem>
	<asp:ListItem Value="IA">Iowa</asp:ListItem>
	<asp:ListItem Value="KS">Kansas</asp:ListItem>
	<asp:ListItem Value="KY">Kentucky</asp:ListItem>
	<asp:ListItem Value="LA">Louisiana</asp:ListItem>
	<asp:ListItem Value="ME">Maine</asp:ListItem>
	<asp:ListItem Value="MD">Maryland</asp:ListItem>
	<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	<asp:ListItem Value="MI">Michigan</asp:ListItem>
	<asp:ListItem Value="MN">Minnesota</asp:ListItem>
	<asp:ListItem Value="MS">Mississippi</asp:ListItem>
	<asp:ListItem Value="MO">Missouri</asp:ListItem>
	<asp:ListItem Value="MT">Montana</asp:ListItem>
	<asp:ListItem Value="NE">Nebraska</asp:ListItem>
	<asp:ListItem Value="NV">Nevada</asp:ListItem>
	<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	<asp:ListItem Value="NM">New Mexico</asp:ListItem>
	<asp:ListItem Value="NY">New York</asp:ListItem>
	<asp:ListItem Value="NC">North Carolina</asp:ListItem>
	<asp:ListItem Value="ND">North Dakota</asp:ListItem>
	<asp:ListItem Value="OH">Ohio</asp:ListItem>
	<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	<asp:ListItem Value="OR">Oregon</asp:ListItem>
	<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	<asp:ListItem Value="SC">South Carolina</asp:ListItem>
	<asp:ListItem Value="SD">South Dakota</asp:ListItem>
	<asp:ListItem Value="TN">Tennessee</asp:ListItem>
	<asp:ListItem Value="TX">Texas</asp:ListItem>
	<asp:ListItem Value="UT">Utah</asp:ListItem>
	<asp:ListItem Value="VT">Vermont</asp:ListItem>
	<asp:ListItem Value="VA">Virginia</asp:ListItem>
	<asp:ListItem Value="WA">Washington</asp:ListItem>
	<asp:ListItem Value="WV">West Virginia</asp:ListItem>
	<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	<asp:ListItem Value="WY">Wyoming</asp:ListItem>
</asp:DropDownList>
              </td>
                <td>
                <asp:Label ID="lblType" runat="server" Text="Card Type: "></asp:Label>
            </td>
              <td>
                  <asp:DropDownList ID="ddlType" runat="server">
                      <asp:ListItem Value="Mastercard">Mastercard</asp:ListItem>
                      <asp:ListItem Value="Visa">Visa</asp:ListItem>
                      <asp:ListItem Value="American Express">American Express</asp:ListItem>
                      <asp:ListItem Value="Discover">Discover</asp:ListItem>
                  </asp:DropDownList>
              </td>
          </tr>
                 <tr>
            <td>
                <asp:Label ID="lblZip" runat="server" Text="Zip Code: "></asp:Label>
            </td>
              <td>
                  <asp:TextBox ID="txtZip" runat="server" Width="75px"></asp:TextBox>
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
