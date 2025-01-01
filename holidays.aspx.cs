using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using Zenithholidays;
using System.Web.Configuration;
using System.Net.Mail;
using System.Text;
using System.Net;

public partial class holidays : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Show_RecommendedHolidays();
            //Session["timeout"] = DateTime.Now.AddMinutes(120).ToString();
        }
        //if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
        //{
           
        //}
        //else
        //{
            
        //}
    }
    //public void Show_RecommendedHolidays()
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("FillAll_Destination");//FillAll_Destination Show_PackagegDetails_New
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@Destination", " ");
    //        //cmd.Parameters.AddWithValue("@Destination", " ");Repeater1
    //        DataTable dsd = new DataTable();
    //        Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
    //        dsd = dts.RetrieveRecordsdt(dsd, cmd);
    //        if (dsd.Rows.Count > 0)
    //        {
    //            DataListDomestic.DataSource = dsd;
    //            DataListDomestic.DataBind();
    //        }
    //        else
    //        {
    //            dsd = null;
    //            DataListDomestic.DataSource = dsd;
    //            DataListDomestic.DataBind();
    //        }
    //    }
    //    catch (Exception ex) { throw ex; }
    //}
    protected void lnkbtn_FeaturedDestinations_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)sender;
        if (lnkbtn.CommandArgument.ToString() != "")
        {
            string id = lnkbtn.CommandArgument;
            Response.Redirect("Destinations?Zenith=" + id.Trim());
        }
    }
    public void Check_DestinationsnSearch()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillAll_Destination_Search");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Destination", txtdestination.Text.TrimStart());
            DataTable dss = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dss = dts.RetrieveRecordsdt(dss, cmd);
            if (dss.Rows.Count > 0)
            {
                destinationtype.InnerText = dss.Rows[0]["DestinationType"].ToString();

            }
            else
            {
                dss = null;
            }
        }
        catch (Exception ex) { throw ex; }
    }
    protected void linkbtn_search_Click(object sender, EventArgs e)
    {
        Check_DestinationsnSearch();
        if (destinationtype.InnerText == "International")
        {
            Response.Redirect("international-holidays.aspx?destination=" + txtdestination.Text.TrimStart());
        }
        else if (destinationtype.InnerText == "Domestic")
        {
            Response.Redirect("holidays-in-india.aspx?destination=" + txtdestination.Text.TrimStart());
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Coming Soon..')", true);
        }
    }
    protected void lnkbtnAndaman_Click(object sender, EventArgs e)
    {
        //LinkButton lnkbtn = (LinkButton)sender;
        //if (lnkbtn.CommandArgument.ToString() != "")
        //{
        //    string id = lnkbtn.CommandArgument;
        Response.Redirect("holidays-in-india.aspx?destination=" + "Andaman");
        //}
    }
    protected void LinkButton_Ladakh_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Ladakh");
    }
    protected void LinkButton_Kerala_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Kerala");
    }
    protected void LinkButton_Goa_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Goa");
    }
    protected void LinkButton_Rajasthan_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Rajasthan");
    }
    protected void LinkButton_Kashmir_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Kashmir");
    }
    protected void LinkButton_GoldenTriangle_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Golden Triangle");
    }
    protected void LinkButton_Darjeelingandsikkim_Click(object sender, EventArgs e)
    {
        Response.Redirect("holidays-in-india.aspx?destination=" + "Darjeeling and Sikkim");
    }

    //-----------------------------------international package----------------------------------
    protected void LinkButton_Dubai_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Dubai");
    }
    protected void LinkButton_Bhutan_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Bhutan");
    }
    protected void LinkButton_Bangkok_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Bangkok");
    }
    protected void LinkButton_Thailand_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Thailand");
    }
    protected void LinkButton_Bali_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Bali");
    }
    protected void LinkButton_Singapore_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Singapore");
    }
    protected void LinkButton_Europe_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Europe");
    }
    protected void LinkButton_Srilanka_Click(object sender, EventArgs e)
    {
        Response.Redirect("international-holidays.aspx?destination=" + "Srilanka");
    }
    //protected void timer1_tick(object sender, EventArgs e)
    //{
    //    if (0 > DateTime.Compare(DateTime.Now,
    //    DateTime.Parse(Session["timeout"].ToString())))
    //    {
    //        lblTimer.Text = "Number of Minutes Left: " +
    //        ((Int32)DateTime.Parse(Session["timeout"].
    //        ToString()).Subtract(DateTime.Now).TotalMinutes).ToString();
    //    }
    //}
}