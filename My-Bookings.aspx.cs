using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using Zenithholidays;
public partial class My_Bookings : System.Web.UI.Page
{
    DbConnect dc = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
        {
            ShoeBookingDetails();
        }
        else
        {
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("Default.aspx");

        }
    }
    public void ShoeBookingDetails()
    {
        try
        {
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@Emailid", Session["Emailid"].ToString());
            dc.dt.Rows.Add("@UserPassword", Session["UserPassword"].ToString());
            dc.dt.Rows.Add("@p_SubOpMode", 1);
            DataSet ds = new DataSet();
            dc.pfn_GetData("sp_tbl_Online_BookingDetails", ref ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GV_mybooking.DataSource = ds;
                GV_mybooking.DataBind();
            }
            else
            {
                ds = null;
                GV_mybooking.DataSource = ds;
                GV_mybooking.DataBind();
            }
        }
        catch (Exception ex) { throw ex; }
    }
}