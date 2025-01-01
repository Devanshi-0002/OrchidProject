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
public partial class Home : System.Web.UI.Page
{
    DbConnect m = new DbConnect();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Show_RecommendedHolidays();
            Show_FeaturedDestinationsn();
        }
        if (Session["Login_Id"] != null && Session["Emailid"] != null && Session["Phone_no"] != null && Session["UserPassword"] != null && Session["Emp_FirstName"] != null && Session["Emp_LastName"] != null)
        {
            Show_RecommendedHolidays();
            Show_FeaturedDestinationsn();
        }
        else
        {
            Show_RecommendedHolidays();
            Show_FeaturedDestinationsn();
            
        }
    }
    
    public void Show_RecommendedHolidays()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("FillAll_Destination");//FillAll_Destination Show_PackagegDetails_New
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Destination"," ");
            //cmd.Parameters.AddWithValue("@Destination", " ");Repeater1
            DataTable dsd = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dsd = dts.RetrieveRecordsdt(dsd, cmd);
            if (dsd.Rows.Count > 0)
            {
                DataListDomestic.DataSource = dsd;
                DataListDomestic.DataBind();
            }
            else
            {
                dsd = null;
                DataListDomestic.DataSource = dsd;
                DataListDomestic.DataBind();
            }
        }
        catch (Exception ex) { throw ex; }
    }
    public void Show_FeaturedDestinationsn()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Fill_FeaturedDestinations");//FillAll_Destination Show_PackagegDetails_New
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@Destination","");
            //cmd.Parameters.AddWithValue("@Destination", " ");
            DataTable dst = new DataTable();
            Dataacces.Dataconnection dts = new Dataacces.Dataconnection();
            dst = dts.RetrieveRecordsdt(dst, cmd);
            if (dst.Rows.Count > 0)
            {
                rptr_FeaturedDestinationsn.DataSource = dst;
                rptr_FeaturedDestinationsn.DataBind();
            }
            else
            {
                dst = null;
                rptr_FeaturedDestinationsn.DataSource = dst;
                rptr_FeaturedDestinationsn.DataBind();
            }
        }
        catch (Exception ex) { throw ex; }
    }

    protected string GetTitle(object obj)
    {
        return obj.ToString().Replace(' ', '-').TrimEnd('.');
    }
    protected void lnkbtnInternationalBook_Click(object sender, EventArgs e)
    {
        //
        LinkButton lnksender = (LinkButton)sender;
        if (lnksender.CommandArgument.ToString() != "")
        {
            string id = lnksender.CommandArgument;
            //Response.Redirect("Destinations?Zenith=" + id.Trim());
            ////string url = "";
            //string id = lnksender.CommandArgument;
            string pkgtype = lnksender.CommandName;
            if (pkgtype == "International")
            {
                //Request.Form["iiid"].ToString("") = id.ToString();
                Response.Redirect("international-holidays.aspx?destination=" + id.Trim());
                //string url = HttpContext.Current.Request.Url.AbsoluteUri;
                //Uri uri = new UriBuilder(url).Uri;
                //string versionString = uri.Segments[3]; // v1/
                //int version = int.Parse(Regex.Match(versionString, @"\d+").Value);
                //z = version.ToString();

                //string hl = GetTitle(id);
                // Response.Redirect("international-holidays.aspx//" +"Zenith"+ id + "//" + hl); 

            }
            else
            {
                Response.Redirect("holidays-in-india.aspx?destination=" + id.Trim());
            }
        }
    }
    protected void lnkbtn_FeaturedDestinations_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)sender;
        string id = lnkbtn.CommandArgument;
        string pkgtype = lnkbtn.CommandName;
        if (pkgtype == "International")
        {
            Response.Redirect("international-holidays.aspx?destination=" + id.Trim());
        }
        else
        {
            Response.Redirect("holidays-in-india.aspx?destination=" + id.Trim());
        }

        //LinkButton lnkbtn = (LinkButton)sender;
        //if (lnkbtn.CommandArgument.ToString() != "")
        //{
        //    string id = lnkbtn.CommandArgument;
        //    Response.Redirect("Destinations?Zenith=" + id.Trim());
        //}
    }
    //[System.Web.Script.Services.ScriptMethod()]
    //[System.Web.Services.WebMethod]
    //public static List<string> Listofdestination(string prefixText)
    //{
    //    using (SqlConnection sqlconn = new SqlConnection("Data Source=104.199.183.69;Initial Catalog=zenithholidaysdb;User ID=zenithholidaysdb_user;Password=Z%$site0@2016; Connect Timeout=1500"))
    //    {
    //        sqlconn.Open();
    //        SqlCommand cmd = new SqlCommand("select Destination from Destination_Search where Destination like '" + prefixText + "%' ", sqlconn);
    //        cmd.Parameters.AddWithValue("@Pkg_name", prefixText);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        DataTable dt = new DataTable();
    //        da.Fill(dt);
    //        List<string> Place = new List<string>();
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            Place.Add(dt.Rows[i]["Destination"].ToString());
    //        }
    //        return Place;
    //    }
    //}
    protected void lnlbtn_SUBSCRIBENOW_Click(object sender, EventArgs e)
    {
        try
        {
            Usermobilenuber();
            if (txt_EmailId.Value == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Please Enter Email id.');", true);
                txt_EmailId.Focus();
            }
            else if (txt_PhoneNo.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Please Enter Mobile Number.');", true);
                txt_PhoneNo.Focus();
            }
            else if (lbl_subscriber_mobileno.InnerText == txt_PhoneNo.Text)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Mobile number already exists.');", true);
                txt_PhoneNo.Focus();
            }
            else if (txt_City.Value == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Please Enter City Name.');", true);
                txt_City.Focus();
            }
            else
            {
                string m_sMessage = "";
                m.dt = null;
                m.dt = new DataTable();
                m.dt.Columns.Add("COLUMN", typeof(string));
                m.dt.Columns.Add("VALUE", typeof(object));
                m.dt.Rows.Add("@p_SubOpMode", 4);
                m.dt.Rows.Add("@Emailid", txt_EmailId.Value);
                m.dt.Rows.Add("@Mobile_Number", txt_PhoneNo.Text);
                m.dt.Rows.Add("@City", txt_City.Value);
                m_sMessage = m.OperateData("sp_tbl_new_PkgMaster", (int)Operation.Insert);
                if (m_sMessage.IndexOf("Error") != 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Subscribe Successfully.');", true);
                    Mailto_subscriberUser();
                    txt_PhoneNo.Text =txt_EmailId.Value=txt_City.Value= "";
                }
                else
                {
                    throw new Exception(m_sMessage.Substring(5, m_sMessage.Length - 5));
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void  Usermobilenuber()
    {
        m.dt = null;
        m.dt = new DataTable();
        m.dt.Columns.Add("COLUMN", typeof(string));
        m.dt.Columns.Add("VALUE", typeof(object));
        m.dt.Rows.Add("@Emailid", txt_EmailId.Value);
        m.dt.Rows.Add("@Mobile_Number", txt_PhoneNo.Text);
        m.dt.Rows.Add("@p_SubOpMode", 8);
        DataSet dsp = new DataSet();
        m.pfn_GetData("sp_tbl_new_PkgMaster", ref dsp);
        if (dsp.Tables[0].Rows.Count > 0)
        {
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Mobile number Already Exists..!');", true);
            //txt_PhoneNo.Text = "";
            //txt_PhoneNo.Focus();
            //lbl_packagenameCkeck.InnerText = dsp.Tables[0].Rows[0]["Pkg_name"].ToString();
            lbl_subscriber_mobileno.InnerText = dsp.Tables[0].Rows[0]["Mobile_Number"].ToString();
           
        }
        //else
        //{
        //    txt_City.Focus();
        //}
    }
    public void Mailto_subscriberUser()
    {
        string fromAddress = "no-reply@orchidglobal.net";//txtEmail.Text;
        string toAddress = txt_EmailId.Value.Trim();//crs@orchidglobal.net
        const string fromPassword = "bN4yY*2gh";
        string subject = "Subscribe OrchidGlobal on " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " is successful";
        string body = "<div style='background-color: #f2f2f2;font-size:13px;font-weight:400;padding:2% 0'><div style= 'overflow-x:auto;box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1), -10px 0 10px rgba(0, 0, 0, 0.05);direction: ltr;text-align: left;color: #444;background-color: white;padding: 1.5em;border-radius: 1em;max-width: 550px;margin: 0 auto 0 auto;border-radius:10px;'><center><img style='height:90px;width:150px;' src='http://mytravelpass.orchidglobal.net/Image/orchidglobal.png' /></center>";
        body += "<p>Hi " + txt_EmailId.Value + "</p>";
        body += " <table style='width: 100%; '>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>Thanks for subscribing!</td></tr>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>You’ve been added to our mailing list and will now be among the first to hear about OrchidGlobal deals!</td></tr>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>Our newsletter is designed to provide you maximum information regarding holiday offers, hotel deals & destination information. The newsletter is designed for your convenience and information.</td></tr>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>Enjoy Great Offers on mytravelpass.orchidglobal.net/</td></tr>";
        body += "<tr> <td style='width: 50%; padding:5px 15px;border:0px solid #ddd'>Call us : 1800112277</td><td style='width: 50%; padding:5px 15px;border:0px solid #ddd'>" + "Visit:mytravelpass.orchidglobal.net/" + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Room Configuration</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_RoomConfiguration.Text + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Payment Option</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + "Full" + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Name</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["firstname"].ToString() + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Email</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["email"].ToString().Trim() + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)'> <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Customer Phone</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["phone"].ToString() + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Booking ID</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + Session["BookingID"].ToString().Trim() + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Booking Status</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + "Successful" + "</td></tr>";
        //body += "<tr style='background-color:rgba(0, 0, 0, 0.05)' > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Mode of Payment </td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + "Debit Card" + "</td></tr>";
        //body += "<tr > <td style='width: 40%; padding:5px 15px;border:1px solid #ddd'>Amount Received ( Rs)</td><td style='width: 60%; padding:5px 15px;border:1px solid #ddd'>" + lbl_amount.Text + "</td></tr>";
       
        body += "</table></div></div><br/><br/>";
        SmtpClient smtp = new System.Net.Mail.SmtpClient();
        {
            try
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("no-reply@orchidglobal.net", fromPassword);
                smtp.Timeout = 20000;
                MailMessage mm = new MailMessage();
                mm.Subject = subject;
                mm.To.Add(toAddress);
                mm.From = new MailAddress(fromAddress);
                mm.IsBodyHtml = true;
                //mm.CC.Add("sanjoy.bose@zenithholidays.com");
                // mm.CC.Add("anindya.roy@zenithholidays.com");
                //mm.CC.Add("paras@zenithholidays.com");
                //mm.CC.Add("neeshu@zenithholidays.com");
                //mm.CC.Add("delhi@zenithholidays.com");
                mm.CC.Add("neeraj@orchidglobal.net");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {

            }
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
}
