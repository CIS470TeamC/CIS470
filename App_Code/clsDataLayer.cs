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
    /*
    public void UpdateAddress(string Address1, string Address2, string city, string state, string zip, string AddressID)
    {



        try
        {
            HttpContext.Current.Session["UserNameID"] = AddressID;

            // new connection
            OleDbConnection sqlConn = new OleDbConnection(clsDataLayer.GetDataConnection());
            sqlConn.Open();

            // new commands for connection
            OleDbCommand oCommand = new OleDbCommand();
            oCommand.Connection = sqlConn;
            string stmt = "UPDATE Address SET AddressLine1 = @address1, " +
            "City = @city, StateCode = @state, PostalCode = @zip" +
            " WHERE (Users.AddressId = @id)";


            OleDbParameter param;

            param = new OleDbParameter();
            param.ParameterName = "@Address1";
            param.Value = Address1;
            oCommand.Parameters.Add(param);

            param = new OleDbParameter();
            param.ParameterName = "@Address2";
            param.Value = Address2;
            oCommand.Parameters.Add(param);

            param = new OleDbParameter();
            param.ParameterName = "@city";
            param.Value = city;
            oCommand.Parameters.Add(param);

            param = new OleDbParameter();
            param.ParameterName = "@state";
            param.Value = state;
            oCommand.Parameters.Add(param);

            param = new OleDbParameter();
            param.ParameterName = "@zip";
            param.Value = zip;
            oCommand.Parameters.Add(param);

            param = new OleDbParameter();
            param.ParameterName = "@ID";
            param.Value = AddressID;
            oCommand.Parameters.Add(param);


            oCommand.CommandText = stmt;
            oCommand.CommandType = CommandType.Text;

            oCommand.ExecuteNonQuery();

            // closing connection
            sqlConn.Close();

        }
        catch
        {

        }
    }
    */
}