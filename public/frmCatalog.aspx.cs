using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmCatalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null || Session["UserNameID"] == null || Session["AddressID"] == null)
        {
            lbtnMyAccount.Visible = false;
            lbtnLogout.Visible = false;
        }
        else
        {
            lbtnLogout.Visible = true;
            lblLogin.Visible = false;
        }
    }

    protected void lbtnMyAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmMyAccount.aspx");
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;
        Session["UserNameID"] = null;
        Session["AddressID"] = null;
        Response.Redirect("default.aspx");
    }
    
}