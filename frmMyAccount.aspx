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











    </form>
</body>
</html>
