/*--------------------------------------------
Program name: Williams Specialty Company (WSC)
eCommerce Web Site
Developer: Daniel Patterson, Andrew Kalman, Christopher Knight, Cody Roberts, Kevin Borja
Date Written: September 1, 2014
Purpose: Williams Specialty Company (WSC) has requested an eCommerce Web Site that can be 
 * used by the customer to input order information. They are also requesting that their entire 
 * catalog be published to this website for customers to view online. The website will provide a good 
 * foundation for WSC to establish a web presence with their new/existing customers.
--------------------------------------------*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

/// <summary>
/// Summary description for clsDataLayer
/// </summary>
public class clsDataLayer
{
	public clsDataLayer()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public static string GetDataConnection()
    {

        string connString = string.Empty;

        connString = ConfigurationManager.ConnectionStrings["SiteDBConnectionString"].ConnectionString;

        return connString;

    }

    #region Verify User
    public static dsUsers VerifyUser(string Database, string UserName, string UserPassword)
    {
        
        dsUsers DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        
        sqlConn = new OleDbConnection(clsDataLayer.GetDataConnection());

      
        sqlDA = new OleDbDataAdapter("Select UserSecLevel from Users " +
                                      "where UserLogon like '" + UserName + "' " +
                                      "and UserPassword like '" + UserPassword + "'", sqlConn);

 
        DS = new dsUsers();
        sqlDA.Fill(DS.Users);
        return DS;

    }
#endregion

    #region Address Info

    public static dsCustomers GetAddressInfo(string Database, string UserLogon)
    {
        dsCustomers DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;


        sqlConn = new OleDbConnection(clsDataLayer.GetDataConnection());

        sqlDA = new OleDbDataAdapter("SELECT Customer.* FROM Users INNER JOIN Customer ON Users.UserID = Customer.UserID WHERE (((Users.UserLogon)= '" + UserLogon + "'))" , sqlConn);

        DS = new dsCustomers();
        sqlDA.Fill(DS.Customer);
        return DS;
    }
    #endregion
}