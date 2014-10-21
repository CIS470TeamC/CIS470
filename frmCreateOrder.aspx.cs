using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmCreateOrder : System.Web.UI.Page
{
    // Public var used by gvOrderLineItems_RowDataBound to
    // calculate order totals
    int total = 0;

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
        Session["OrderID"] = row.Cells[1].Text;
        gvOrderLineItems.Visible = true;
        tblAddItems.Visible = true;
    }
    protected void Insert(object sender, EventArgs e)
    {
        Session["OrderDate"] = DateTime.Now.ToString("MM/dd/yyyy");
        CurrentOrders.Insert();
    }
    protected void InsertLineItem(object sender, EventArgs e)
    {
        Session["ProdTotal"] = clsDataLayer.CalculateTotal(txtQuantity.Text, lbListPrice.Text);
        OrderLineItems.Insert();
        
    }
    protected void ddProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ProdID"] = ddProductID.SelectedValue.ToString();
    }
    protected void gvOrderLineItems_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblqty = (Label)e.Row.FindControl("lblqty");
            
            int qty = Int32.Parse(lblqty.Text.Substring(1,lblqty.Text.Length-4));
            
            total = total + qty;
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotalqty = (Label)e.Row.FindControl("lblTotalqty");
            lblTotalqty.Text = String.Format("{0:C}",total.ToString());
        }
        Session["OrderTotal"] = total;
        CurrentOrders.Update();
    }
    protected void btnPayOnDel_Command(object sender, CommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        string order;
        GridViewRow row = gvCurrentOrders.Rows[index];
        order = row.Cells[1].Text;
        Button btn = (Button)row.FindControl("btnPayOnDel");
        if (btn.Text == "True") 
        {
            //Logic for PayOnDel currently True; set it to false
            CurrentOrders_PayOnDel.UpdateCommand = "UPDATE [PurchaseOrderForm] SET [PayOnDel] = False WHERE [OrderID] = " + order;
        }
        else
        {
            //Logic for PayOnDel currently False; set it to true
            CurrentOrders_PayOnDel.UpdateCommand = "UPDATE [PurchaseOrderForm] SET [PayOnDel] = True WHERE [OrderID] = " + order;
        }
        CurrentOrders_PayOnDel.Update();
        
    }
}