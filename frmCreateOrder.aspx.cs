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


        Response.Redirect("public/default.aspx");
    }
}