﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null || Session["UserNameID"] == null || Session["AddressID"] == null)
        {
            lblLogin.Visible = true;
            lbtnLogout.Visible = false;
        }
        else
        {
            lbtnLogout.Visible = true;
            lblLogin.Visible = false;
        }






    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {

        Session["SecurityLevel"] = null;
        Session["UserNameID"] = null;
        Session["AddressID"] = null;
        Response.Redirect("public/default.aspx");
    }
}