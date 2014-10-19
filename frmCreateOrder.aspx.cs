using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmCreateOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("frmLogin.aspx");
        }
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;
        Session["UserNameID"] = null;
        Session["AddressID"] = null;

        Response.Redirect("public/default.aspx");
    }
    protected void gvCurrentOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = gvCurrentOrders.SelectedRow;

        // Display the first name from the selected row.
        // In this example, the third column (index 2) contains
        // the first name.
        Session["OrderID"] = row.Cells[2].Text;
    }
    protected void Insert(object sender, EventArgs e)
    {
        CurrentOrders.Insert();
    }
    protected void InsertLineItem(object sender, EventArgs e)
    {
        OrderLineItems.Insert();
    }
}