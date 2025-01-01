using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Zenithholidays;

public partial class my_profile : System.Web.UI.Page
{
    DbConnect dc = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
            {
                div_showedit.Visible = false;
                ShoeBookingDetails();
                username.InnerText = Session["Emp_FirstName"].ToString();
                usermailid.InnerText = Session["Emailid"].ToString();
                userMobileno.InnerText = Session["Phone_no"].ToString();
            }
            else
            {
                Session.Clear();
                Session.RemoveAll();
                Response.Redirect("Default.aspx");
            }
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
            dc.dt.Rows.Add("@p_SubOpMode", 2);
            DataSet dss = new DataSet();
            dc.pfn_GetData("sp_tbl_Online_BookingDetails", ref dss);
            if (dss.Tables[0].Rows.Count > 0)
            {
                txt_firstname.Value = dss.Tables[0].Rows[0]["Emp_FirstName"].ToString();
                txt_lastsname.Value = dss.Tables[0].Rows[0]["Emp_LastName"].ToString();
                txt_email.Value = dss.Tables[0].Rows[0]["Emailid"].ToString();
                txt_password.Value = dss.Tables[0].Rows[0]["UserPassword"].ToString();
                txt_phone.Value = dss.Tables[0].Rows[0]["Phone_no"].ToString();
                txt_state.Value = dss.Tables[0].Rows[0]["States"].ToString();
                txt_city.Value = dss.Tables[0].Rows[0]["City"].ToString();
                txt_pincode.Value = dss.Tables[0].Rows[0]["Zipcode"].ToString();
                txt_address.Value = dss.Tables[0].Rows[0]["Addresss"].ToString();
            }
            else
            {
                dss.Clear();
                txt_firstname.Value = "";
                txt_lastsname.Value = "";
                txt_email.Value = "";
                txt_password.Value = "";
                txt_phone.Value = "";
                txt_state.Value = "";
                txt_city.Value = "";
                txt_pincode.Value = "";
                txt_address.Value = "";
            }
        }
        catch (Exception ex) { throw ex; }
    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        div_showedit.Visible = true;
    }
    protected void lnkbtn_Cancel_Click(object sender, EventArgs e)
    {
        div_showedit.Visible = false;
    }
    protected void lnkbtn_editSave_Click(object sender, EventArgs e)
    {
        try
        {
            string m_sMessage = "";
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@p_SubOpMode", 1);
            dc.dt.Rows.Add("@First_Name", txt_firstname.Value);
            dc.dt.Rows.Add("@Last_Name", txt_lastsname.Value);
            dc.dt.Rows.Add("@Emailid", txt_email.Value);
            dc.dt.Rows.Add("@Country", ddl_Country.SelectedItem.Text);
            dc.dt.Rows.Add("@UserPassword", txt_password.Value);
            dc.dt.Rows.Add("@Phone_number", txt_phone.Value);
            dc.dt.Rows.Add("@States", txt_state.Value);
            dc.dt.Rows.Add("@City", txt_city.Value);
            dc.dt.Rows.Add("@Zipcode", txt_pincode.Value);
            dc.dt.Rows.Add("@Addresss", txt_address.Value);
            m_sMessage = dc.OperateData("sp_tbl_Online_BookingDetails", (int)Operation.Update);
            if (m_sMessage.IndexOf("Error") != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Update Successfully')", true);
            }
            else
            {
                throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
            }
        }
        catch (Exception ex) { throw ex; }
    }   
}