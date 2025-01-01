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

public partial class Andaman_Ex_Delhi : System.Web.UI.Page
{
    string source = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["source"]))
        {
            source = Request.QueryString["source"];
        }
        else
        {
            source = "Web";
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        try
        {
            mailbody ml = new mailbody();
            ml.savemaildetail(txtnamep.Value, emailp.Value, phonp.Value, packagep.Value, cityp.Value, " ", 0, "GIT", "Andaman-Ex-Delhi", source);
            ml.smstozenith_Quickcontact(emailp.Value, txtnamep.Value, phonp.Value, emailp.Value, packagep.Value);// SMS TO COMPANY
            //txtnamep.Value = emailp.Value = phonp.Value = cityp.Value = packagep.Value = "";
            //Session["Enquiry_Id"] = ml.enqid;
            txtnamep.Value = emailp.Value = phonp.Value = packagep.Value = cityp.Value = "";
            Response.Redirect("../thankyou.aspx");
        }
        catch (Exception ex) { throw ex; }
    }
    //protected void submitmodul_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        mailbody ml = new mailbody();
    //        ml.savemaildetail(firstName.Value, emailn.Value, tel.Value, "", messagem.Value, "", 0, "", "");
    //        ml.smstozenith_Quickcontact(emailm.Value, namem.Value, phonem.Value, "", messagem.Value);// SMS TO COMPANY
    //        Session["Enquiry_Id"] = ml.enqid;
    //        Response.Redirect("~/thankyou.aspx");
    //    }
    //    catch (Exception ex) { throw ex; }

    //}
    //public bool SendMail(string From, string To, string subject, string BodyText, string FilePath, string fileType)
    //{
    //    try
    //    {
    //        MailMessage mm = new MailMessage();
    //        mm.From = new MailAddress(emailp.Value, "Enquiry Request form");
    //        foreach (var address in To.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries))
    //        {
    //            mm.To.Add(address);
    //        }
    //        mm.Subject = subject;
    //        mm.Body = BodyText;
    //        mm.IsBodyHtml = true;
    //        mm.BodyEncoding = Encoding.ASCII;
    //        SmtpClient objClient = new SmtpClient("smtp.gmail.com", 587);
    //        objClient.EnableSsl = true;
    //        objClient.Send(mm);
    //        return true;
    //    }
    //    catch (Exception ex)
    //    {
    //        return false;
    //        throw ex;
    //    }
    //}
}