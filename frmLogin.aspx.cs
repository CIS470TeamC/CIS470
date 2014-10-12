using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


public partial class frmLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            // Declaring object which will hold login info from the data set
            dsUser dsUserLogin;

            // Declaring variable which will hold security level
            string UserSecLevel;

            // Collecting the data entered into the form and storing it in an object
            dsUserLogin = DataLayer.VerifyUser(Server.MapPath(@"App_Data\SiteDB.accdb"),
                                Login1.UserName, Login1.Password);          

            // Security level formatted to string to pass to switch statement below
            UserSecLevel = dsUserLogin.Users[0].UserSecLevel.ToString();

            // Switch statement to handle the login scenarios and differing access levels
            switch (UserSecLevel)
            {

                case "1":
                    // Setting Customer if security passed is an 1
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["UserSecLevel"] = "1";
                    break;
                case "2":
                    // Setting Sales if security passed is an 2
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["UserSecLevel"] = "2";
                    break;
                case "3":
                    // Setting Ops Mgr if security passed is an 3
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["UserSecLevel"] = "3";
                    break;
                default:
                    e.Authenticated = false;
                    break;
            }          
        }   
}