using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using Zenithholidays;
/// <summary>
/// Summary description for mailbody
/// </summary>
public class mailbody
{
    DbConnect dc = new DbConnect();
    public mailbody()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int enqid = 0;
    string city = "";
    string Pkg_name = "";
    public void savemaildetail(string name, string mailid, string mobileno, string message, string Location, string date, string adult, string pkgtype, string Pkgname, string Source_Enquiry, string Child)
    {
        try
        { 
            SqlCommand cmd = new SqlCommand("Insert_EnquiryDetails");
            cmd.CommandType = CommandType.StoredProcedure;
            if (name != "")
            {
                cmd.Parameters.AddWithValue("@Agency_Name", name.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Agency_Name", "");
            }
            if (mailid != "")
            {
                cmd.Parameters.AddWithValue("@MailID", mailid.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@MailID", "");
            }
            if (mobileno != "")
            {
                cmd.Parameters.AddWithValue("@Mobile_Number", mobileno.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Mobile_Number", "");
            }

            if (message != "")
            {
                cmd.Parameters.AddWithValue("@MessageDetail", message.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@MessageDetail", "");
            }

            if (Location != "")
            {
                cmd.Parameters.AddWithValue("@Location", Location.ToString());
                city = Location.ToString();
            }
            else
            {
                cmd.Parameters.AddWithValue("@Location", null);
            }

            if (date != "")
            {
                cmd.Parameters.AddWithValue("@Travel_Date", date.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Travel_Date", null);
            }
            if (adult.ToString() != "")
            {
                cmd.Parameters.AddWithValue("@Adults", adult.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Adults", "");
            }
            cmd.Parameters.AddWithValue("@FIT_GIT", pkgtype);
            cmd.Parameters.AddWithValue("@Package_Name", Pkgname);
            cmd.Parameters.AddWithValue("@Source_Enquiry", Source_Enquiry.ToString());
            Pkg_name = Pkgname.ToString();
            //x = Dataacces.Dataconnectionmky.ExecuteQuery(cmd);@Package_Name
            DataTable dtid = new DataTable();
            Dataacces.Dataconnection dcml = new Dataacces.Dataconnection();
            dtid = dcml.RetrieveRecordsdt(dtid, cmd);
            if (dtid.Rows.Count > 0)
            {
                enqid = Convert.ToInt32(dtid.Rows[0]["Enquiry_Id"].ToString());
            }
        }
        catch (Exception ex) { throw ex; }
    }

    public void smstozenith_Quickcontact(string mailid, string ClientName, string Mobile, string Mail, string Details)
    {
        string fromAddress = mailid;
        string toAddress = "#";// web@zenithholidays.com
        const string fromPassword = "#";
        string subject = "Package Enquiry " + Pkg_name+" "+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        string body = "Hello  " + "Orchid Team" + "<br />";
        body += "Please Check the Enquiry below." + "<br/><br/>";
        body += "Client Name" + ":-" + ClientName + "," + "<br/>";
        body += "Mobile No" + ":-" + Mobile + "," + "<br/>";
        body += "E-Mail" + ":-" + Mail + "," + "<br/>";
        body += "Details" + ":-" + Details + "," + "<br/>";
        body += "City" + ":-" + city + "," + "<br/>";
        if (Pkg_name != "")
        {
            body += "Package" + ":-" + Pkg_name + "," + "<br/>";
        }
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
                mm.CC.Add("suprakash@orchidglobal.net");
                //mm.CC.Add("sanjoy@orchidglobal.net");
                mm.Bcc.Add("neeraj@orchidglobal.net");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {

            }
        }
    }
    public void smstocustomer_Quickcontact(string mailidcustomer, string mailbody)
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(mailidcustomer);
        mail.From = new MailAddress("no-reply@orchidglobal.net" + "");//web@zenithholidays.com
        mail.Subject = "Package Enquiry " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        mail.Body = mailbody;
        mail.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        NetworkCredential credentials = new NetworkCredential("no-reply@orchidglobal.net", "bN4yY*2gh");
        client.Credentials = credentials;
        try
        {
            client.Send(mail);
        }
        catch
        {
        }
    }
    public void FillDepartureDate(ref DropDownList ddl, string pkgcode )
    {
        try
        {
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@Pkg_code", pkgcode);
            dc.dt.Rows.Add("@p_SubOpMode", 3);
            DataSet m_ddl = new DataSet();
            dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddl);
            if (m_ddl.Tables[0].Rows.Count > 0)
            {
                ddl.DataSource = m_ddl;
                ddl.DataTextField = "Departure_Date";
                ddl.DataValueField = "Pkg_CostId";
                ddl.DataBind();
                //ddl.Items.Insert(0, "---Select Date---");
                //ddlSelectDate.DataBind();
                //ddlSelectDate.Items.Insert(0, "--- Select Currency ---");

                //ddlpkg.DataSource = ds;
                //ddlpkg.DataTextField = "Pkg_name";
                //ddlpkg.DataValueField = "Pkg_id";
                //ddlpkg.DataBind();
            }

        }
        catch (Exception ex) { throw ex; }
    }
    public void FillDepartureCity(ref DropDownList ddlc, string pkgcode)
    {
        try
        {
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@Pkg_code", pkgcode);
            dc.dt.Rows.Add("@p_SubOpMode", 4);
            DataSet m_ddlc = new DataSet();
            dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddlc);
            if (m_ddlc.Tables[0].Rows.Count > 0)
            {
                ddlc.DataSource = m_ddlc;
                ddlc.DataTextField = "Boarding_place";
                ddlc.DataValueField = "Boarding_id";
                ddlc.DataBind();

                //ddlSelectDate.DataBind();
                //ddlSelectDate.Items.Insert(0, "--- Select Currency ---");

                //ddlpkg.DataSource = ds;
                //ddlpkg.DataTextField = "Pkg_name";
                //ddlpkg.DataValueField = "Pkg_id";
                //ddlpkg.DataBind();
            }

        }
        catch (Exception ex) { throw ex; }
    }
    public void FillState(ref DropDownList ddls)
    {
        try
        {
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@p_SubOpMode", 5);
            DataSet m_ddlc = new DataSet();
            dc.pfn_GetData("Z_NewPkgMasterDetails", ref m_ddlc);
            if (m_ddlc.Tables[0].Rows.Count > 0)
            {
                ddls.DataSource = m_ddlc;
                ddls.DataTextField = "State_Name";
                ddls.DataValueField = "State_Id";
                //ddls.DataBind();
                ddls.DataBind();
                ddls.Items.Insert(0, "---Select State---");

                //ddlpkg.DataSource = ds;
                //ddlpkg.DataTextField = "Pkg_name";
                //ddlpkg.DataValueField = "Pkg_id";
                //ddlpkg.DataBind();
            }

        }
        catch (Exception ex) { throw ex; }
    }
    public void RegistationSave(string FirstName,string LastName,string EmailId,string PhoneNumber,string Password,string DateOfBirth,string Country)
    {
        try
        {
            string m_sMessage = "";
            dc.dt = null;
            dc.dt = new DataTable();
            dc.dt.Columns.Add("COLUMN", typeof(string));
            dc.dt.Columns.Add("VALUE", typeof(object));
            dc.dt.Rows.Add("@p_SubOpMode", 3);
            dc.dt.Rows.Add("@Emp_FirstName", FirstName);
            dc.dt.Rows.Add("@Emp_LastName", LastName);
            dc.dt.Rows.Add("@Emailid", EmailId);
            dc.dt.Rows.Add("@Phone_no", PhoneNumber);
            dc.dt.Rows.Add("@UserPassword", Password);
            dc.dt.Rows.Add("@DOB", DateOfBirth);
            dc.dt.Rows.Add("@Country", Country);
            m_sMessage = dc.OperateData("Z_NewPkgMasterDetails", (int)Operation.Insert);
            if (m_sMessage.IndexOf("Error") != 0)
            {
                
            }
            else
            {
               
            }
        }
        catch (Exception ex) { throw ex; }
    }
    public void Mailto_RegisteredUser(string email, string userfirstname, string userlastname, string password)
    {
        string fromAddress = "no-reply@orchidglobal.net";//txtEmail.Text;
        string toAddress = email.Trim();//crs@orchidglobal.net
        const string fromPassword = "bN4yY*2gh";
        string subject = "Registering Orchidglobal on " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " is successful";
        string body = "<div style='background-color: #f2f2f2;font-size:13px;font-weight:400;padding:2% 0'><div style= 'overflow-x:auto;box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1), -10px 0 10px rgba(0, 0, 0, 0.05);direction: ltr;text-align: left;color: #444;background-color: white;padding: 1.5em;border-radius: 1em;max-width: 550px;margin: 0 auto 0 auto;border-radius:10px;'><center><img style='height:90px;width:150px;' src='http://mytravelpass.orchidglobal.net/Image/orchidglobal.png' /></center>";
        body += "<h3>Hi " + userfirstname + " " + userlastname + "</h3>";
        body += " <table style='width: 100%; '>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>Thank you for registering your website!</td></tr>";
        body += "<tr > <td style='width: 60%; padding:5px 15px;border:0px solid #ddd'>Your Login id</td><td style='width: 40%; padding:5px 15px;border:0px solid #ddd'>" + email + "</td></tr>";
        body += "<tr > <td style='width: 60%; padding:5px 15px;border:0px solid #ddd'>Your Password</td><td style='width: 40%; padding:5px 15px;border:0px solid #ddd'>" + password + "</td></tr>";
        body += "<tr > <td style='width: 100%; padding:5px 15px;border:0px solid #ddd' colspan='2'>Enjoy Great Offers on mytravelpass.orchidglobal.net/</td></tr>";
        body += "<tr> <td style='width: 50%; padding:5px 15px;border:0px solid #ddd'>Call us : 91 6290952054</td><td style='width: 50%; padding:5px 15px;border:0px solid #ddd'>" + "Visit:http://mytravelpass.orchidglobal.net/" + "</td></tr>";
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
                mm.Bcc.Add("neeraj@orchidglobal.net");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {

            }
        }
    }
    //public void smstocustomer_Quickcontact(string mailidcustomer, string logo)
    //{
    //    MailMessage mail = new MailMessage();
    //    mail.To.Add(mailidcustomer);
    //    mail.From = new MailAddress("neeraj@merakey.com");
    //    mail.Subject = "Package Enquiry " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    //    mail.Body = "<a href=http://Zenithholidays.com/" + " target=" + "_blank" + "<img src=" + "http://Zenithholidays.com/img/logo_mail.png" + "/></a>";
    //    mail.Body += "<p><hr></p>";
    //    mail.Body += "<p>Subject</p>";
    //    mail.Body += "<p>&nbsp;&nbsp;&nbsp;Zenith Holidays Package Enquiry</p>";
    //    mail.Body += "<p><hr></p>";
    //    mail.Body += " <p>Hello " + "Neeraj,</p>";
    //    mail.Body += "<p><b>Thank you for showing interest in our Holiday Packages. Our support team will get back to you within 1 hour with the required information.</b></p>";
    //    mail.Body += "<p><b>We look forward to being of service to you and thank you for choosing Zenithholidays.com</b></p>";
    //    mail.Body += "<p></p>";
    //    mail.Body += "<p><b>Zenith Customer Service &nbsp;&nbsp;&nbsp;<b>Mail:web@zenithholidays.com</b></p>";
    //    mail.Body += "<p></p>";
    //    mail.Body += "<p><b>zenithholidays.com</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Contact No: 08100667733</b></p>";
    //    mail.IsBodyHtml = true;
    //    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
    //    client.EnableSsl = true;
    //    NetworkCredential credentials = new NetworkCredential("no-reply@zenithholidays.com", "3bB*e<Xde");
    //    client.Credentials = credentials;
    //    try
    //    {
    //        client.Send(mail);
    //    }
    //    catch
    //    {
    //    }
    //}
}