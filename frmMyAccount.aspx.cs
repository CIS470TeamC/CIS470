using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Data.OleDb;
using System.Configuration;
using System.Web.SessionState;



public partial class frmMyAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("..\frmLogin.aspx");
        }
            
        
        
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;
        Session["UserNameID"] = null;
        Session["AddressID"] = null;

        Response.Redirect("public/default.aspx");
        
    }
    protected void lbtnCatalog_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/public/frmCatalog.aspx");
    }
        
    
}