using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TransportService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnenq_Click(object sender, EventArgs e)
    {
        try
        {
              MailtoZenith();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enquiry Sent Successfully')", true);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void MailtoZenith()
    {
        string fromAddress = "no-reply@zenithholidays.com";//txtEmail.Text;
        string toAddress = "goa.tranport@zenithhospitality.net";//crs@orchidglobal.net
        string subject = "Transfer Enquiry " + "DESTINATION: " + ddldestination.SelectedItem.Text + " " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        string body = "<div style='background-color: #f2f2f2;font-size:13px;font-weight:400;padding:2% 0'>";
        body += "<div style = 'overflow-x:auto;box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1), -10px 0 10px rgba(0, 0, 0, 0.05);direction: ltr;text-align: left;color: #444;background-color: white;padding: 1.5em;border-radius: 1em;max-width: 550px;margin: 0 auto 0 auto;border-radius:10px;' >";
        body += "<center><img style = 'height:90px;width:150px;' src = 'http://beta.zenithholidays.com/thumb/ZenithTransport.jpg' /></center>"; //http://www.zenithholidays.com/images/logo.png
        body += "<p> Hello Zenith Team,<br /> Please check the transfer enquiry below </p>";
        body += "<table style = 'width: 100%; '>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'>DESTINATION </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'>" + ddldestination.SelectedItem.Text + "</td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'>";
        body += "<td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> TRANSFER DATE </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'>" + txttransfdate.Text.Trim() + "</td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> PICK UP </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + ddlpickup.SelectedItem.Text.Trim() + " </td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> DROP OFF </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'>" + ddldropoff.SelectedItem.Text + "</td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> PICK UP LOCATION </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtpickuploc.Text + " </td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> DROP OFF LOCATION </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtdroploc.Text + " </td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> PICK UP TIME </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtpickuptime.Text + " </td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> ADULTS </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtadults.Text.Trim() + "</td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> CHILDS </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtchild.Text.Trim() + "</td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'>FLIGHT / TRAIN NO </td> <td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'>" + txtflight.Text.Trim() + "</td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'>ENQUIRE NAME </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtName.Text.Trim() + "</td></tr>";
        body += "<tr style = 'background-color:rgba(0, 0, 0, 0.05)'> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> ENQUIRE EMAIL </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd'> " + txtEmail.Text.Trim() + " </td></tr>";
        body += "<tr> <td style = 'width: 27.686%; padding:5px 15px;border:1px solid #ddd'> ENQUIRE PHONE </td><td style = 'width: 66.314%; padding:5px 15px;border:1px solid #ddd' > " + txtPhone.Text.Trim() + " </td></tr>";
        body += "</table </div></div><br/><br/>";
        SmtpClient smtp = new System.Net.Mail.SmtpClient();
        {
            try
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("no-reply@zenithholidays.com", "3bB*e<Xde");
                smtp.Timeout = 20000;
                MailMessage mm = new MailMessage();
                mm.Subject = subject;
                //if (Request.QueryString["agentid"].ToString()==)
                string urlagentid = Request.QueryString["agentid"];
                //if ((urlagentid == "MKY43497") || (urlagentid == "MKY43518") || (urlagentid == "MKY43496") || (urlagentid == "MKY44750") || (urlagentid == "MKY44783") || (urlagentid == "MKY43560") || (urlagentid == "MKY43505") || (urlagentid == "MKY43524") || (urlagentid == "MKY43465") || (urlagentid == "MKY43656") || (urlagentid == "MKY43506") || (urlagentid == "MKY43498") || (urlagentid == "MKY43534") || (urlagentid == "MKY43407") || (urlagentid == "MKY43419") || (urlagentid == "MKY43523"))
                //{
                //    mm.To.Add("director.pk@orchidglobal.net");//director.pk@orchidglobal.net
                //    mm.CC.Add(toAddress);
                //    //mm.ReplyToList.Add(new MailAddress("director.pk@orchidglobal.net"));//.Address("suprakash@orchidglobal.net");

                //}
                //else
                //{
                mm.To.Add(toAddress);
                // mm.CC.Add(txtagentemail.Text);
                mm.CC.Add("paras@zenithholidays.com");
                //}
                mm.From = new MailAddress(fromAddress);
                //mm.Body = body;
                mm.IsBodyHtml = true;
                //mm.Attachments.Add(new Attachment(pfdfile.FileContent, System.IO.Path.GetFileName(pfdfile.FileName)));
               // mm.CC.Add("tech2@orchidglobal.net");
               // mm.CC.Add("suprakash.das@zenithholidays.com");
                mm.Body = body;
                mm.IsBodyHtml = true;
                smtp.Send(mm);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Some problem occured in mail sending')", true);
            }
        }
    }
}