using System;
using System.Collections.Generic;

using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DAL_Global
/// </summary>
public class DAL_Global
{
	public DAL_Global()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    /// <summary>
    /// Fill Financial Year With Select Item
    /// </summary>
    /// <param name="DDlfinyr"></param>
    ///
   
    public void FillfinnancialYear(ref DropDownList DDlfinyr)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT [year_Id], [Financial_Year] FROM [Accounting_year] ORDER BY Financial_Year DESC");
            cmd.CommandType = CommandType.Text;

            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);

            DDlfinyr.DataSource = ds;
            DDlfinyr.DataTextField = "Financial_Year";
            DDlfinyr.DataValueField = "Financial_Year";
            DDlfinyr.DataBind();
            DDlfinyr.Items.Insert(0, "Select Year");
        }
        catch (Exception ex) { throw ex; }
    }
    /// <summary>
    /// Select LIVE Financial Year
    /// </summary>
    public string SelectLivefinancialYear()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT [Financial_Year] FROM [Accounting_year] WHERE STATUS='LIVE'");
            cmd.CommandType = CommandType.Text;

            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            string FinancialYear = ds.Rows[0][0].ToString();
            return FinancialYear;
        }
        catch (Exception ex) { throw ex; }
    }
    /// <summary>
    /// Select LIVE Financial Year Dates: 0 for year, 1 for From_Date, 2 for To_Date
    /// </summary>
    public static DataTable SelectLivefinancialYearDates()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT [Financial_Year],[From_Date],[To_Date] FROM [Accounting_year] WHERE STATUS='LIVE'");
            cmd.CommandType = CommandType.Text;

            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            //string FinancialYear = ds.Rows[0][0].ToString();
            return ds;
        }
        catch (Exception ex) { throw ex; }
    }
    /// <summary>
    /// Select LIVE Financial Year Dates: 0 for year, 1 for From_Date, 2 for To_Date by FINANCIAL yEAR
    /// </summary>
    public static DataTable SelectfinancialYearDates( string FINYEAR)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT [Financial_Year],[From_Date],[To_Date] FROM [Accounting_year] WHERE Financial_Year='" + FINYEAR + "'");
            cmd.CommandType = CommandType.Text;

            DataTable ds = new DataTable();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            ds = dt.RetrieveRecordsdt(ds, cmd);
            //string FinancialYear = ds.Rows[0][0].ToString();
            return ds;
        }
        catch (Exception ex) { throw ex; }
    }
}