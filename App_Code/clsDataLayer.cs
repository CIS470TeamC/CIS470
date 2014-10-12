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
    /*********************************/

    
}