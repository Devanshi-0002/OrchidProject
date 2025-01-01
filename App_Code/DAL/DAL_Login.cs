using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
public class DAL_Login
{
	public DAL_Login()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static DataSet ValidateLogin(BE_Login proplogin)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Show_ValidateLogin");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Login_Id", proplogin.LoginId);
            cmd.Parameters.AddWithValue("@Password",proplogin.UserPassword);
            DataSet dtb = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecords(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataSet Validate_OnlineUserLogin(BE_Login pponln)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Show_ValidateOnlineUserLogin");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emailid", pponln.Emailid);
            //cmd.Parameters.AddWithValue("@Phone_no", pponln.Mobileno);
            cmd.Parameters.AddWithValue("@UserPassword", pponln.UserPassword);
            DataSet dtb = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecords(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }

    }
    public static DataSet Validate_LoginAfterPayment(string email, string mob, string firstname)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Show_ValidateLogin_AfterPayment");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Emailid", email);
            cmd.Parameters.AddWithValue("@Phone_no", mob);
            cmd.Parameters.AddWithValue("@Emp_FirstName", firstname);
            DataSet dtb = new DataSet();
            Dataacces.Dataconnection dt = new Dataacces.Dataconnection();
            dtb = dt.RetrieveRecords(dtb, cmd);
            return dtb;
        }
        catch (Exception ex) { throw ex; }

    }
}