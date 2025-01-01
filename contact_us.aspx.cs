using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;

public partial class contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btncontact_Click(object sender, EventArgs e)
    {
        try
        {
            int x = 0;
            SqlCommand cmd = new SqlCommand("Insert_EnquiryDetails");
            cmd.CommandType = CommandType.StoredProcedure;
            if (txtFastName.Text != "")
            {
                cmd.Parameters.AddWithValue("@Agency_Name", txtFastName.Text + " " + txtLastName.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Agency_Name", "");
            }
            if (txtPhoneno.Text != "")
            {
                cmd.Parameters.AddWithValue("@Mobile_Number", txtPhoneno.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Mobile_Number", "");
            }

            if (txtEmail.Text != "")
            {
                cmd.Parameters.AddWithValue("@MailID", txtEmail.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MailID", "");
            }

            if (txtLocation.Text != "")
            {
                cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Location", "");
            }

            if (datepicker.Text != "")
            {
                cmd.Parameters.AddWithValue("@Travel_Date", datepicker.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Travel_Date", "");
            }
            if (txtMoreDetails.Text != "")
            {
                cmd.Parameters.AddWithValue("@MessageDetail", txtMoreDetails.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MessageDetail", "");
            }
            x = Dataacces.Dataconnection.ExecuteQuery(cmd);
            if (x > 0)
            {
                phello.InnerHtml = "Hello " + txtFastName.Text + ",";
                smstozenith();
                smstocustomer();
                txtLocation.Text = "";
                txtLastName.Text = "";
                txtEmail.Text = "";
                txtPhoneno.Text = "";
                txtFastName.Text = "";
                txtMoreDetails.Text = "";
                Response.Redirect("thankyou.aspx");
                //ClientScript.RegisterStartupScript(typeof(LinkButton), "message", "alert('Your Enquiry Sent Successfully.');", true);
            }
            else
            {
                //MessageBox.PopUp(sender, " Room Type Save Failed....", "Error!!");
                MessageBox.PopUp(sender, "Enquiry Send Failed...", "Error!!");
            }
        }
        catch (Exception ex) { throw ex;/* new Exception("Error: In ExecuteNonquery");*/ }
    }
    public bool SendMail(string From, string To, string subject, string BodyText, string FilePath, string fileType)
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(txtEmail.Text, "Enquiry Request form");

            foreach (var address in To.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries))
            {
                mm.To.Add(address);
            }
            mm.Subject = subject;
            mm.Body = BodyText;
            mm.IsBodyHtml = true;
            mm.BodyEncoding = Encoding.ASCII;
            SmtpClient objClient = new SmtpClient("smtp.gmail.com", 587);
            objClient.EnableSsl = true;
            objClient.Send(mm);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public void smstozenith()
    {
        string fromAddress = txtEmail.Text;
        string toAddress = "web@zenithholidays.com";
        const string fromPassword = "3bB*e<Xde";
        string subject = "Package Enquiry " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        string body = "Hello  " + "Zenith Team" + "<br />";
        body += "Please Check the enquiry below." + "<br/><br/>";
        body += "Client Name" + ":-" + txtFastName.Text.Trim() + "," + "<br/>";
        body += "No of Adult" + ":-" + ddladults.Text.Trim() + "," + "<br/>";
        body += "Location" + ":-" + txtLocation.Text.Trim() + "," + "<br/>";
        body += "Date of Travel" + ":-" + datepicker.Text.Trim() + "," + "<br/>";
        body += "Mobile No" + ":-" + txtPhoneno.Text.Trim() + "," + "<br/>";
        body += "E-Mail" + ":-" + txtEmail.Text.Trim() + "," + "<br/>";
        body += "Details" + ":-" + txtMoreDetails.Text.Trim() + "," + "<br/>";
        SmtpClient smtp = new System.Net.Mail.SmtpClient();
        {
            try
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("no-reply@zenithholidays.com", fromPassword);
                smtp.Timeout = 20000;
                MailMessage mm = new MailMessage();
                mm.Subject = subject;
                mm.To.Add(toAddress);
                mm.From = new MailAddress(fromAddress);
                mm.IsBodyHtml = true;
                mm.CC.Add("sanjoy.bose@zenithholidays.com");
                mm.CC.Add("anindya.roy@zenithholidays.com");
                mm.CC.Add("neeshu@zenithholidays.com");
                mm.CC.Add("paras@zenithholidays.com");
                mm.CC.Add("delhi@zenithholidays.com");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch
            {
            }
        }
    }
    public string GetMailBody()
    {
        StringBuilder htmlResponsehd = new StringBuilder();
        using (StringWriter swhd = new StringWriter(htmlResponsehd))
        {
            using (HtmlTextWriter textWriterhd = new HtmlTextWriter(swhd))
            {
                tblbody.RenderControl(textWriterhd);
            }
        }
        string emailHtmlHd = htmlResponsehd.ToString();
        return emailHtmlHd;
    }
    public void smstocustomer()
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(txtEmail.Text);
        mail.From = new MailAddress("web@zenithholidays.com" + "");
        mail.Subject = "Package Enquiry " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        mail.Body = GetMailBody();
        mail.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        NetworkCredential credentials = new NetworkCredential("no-reply@zenithholidays.com", "3bB*e<Xde");
        client.Credentials = credentials;
        try
        {
            client.Send(mail);
        }
        catch
        {
        }
    }
    
}