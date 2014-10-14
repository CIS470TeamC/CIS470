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
     /*   if (Session["SecurityLevel"] == null)
        {
            Response.Redirect("..\frmLogin.aspx");
        }
            
        else
        {

            
            String thisCustomer = Session["UserNameID"].ToString();
            
            dsCustomers myDataSet = new dsCustomers();
            myDataSet = clsDataLayer.GetCustomer(Server.MapPath("database/SiteDB.accdb"), thisCustomer);
            grdThisCustomer.DataSource = myDataSet.Tables["CustomerTable"];
            grdThisCustomer.DataBind();

            
        }

        */
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;


        Response.Redirect("public/default.aspx");
    }
    
        

        

        
    
}