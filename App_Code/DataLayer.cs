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
            sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
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

        #region Catalog

        // This function gets Catalog information from the Product table
        public static dsCatalog GetCatalog(string Database, string search)
        {
            //declaring objects
            dsCatalog catalogDS;
            OleDbConnection sqlConn;
            OleDbDataAdapter sqlDA;

            //creating new DB connection
            sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
                "Data Source=" + Database);

            //creating new data adaptor to communicate with database. SQL statement is also given here.
            //If NULL then return all entries in DB. If !NULL then filter with WHERE clause

            if (string.IsNullOrEmpty(search))
            {
                sqlDA = new OleDbDataAdapter("select * from Product", sqlConn);
            }

            else
            {
                sqlDA = new OleDbDataAdapter("select * from Product where LastName = '" + search + "'", sqlConn);
            }

            //creating a new data set for collecting data
            catalogDS = new dsCatalog();

            //data collected from data adaptor is added to the data set for Personnel
            sqlDA.Fill(catalogDS.Product);

            //contents of the data set are returned to the application
            return catalogDS;
        }

        #endregion
    }