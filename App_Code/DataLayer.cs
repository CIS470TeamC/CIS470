using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//adding using statements to manage datasources
using System.Data.OleDb;
using System.Net;
using System.Data;



    public class DataLayer
    {

        #region User Login

        // This function verifies a user in the Users table
        public static dsUser VerifyUser(string Database, string UserName, string UserPassword)
        {
            //Declaring objects for DB connection
            dsUser DS;
            OleDbConnection sqlConn;
            OleDbDataAdapter sqlDA;

            // Creating new DB connection
            sqlConn = new OleDbConnection("Microsoft.ACE.OLEDB.12.0;" +
                                          "Data Source=" + Database);

            // Creating new data adaptor to communicate with database. SQL statement is also given here
            sqlDA = new OleDbDataAdapter("Select UserSecLevel from Users " +
                                          "where UserLogon like '" + UserName + "' " +
                                          "and UserPassword like '" + UserPassword + "'", sqlConn);

            // Creating a new data set for collecting data
            DS = new dsUser();

            // Data collected from data adaptor is added to the data set for User Login
            sqlDA.Fill(DS.Users);

            // Contents of the data set are returned to the application
            return DS;

        }

        #endregion
    }