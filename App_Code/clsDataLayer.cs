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

    #region Update Account
    public static bool UpdateAccount(string Database, string AddressID, string AddressLine1,
                                         string AddressLine2, string City, string StateCode, string PostalCode)
    {

        bool recordSaved;

        // Declaring trnasaction object and initializing to NULL
        OleDbTransaction myTransaction = null;

        try
        {
            // Creating new DB connection object
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;" +
                                                       "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            // Beginning of transaction
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            // SQL statement for inserting passed values
            strSQL = "Insert into Address " +
                 "(AddressLine1, AddressLine2, City, StateCode, PostalCode) values ('" +
                 AddressID + "', '" + AddressLine1 + "', '" + AddressLine2 + "', '" + City + "', '" + StateCode + "', '" + PostalCode + "')";

            // Contains the text of the SQL query above in text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;

            // Queries against the DB and returns rows affected
            command.ExecuteNonQuery();

            // SQL statement for updating the specified columns with passed values
            strSQL = "Update Address " +
                     "Set AddressID=" + AddressID + ", " +
                     "AddressLine1='" + AddressLine1 + "', " +
                     "AddressLine2='" + AddressLine2 + "' " +
                     "City='" + City + "' " +
                     "StateCode='" + StateCode + "' " +
                     "PostalCode='" + PostalCode + "' " +
                     "Where (((Users.UserLogon)=@CustID)))";

            // Contains the text of the SQL query above in text
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;

            // Queries against the DB and returns rows affected
            command.ExecuteNonQuery();

            // Saving the transaction with a COMMIT statement
            myTransaction.Commit();

            // Closing the connection
            conn.Close();
            recordSaved = true;
        }
        catch (Exception ex)
        {

            // Rollback of transaction if validation is not passed
            myTransaction.Rollback();

            recordSaved = false;

        }

        return recordSaved;
    }





    #endregion
}