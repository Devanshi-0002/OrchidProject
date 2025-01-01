using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for DbConnect
/// </summary>

namespace Orchidholidays
{
 public enum Operation {
   Insert = 1,
   Update = 2,
   Delete = 3,
   Select = 4
 }
 public class DbConnect {
  public DataTable dt = null;
  public readonly SqlConnection con;
  #region User Defined Functions
  public DbConnect() {
      var conString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringStatic"].ConnectionString;
    con = new SqlConnection(conString);
    dt = null;
    dt = new DataTable();
    dt.Columns.Add("COLUMN", typeof(string));
    dt.Columns.Add("VALUE", typeof(object));
   }
   //For Insert , Update,Delete Operation
  public void RunTable(string qrystring) {
    try {
     con.Open();
     SqlCommand m_SqlComm = new SqlCommand(qrystring, con);
     m_SqlComm.ExecuteNonQuery();
     con.Close();
    } catch {}
   }
   // To run SELECT query
  public DataTable RunSelectQuery(string QueryString) {
    try {
     DataTable m_DataTbl = new DataTable();
     con.Open();
     SqlDataAdapter m_SqlDataAdp = new SqlDataAdapter(QueryString, con);
     m_SqlDataAdp.Fill(m_DataTbl);
     con.Close();
     return m_DataTbl;
    } catch {
     return null;
    }
   }
   //SQL Stored Procedure Insert operation. Accept Stored Procedure(SP) name, Column name & Values in a DataTable and return message as string
  public string OperateData(string sProcedureName, int iOperation) {
    try {
     //Open Connection
     con.Open();

     //Declare & assign SQL Command
     SqlCommand m_SqlComm = new SqlCommand(sProcedureName, con);
     m_SqlComm.CommandType = CommandType.StoredProcedure;
     m_SqlComm.CommandTimeout = 60;

     //Assign SQL Stored Procedure(SP) column and value
     foreach(DataRow m_Item in dt.Rows) {
      m_SqlComm.Parameters.AddWithValue(Convert.ToString(m_Item["COLUMN"]), m_Item["VALUE"]);
     }

     //@p_OpMode = 1 mean it run insert operation which is already declared in SQL Stored Procedure(SP)
     m_SqlComm.Parameters.AddWithValue("@p_OpMode", iOperation);

     //Assign & Get the message from SQL Stored Procedure
     m_SqlComm.Parameters.Add("@p_Message", SqlDbType.VarChar, 4000);
     m_SqlComm.Parameters["@p_Message"].Direction = ParameterDirection.Output;

     m_SqlComm.ExecuteNonQuery();
     con.Close();
     return Convert.ToString(m_SqlComm.Parameters["@p_Message"].Value);

    } catch (Exception ex) {
     throw ex;
    } finally {
     con.Close();
    }
   }
   //Get the data
  public string pfn_GetData(string p_sProcedureName, ref DataSet p_dsProcedureTables) {
   try {
    //Open Connection
    con.Open();

    //Declare & assign SQL Command
    SqlCommand m_SqlComm = new SqlCommand(p_sProcedureName, con);
    m_SqlComm.CommandType = CommandType.StoredProcedure;
    m_SqlComm.CommandTimeout = 60;

    //Assign SQL Stored Procedure(SP) column and value
    foreach(DataRow m_Item in dt.Rows) {
     m_SqlComm.Parameters.AddWithValue(Convert.ToString(m_Item["COLUMN"]), m_Item["VALUE"]);
    }

    //@p_OpMode = 4 mean it run select operation which is already declared in SQL Stored Procedure(SP)
    m_SqlComm.Parameters.AddWithValue("@p_OpMode", (int) Operation.Select);

    //Assign & Get the message from SQL Stored Procedure
    m_SqlComm.Parameters.Add("@p_Message", SqlDbType.VarChar, 4000);
    m_SqlComm.Parameters["@p_Message"].Direction = ParameterDirection.Output;

    SqlDataAdapter m_SqlDataAdapter = new SqlDataAdapter(m_SqlComm);
    m_SqlDataAdapter.Fill(p_dsProcedureTables);
    m_SqlComm.ExecuteNonQuery();
    con.Close();
    return Convert.ToString(m_SqlComm.Parameters["@p_Message"].Value);
   } catch (Exception ex) {
    throw ex;
   } finally {
    con.Close();
   }
  }

  #endregion
 }
}