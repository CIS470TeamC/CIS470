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

    }

    protected void lbtnMyAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmMyAccount.aspx");
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;


        Response.Redirect("public/default.aspx");
    }
    
}