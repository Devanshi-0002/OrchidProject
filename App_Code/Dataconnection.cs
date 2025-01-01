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
/// Summary description for Dataconnection
/// </summary>

namespace Dataacces
{
public class Dataconnection
{
    public static string connstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
       SqlConnection objcon = new SqlConnection(connstring);
       SqlCommand objcmd = new SqlCommand();

       public bool Opencon()
       {
           try
           {
               if (objcon.State == ConnectionState.Closed)
               {
                   objcon.Open();
               }
               objcmd.Connection = objcon;
               return true;
           }
           catch (Exception ex) { throw new Exception("Error: In Open connesction"); return false; }
       }

       public bool Closecon()
       {
           try
           {
               if (objcon.State == ConnectionState.Open)
               {
                   objcon.Close();
               }
               objcmd.Dispose();
               return true;
           }
           catch (Exception ex) { throw new Exception("Error: In Close connesction"); return false; }
       }

       public static int ExecuteQuery(SqlCommand sqlcmd)
       {
           try
           {
               Dataconnection objdc = new Dataconnection();
               int affectedrecord = 0;
               if (objdc.Opencon() == true)
               {
                   sqlcmd.Connection = objdc.objcon;
                   sqlcmd.CommandTimeout = 150000;
                   affectedrecord = sqlcmd.ExecuteNonQuery();
                   objdc.Closecon();
                   objdc = null;
                   return affectedrecord;
               }
               else { return affectedrecord; }

           }
           catch (Exception ex) { throw ex;/* new Exception("Error: In ExecuteNonquery");*/ }

       }

       public static DataTable Generatedatatable(SqlCommand sqlcmd)
       {
           try
           {
               Dataconnection objdc = new Dataconnection();

               if (objdc.Opencon() == true)
               {
                   sqlcmd.Connection = objdc.objcon;
                   SqlDataReader dr;
                   DataTable objdt = new DataTable();
                   dr = sqlcmd.ExecuteReader();
                   objdt.Load(dr);
                   objdc.Closecon();
                   objdc = null;
                   return objdt;
               }
               else { return null; }
           }
           catch (Exception Exception) { throw Exception /*new Exception("Error: In Generatedatatable")*/; }
       }
       public DataSet RetrieveRecords(DataSet ds, SqlCommand cmd)
       {
           try
           {
               cmd.Connection = objcon;
               cmd.CommandTimeout = 150000;
               SqlDataAdapter da = new SqlDataAdapter(cmd);
               Opencon();
               da.Fill(ds);
               return ds;
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               Closecon();
           }
       }
       public DataTable RetrieveRecordsdt(DataTable dt, SqlCommand cmd)
       {
           try
           {
               cmd.Connection = objcon;
               cmd.CommandTimeout = 160000;
               SqlDataAdapter da = new SqlDataAdapter(cmd);
               Opencon();
               da.Fill(dt);
               return dt;
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               Closecon();
           }
       }
       public void FillGV(GridView gv, SqlCommand cmd)
       {
           try
           {
               DataSet ds = new DataSet();
               Opencon();
               cmd.Connection = objcon;
               RetrieveRecords(ds, cmd);
               gv.DataSource = ds;
               gv.DataBind();
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               Closecon();
           }
       }

       public static int Executescalar(SqlCommand sqlcmd)
       {
           try
           {
               Dataconnection objdc = new Dataconnection();
               int affectedrecord = 0;
               if (objdc.Opencon() == true)
               {
                   sqlcmd.Connection = objdc.objcon;
                   affectedrecord = Convert.ToInt16(sqlcmd.ExecuteScalar());
                   objdc.Closecon();
                   objdc = null;
                   return affectedrecord;
               }
               else { return affectedrecord; }

           }
           catch (Exception ex) { throw ex;/* new Exception("Error: In ExecuteNonquery");*/ }

       }
       internal int InsertToPurchaseItems()
       {
           throw new NotImplementedException();
       }

       internal int RegistrationByUser()
       {
           throw new NotImplementedException();
       }

       internal static void ExecuteQuery()
       {
           throw new NotImplementedException();
       }
}
}